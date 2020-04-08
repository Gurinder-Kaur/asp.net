<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="RestaurantFinder.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register Youself</title>
    <link href="~/main.css" rel="stylesheet" />
</head>
<body>
     <div style= "text-align:center">
            <h2 style="font-family:Algerian;"><b>REGISTER YOURSELF</b></h2><center>
                </br></br>
            <form id="form1" runat="server" style="border:1px solid #ccc;background-color:white;box-shadow:0px 0px 20px;opacity:1;">
       <br/><br/>
     
     <div class="container">
      <label style="font-family:Helvetica;"><b>USER NAME</b></label><br/>
         :<asp:TextBox ID="txtUserName" CssClass="input" runat="server">
            </asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorusername" 
            runat="server" ErrorMessage="User Name required" Text="*"
            ControlToValidate="txtUserName" ForeColor="Red"></asp:RequiredFieldValidator>
     </br></br>
            <label style="font-family:Helvetica;"><b>PASSWORD</b></label>
        </br>
            :<asp:TextBox ID="txtPassword" TextMode="Password" CssClass="input" runat="server">
            </asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassword" 
            runat="server" ErrorMessage="Password required" Text="*"
            ControlToValidate="txtPassword" ForeColor="Red"></asp:RequiredFieldValidator>
      </br></br>
            <label style="font-family:Helvetica;"><b>CONFIRM PASSWORD</b></label>
        </br>
            :<asp:TextBox ID="txtConfirmPassword" TextMode="Password" CssClass="input" runat="server">
            </asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorConfirmPassword" 
            runat="server" ErrorMessage="Confirm Password required" Text="*"
            ControlToValidate="txtConfirmPassword" ForeColor="Red" 
            Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CompareValidatorPassword" runat="server" 
            ErrorMessage="Password and Confirm Password must match"
            ControlToValidate="txtConfirmPassword" ForeColor="Red" 
            ControlToCompare="txtPassword" Display="Dynamic"
            Type="String" Operator="Equal" Text="*"></asp:CompareValidator>
           </br></br>
          <label style="font-family:Helvetica;"><b>EMAIL</b></label>
        </br>
            :<asp:TextBox ID="txtEmail" runat="server" CssClass="input">
            </asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" 
            runat="server" ErrorMessage="Email required" Text="*"
            ControlToValidate="txtEmail" ForeColor="Red"
            Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidatorEmail" 
            runat="server" ErrorMessage="Invalid Email" ControlToValidate="txtEmail"
            ForeColor="Red" Display="Dynamic" Text="*"
            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
            </asp:RegularExpressionValidator>
       <br>
            <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="register"
            onclick="btnRegister_Click"/>
       <br>
            <asp:Label ID="lblMessage" runat="server" ForeColor="Red">
            </asp:Label>
        </br>
            <asp:ValidationSummary ID="ValidationSummary1" ForeColor="Red" runat="server" />
        </br>
</div>
    </form></center></div>
</body>
</html>
