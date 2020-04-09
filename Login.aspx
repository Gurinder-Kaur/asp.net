<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="RestaurantFinder.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>User Login</title>
    <link href="main.css" rel="stylesheet" />
</head>
<body>
     <div style= "text-align:center" >
           <h2 style ="font-family: Algerian;">LOGIN</h2><center>
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
            </br>
            <label style="font-family:Helvetica;"><b>PASSWORD</b></label>  
             </br>
            :<asp:TextBox ID="txtPassword" TextMode="Password" CssClass="input" runat="server">
            </asp:TextBox>
            <div class="container">
                 <asp:CheckBox ID="chkBoxRememberMe" runat="server" Text="Remember me" />
                  </br>
                  <asp:Button ID="btnLogin" CssClass="login" runat="server" Text="Login" OnClick="btnLogin_Click" />
                  </br>
                 <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
                <br />
             <div class="container">
            <a href="Registration/Register.aspx">Click here to register</a> 
            if you do not have a user name and password.
                 </br>
                 </br>
            </div>
                </div></div>
    </form></center>
          </div>
</body>
</html>
