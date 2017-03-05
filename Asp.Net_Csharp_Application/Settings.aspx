<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Settings.aspx.cs" Inherits="Asp.Net_Csharp_Application.Settings" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table cellpadding="0" cellspacing="0" class="style1">
            <tr>
                <td align="center">
&nbsp;<asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/SendSMS.aspx" Target="_self">إرسال رسالة</asp:HyperLink>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Settings.aspx" 
                        Target="_self">الإعدادات</asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td align="center" style="font-weight: bold">
                    الإعدادات</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="center">
                    <table cellpadding="0" cellspacing="0" width="90%">
                        <tr>
                            <td align="right" style="width: 65%">
                                <asp:Label ID="Label1" runat="server" ForeColor="Red" 
                                    Text="http://www.MyDomain.com"></asp:Label>
                            </td>
                            <td style="width: 35%">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="right" style="width: 65%">
                                <asp:TextBox ID="TxtDomain" runat="server" ValidationGroup="account" 
                                    Width="300px"></asp:TextBox>
                            </td>
                            <td style="width: 35%">
                                الموقع</td>
                        </tr>
                        <tr>
                            <td align="right" style="width: 65%">
                                <asp:Label ID="Label2" runat="server" ForeColor="Red" 
                                    Text="يتم الحصول عليه من صاحب الموقع"></asp:Label>
                                <asp:TextBox ID="TxtPrivateFolder" runat="server" Width="300px"></asp:TextBox>
                            </td>
                            <td style="width: 35%">
                                مسار الفولدر الخاص</td>
                        </tr>
                        <tr>
                            <td align="right" style="width: 65%">
                                <asp:TextBox ID="TxtUserName" runat="server" ValidationGroup="account" 
                                    Width="300px"></asp:TextBox>
                            </td>
                            <td style="width: 35%">
                                إسم المستخدم</td>
                        </tr>
                        <tr>
                            <td align="right" style="width: 65%">
                                <asp:TextBox ID="TxtPassword" runat="server" TextMode="Password" 
                                    ValidationGroup="account" Width="300px"></asp:TextBox>
                            </td>
                            <td style="width: 35%">
                                كلمة المرور</td>
                        </tr>
                        <tr>
                            <td align="right" style="width: 65%">
                                <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="حفظ" 
                                    ValidationGroup="account" Width="60px" />
                            </td>
                            <td style="width: 35%">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="right" style="width: 65%">
                                <asp:Label ID="LabelError" runat="server" ForeColor="#FF3300" Visible="False"></asp:Label>
                            </td>
                            <td style="width: 35%">
                                &nbsp;</td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="center">
                    <table cellpadding="0" cellspacing="0" width="90%">
                        <tr>
                            <td align="right" style="width: 65%">
                                &nbsp;</td>
                            <td style="width: 35%">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="right" style="width: 65%">
                                <asp:DropDownList ID="DDLSenders" runat="server" Width="300px">
                                </asp:DropDownList>
                            </td>
                            <td style="width: 35%">
                                إختر السيندر لتجعله إفتراضى</td>
                        </tr>
                        <tr>
                            <td align="right" style="width: 65%">
                                <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="حفظ" 
                                    ValidationGroup="account" Width="60px" />
                            </td>
                            <td style="width: 35%">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="right" style="width: 65%">
                                <asp:Label ID="LabelError0" runat="server" ForeColor="#FF3300" Visible="False"></asp:Label>
                            </td>
                            <td style="width: 35%">
                                &nbsp;</td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
