<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="RestaurantFinder.AdminLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Login</title>
    <link href="main.css" rel="stylesheet" />
</head>
<div style= "text-align:center" >
           <h2 style ="font-family: Algerian;">ADMIN LOGIN</h2><center>
               </br>
                 </br>
    <form id="form1" runat="server" style="border:1px solid #ccc;background-color:white;box-shadow:0px 0px 20px;opacity:1;">
       <br/><br/>
        <div class="container">
         <label style="font-family:Helvetica;"><b>USERNAME</b></label> 
                 </br>
                  :<asp:TextBox ID="txtUserName" CssClass="input" runat="server">
                  </asp:TextBox>
            </br>
                 <label style="font-family:Helvetica;"><b>PASSWORD</b></label>  
                  </br>
                 :<asp:TextBox ID="txtPassword" TextMode="Password" CssClass="input" runat="server"></asp:TextBox>
      </br>
            <div class="container">
                 <asp:CheckBox ID="chkBoxRememberMe" runat="server" Text="Remember me" />
                 </br>   
                 <asp:Button ID="btnLogin" CssClass="login" runat="server" Text="Login" OnClick="btnLogin_Click" />
                  </br> 
                 <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
      

</div></div>
    </form></center>
          </div>
</body>
</html>
