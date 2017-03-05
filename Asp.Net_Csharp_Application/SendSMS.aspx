<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SendSMS.aspx.cs" Inherits="Asp.Net_Csharp_Application.SendSMS" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>أرسل رسالة</title>
    <style type="text/css">
        .style1
        {
            height: 23px;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server" dir="rtl">
    <div>
        <table width="100%" style="height: 100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td align="center">
                <table dir="ltr" style="width: 696px; height: 273px">
                    <tr>
                        <td align="center" colspan="2" style="height: 115px;" valign="top">
                            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/SendSMS.aspx" Target="_self">إرسال رسالة</asp:HyperLink>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Settings.aspx" 
                        Target="_self">الإعدادات</asp:HyperLink>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="style1">
                            <asp:Label ID="LblBalance" runat="server"></asp:Label></td>
                        <td dir="rtl" align="right" class="style1">
                            الرصيد</td>
                    </tr>
                    <tr>
                        <td align="right" style="width: 590px">
                            <asp:TextBox ID="txtsendername" runat="server"></asp:TextBox>
                        </td>
                        <td valign="top" style="width: 98px" align="right">
                            إسم المرسل</td>
                    </tr>
                    <tr>
                        <td valign="top" align="right" style="width: 590px; height: 26px;">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="TxtNumbers" Display="Dynamic" 
                                ErrorMessage="أدخل الأعضاء المرسل لهم" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                            <asp:TextBox ID="TxtNumbers" runat="server" Height="75px" Width="75%"></asp:TextBox>
                        </td>
                        <td valign="top" style="width: 98px; height: 26px;" align="right">
                            <span id="Label3">الأرقام</span></td>
                    </tr>
                    <tr>
                        <td valign="top" align="right" style="height: 20px;">
                            &nbsp;</td>
                        <td valign="top" style="height: 20px;" align="right">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td valign="top" align="right" style="width: 590px; height: 26px;">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="txtMessage1" Display="Dynamic" 
                                ErrorMessage="أدخل نص الرسالة" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                            <textarea rows="6" style="width:75%" dir="rtl" title="اكتب هنا نص الرسالة" class="SendSMSContent"  
                            name="txtMessage1" runat="server" cols="10" onkeyup="javascript:calcsmsnumbers('1');"
                                 onchange="javascript:calcsmsnumbers('1');" onblur="javascript:calcsmsnumbers('1');"  id="txtMessage1" >
                            </textarea></td>
                        <td valign="top" style="width: 98px; height: 26px;" align="right">
                            <span id="Label2">الرسالة</span></td>
                    </tr>
                    <tr>
                        <td valign="top" align="right" style="width: 590px">
                            &nbsp;</td>
                        <td align="right" valign="top" style="width: 98px">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td align="right" valign="top" colspan="2" style="padding-right: 250px;">
                            <div>
                                <asp:Button ID="BtnSend" runat="server" Text="أرسل" Width="60px" 
                                    onclick="BtnSend_Click" />
                                &nbsp;
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" valign="top" colspan="2" style="padding-right: 250px;">
                            <asp:Label ID="LblMessage" runat="server" ForeColor="#FF3300" Visible="False"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" colspan="2">
                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                                ShowMessageBox="True" ShowSummary="False" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    </div>
    </form>
</body>
</html>
