using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Net;
using System.Xml;
using System.Xml.XPath;
using System.Security.Permissions;

namespace Asp.Net_Csharp_Application
{
    public partial class Settings : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadData();
                LoadSenders();
            }
        }

        private void LoadData()
        {
            // API.xml إسم الملف XML تم إستعادة بيانات الدومين من ملف 
            //
            XmlDataDocument doc = new XmlDataDocument();
            doc.Load(Server.MapPath("XML/MyAccount.xml"));
            XmlNodeList Account = doc.GetElementsByTagName("Account");
            foreach (XmlNode node in Account)
            {
                XmlElement Link = (XmlElement)node;
                ViewState.Add("Domain", Link.GetElementsByTagName("Domain")[0].InnerText);
                TxtDomain.Text = Link.GetElementsByTagName("Domain")[0].InnerText;
                ViewState.Add("Password", Link.GetElementsByTagName("Password")[0].InnerText);
                TxtPassword.Text = Link.GetElementsByTagName("Password")[0].InnerText;
                ViewState.Add("Username", Link.GetElementsByTagName("Username")[0].InnerText);
                TxtUserName.Text = Link.GetElementsByTagName("Username")[0].InnerText;
                ViewState.Add("PrivateFolder", Link.GetElementsByTagName("PrivateFolder")[0].InnerText);
				TxtPrivateFolder.Text = ViewState["PrivateFolder"].ToString();
            }
        }

        private void LoadSenders()
        {
            string returnSenders = "";
            string urlSenders = "";
            urlSenders = ViewState["Domain"].ToString() + "/" + ViewState["PrivateFolder"].ToString() + "/GetAllSenders.php?return=xml&username=" + ViewState["Username"].ToString() + "&password=" + ViewState["Password"].ToString();

            StreamReader strReaderSenders;
            WebRequest webReqSenders = WebRequest.Create(urlSenders);
            WebResponse webResSenders = webReqSenders.GetResponse();

            strReaderSenders = new StreamReader(webResSenders.GetResponseStream());
            returnSenders = strReaderSenders.ReadToEnd();

            XmlDataDocument DocSenders = new XmlDataDocument();
            DocSenders.LoadXml(returnSenders);
            XmlNode SendSMS = DocSenders.SelectSingleNode("/SendSMS");
            XmlElement SendSMS_1 = (XmlElement)SendSMS;

            string ErrorCode = SendSMS_1.GetElementsByTagName("Code")[0].InnerText;
            string ErrorMessage = SendSMS_1.GetElementsByTagName("MessageIs")[0].InnerText;
            if (ErrorCode != "117")
            {
                LabelError0.Visible = true;
                LabelError0.Text = ErrorMessage;
            }
            else
            {
                XmlNodeList SendSMSList = DocSenders.GetElementsByTagName("SendSMS");
                foreach (XmlNode node in SendSMSList)
                {
                    XmlNode SenderArchive = node.SelectSingleNode("SenderArchive");
                    string SenderID = SenderArchive.Attributes["SenderID"].Value.ToString();

                    DDLSenders.Items.Add(new ListItem(SenderArchive.InnerText, SenderID));
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            XmlDataDocument doc = new XmlDataDocument();
            doc.LoadXml("<?xml version='1.0' encoding='UTF-8'?><Account></Account>");
            XPathNavigator nav1 = doc.CreateNavigator();
            nav1.MoveToFirstChild();
            XmlNode AdNode = ((IHasXmlNode)nav1).GetNode();

            XmlElement Domain = doc.CreateElement("Domain");
            Domain.InnerText = TxtDomain.Text;

            XmlElement PrivateFolder = doc.CreateElement("PrivateFolder");
            PrivateFolder.InnerText = TxtPrivateFolder.Text;

            XmlElement Username = doc.CreateElement("Username");
            Username.InnerText = TxtUserName.Text;

            XmlElement Password = doc.CreateElement("Password");
            Password.InnerText = TxtPassword.Text;

            AdNode.AppendChild(Domain);
			AdNode.AppendChild(PrivateFolder);
            AdNode.AppendChild(Username);
            AdNode.AppendChild(Password);
            doc.Save(Server.MapPath("XML/MyAccount.xml"));

            LabelError.Visible = true;
            LabelError.Text = "تم الحفظ بنجاح";
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string returnDefult = "";
            string DfeultUrl = "";
            DfeultUrl = ViewState["Domain"].ToString() + "/" + ViewState["PrivateFolder"].ToString() + "/setDefultSender.php?return=xml&" + Server.UrlDecode("username=" + ViewState["Username"].ToString() + "&password=" + ViewState["Password"].ToString() + "&SenderId=" + DDLSenders.SelectedValue);

            StreamReader strReader;
            WebRequest webReq = WebRequest.Create(DfeultUrl);
            WebResponse webRes = webReq.GetResponse();

            strReader = new StreamReader(webRes.GetResponseStream());

            returnDefult = strReader.ReadToEnd();

            XmlDataDocument DocSenders = new XmlDataDocument();
            DocSenders.LoadXml(returnDefult);
            XmlNode SendSMS = DocSenders.SelectSingleNode("/SendSMS");
            XmlElement SendSMS_1 = (XmlElement)SendSMS;

            string ErrorCode = SendSMS_1.GetElementsByTagName("Code")[0].InnerText;
            string ErrorMessage = SendSMS_1.GetElementsByTagName("MessageIs")[0].InnerText;
            if (ErrorCode != "110")
            {
                LabelError0.Visible = true;
                LabelError0.Text = ErrorMessage;
            }
            else
            {
                LabelError0.Visible = true;
                LabelError0.Text = ErrorMessage;
            }
           
        }
    }
}
