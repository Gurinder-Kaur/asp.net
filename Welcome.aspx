<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Welcome.aspx.cs" Inherits="RestaurantFinder.Welcome1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
         .btn {
    background-color: white;
    font-weight: bold;
    padding: 10px 18px;
    margin: 8px 0;
    cursor: pointer;
    width: 150px;
    position: absolute;
    right: 10px;
   top: 2px;
   border-radius:12px;
}

    .btn:hover {
        background-color: cadetblue;
        box-shadow: 0px 0px 15px;
    }
    .own{
       
        color:white;
        
        position:absolute;
        margin-top:200px;
        margin-left:100px;
        width:43%;
        height: 70px;
        font-family:cursive;
        font-weight:bold;
        font-size:35px;
        
        
    }
    .another{
        
        color:white;
       
        position:absolute;
        margin-top:300px;
        margin-left:100px;
        width:43%;
        height: 70px;
        font-family:cursive;
        font-weight:bold;
        font-size:35px;
    }
    .future{
         position:absolute;
        margin-top:600px;
        margin-right:10px;
        color:black;
    }

        </style>
</head>
<body style="height: 682px; width: 1354px; margin-left: 0px; margin-top: 0px">
    <form id="form1" runat="server">
        <div style="background-image: url('wooden.jpg'); height: 685px;">
           <div class="own">
               <asp:Label ID="Label1" runat="server" Text="Use your own location"> </asp:Label>
                <asp:Button ID="Button1" runat="server" Text="HERE" CssClass="btn" OnClick="Button1_Click" />
           </div>
            <div class="another">
                <asp:Label ID="Label2" runat="server" Text="Explore another world"></asp:Label>
                <asp:Button ID="Button2" runat="server" Text="THERE" CssClass="btn" OnClick="Button2_Click"/>
            </div>
            <div class="future"><a href="future.aspx">Future work</a>

            </div>
            
        </div>
    </form>
</body>
</html>
