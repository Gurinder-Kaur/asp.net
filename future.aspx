<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="future.aspx.cs" Inherits="RestaurantFinder.future" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
             <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False">
                        <Columns>
                            <asp:BoundField DataField="id" HeaderText="Id" />
                            <asp:BoundField DataField="name" HeaderText="Name" />
                            <asp:BoundField DataField="location" HeaderText="Location" />
                            <asp:TemplateField HeaderText="Logo">
                                <ItemTemplate>
                                    <asp:Image ID="Image1" runat="server" Height="100px" ImageUrl='<%# "data:Image/png;base64,"
                    + Convert.ToBase64String((byte[])Eval("logo")) %>' Width="100px" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="discription" HeaderText="Description" />
                        </Columns>
                    </asp:GridView>
        </div>
    </form>
</body>
</html>
