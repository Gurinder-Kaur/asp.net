<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Start.aspx.cs" Inherits="RestaurantFinder.Welcome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body, div {
    padding: 0;
    margin: 0;
    font-family: Arial, Consolas, Helvetica, sans-serif;
  }
    .loginbtn {
    background-color: #5f5858;
    font-weight: bold;
    padding: 10px 18px;
    margin: 8px 0;
    cursor: pointer;
    width: 150px;
    position: absolute;
    right: 10px;
   top: 2px;
}

    .loginbtn:hover {
        background-color: cadetblue;
        box-shadow: 0px 0px 15px;
    }
    .admin{
        
        
         margin-top: 500px;
         text-align:center;
    }
        .about {
            margin-right: 500px;
        }
       
   </style>
</head>
    <body style="height: 703px" >
<form id="form" runat="server">
    
    <div style="background-image: url('Gmaps.jpg'); height: 750px;">
         
             <div id="menu" style="background-color: #808080; height: 53px;">
               <asp:Button ID="Button1" runat="server" Text="SignIn" CssClass="loginbtn" OnClick="Button1_Click"/>
        </div>
        <div class ="about"><p>We provide </br><b>ONE CLICK INFOMATION</b></br> about the places you what to know</br><i>near you or far away</i> </p></div>
        <div class="admin">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="AdminLogin.aspx" >Only for admin</a ></div>
        </div>
        </body>
    </form>
</html>
