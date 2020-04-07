<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="RestaurantFinder.AdminLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="font-family:Arial">
<table style="border: 1px solid black">
    <tr>
        <td colspan="2">
            <b>Admin Login</b>
        </td>
    </tr>
    <tr>
        <td>
            User Name
        </td>    
        <td>
            :<asp:TextBox ID="txtUserName" runat="server">
            </asp:TextBox>
        </td>    
    </tr>
    <tr>
        <td>
            Password
        </td>    
        <td>
            :<asp:TextBox ID="txtPassword" TextMode="Password" runat="server">
            </asp:TextBox>
        </td>    
    </tr>
    <tr>
        <td>
                    <asp:CheckBox ID="chkBoxRememberMe" runat="server" Text="Remember me" />
        </td>    
        <td>
            <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />
        </td>    
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
                    
        </td>    
        <td>
            
        </td>    
    </tr>
    

</table>

</div>
    </form>
</body>
</html>
