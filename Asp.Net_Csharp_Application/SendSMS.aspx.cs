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
    public partial class SendSMS : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadAcount();
                Getbalance();
            }
        }

        private void LoadAcount()
        {
            //MyAccount.xml إسم الملف  XML تم إستعادة بيانات الحساب الخاص بالعضو من ملف 
            //ويمكن إتعادتها من قاعدة بيانات إذا كانت مضافة فى جدول 
            XmlDataDocument doc = new XmlDataDocument();
            doc.Load(Server.MapPath("XML/MyAccount.xml"));
            XmlNodeList Account1 = doc.GetElementsByTagName("Account");
            foreach (XmlNode node in Account1)
            {
                XmlElement myNode = (XmlElement)node;
                ViewState.Add("Domain", myNode.GetElementsByTagName("Domain")[0].InnerText);
                ViewState.Add("Username", myNode.GetElementsByTagName("Username")[0].InnerText);
                ViewState.Add("Password", myNode.GetElementsByTagName("Password")[0].InnerText);
            }
        }

        private void Getbalance()
        {
            string return1 = "";
            string url = "";
            url = ViewState["Domain"].ToString() + "/api/getbalance.php?return=xml&username=" + ViewState["Username"].ToString() + "&password=" + ViewState["Password"].ToString();

            StreamReader strReader;
            WebRequest webReq = WebRequest.Create(url);
            WebResponse webRes = webReq.GetResponse();

            strReader = new StreamReader(webRes.GetResponseStream());
            return1 = strReader.ReadToEnd();
            
            XmlDataDocument DocBalance = new XmlDataDocument();
            DocBalance.LoadXml(return1);
            XmlNode SendSMS = DocBalance.SelectSingleNode("/SendSMS");
            XmlElement SendSMS_11 = (XmlElement)SendSMS;

            string ErrorNumber = SendSMS_11.GetElementsByTagName("Code")[0].InnerText;

            if (ErrorNumber == "100")
            {
                LblBalance.Text = SendSMS_11.GetElementsByTagName("currentuserpoints")[0].InnerText;//Balance Is
            }
            else
            {
                LblBalance.Text = "0";
                BtnSend.Visible = false;
                LblMessage.Visible = true;
                LblMessage.Text = "خطأ فى عرض الرصيد";
            }
        }

        protected void BtnSend_Click(object sender, EventArgs e)
        {
            string returnValue = "";
            string url = "";
            url = ViewState["Domain"].ToString() + "/api/sendsms.php?username=" + ViewState["Username"].ToString() + "&password=" + ViewState["Password"].ToString() + "&message=" + txtMessage1.Value + "&numbers=" + TxtNumbers.Text + "&sender=" + txtsendername.Text + "&return=string";

            StreamReader strReader;
            WebRequest webReq = WebRequest.Create(url);
            WebResponse webRes = webReq.GetResponse();

            strReader = new StreamReader(webRes.GetResponseStream());

            returnValue = strReader.ReadToEnd();
            if (!string.IsNullOrEmpty(returnValue))
            {
                if (returnValue == "تم استلام الارقام بنجاح")
                {
                    LblMessage.Visible = true;
                    LblMessage.Text = returnValue;
                }

            }
        }

       
    }
}
