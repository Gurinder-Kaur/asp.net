<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WelcomeAdmin.aspx.cs" Inherits="RestaurantFinder.WelcomeAdmin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            
            <asp:MultiView ID="MultiView1" runat="server">
                <asp:View ID="View1" runat="server">
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Welcome to Admin Page<br />
                    <br />
                    <br /> &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Insert Data" />
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Button2" runat="server" Text="View Data" OnClick="Button2_Click" />
                </asp:View>
                <asp:View ID="View2" runat="server"><br />
                    &nbsp;&nbsp;<table style="border: 1px solid black">
                        <tr>
                            <td colspan="2"><b>Insert your data here</b> </td>
                        </tr>
                        <tr>
                            <td>Restaurant Name </td>
                            <td>:<asp:TextBox ID="txtRestaurantName" runat="server">
            </asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>Location </td>
                            <td>:<asp:TextBox ID="txtLocation" runat="server">
            </asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>Logo </td>
                            <td>
                                <asp:FileUpload ID="FileUpload" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>Discription </td>
                            <td>
                                <asp:TextBox ID="discription" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:Button ID="Button9" runat="server" OnClick="Button9_Click" Text="Submit" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:Label ID="message" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                    </table>
                    &nbsp;<asp:Button ID="Button5" runat="server" Text="Back" OnClick="Button5_Click" />
                </asp:View>
                <asp:View ID="View3" runat="server">This is your data<br />
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
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label1" runat="server" Text="Want to delete any record? Enter ID"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="delId" runat="server"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="Delete Data" />
                    <asp:Button ID="Button6" runat="server" OnClick="Button6_Click" Text="Back" />
                </asp:View>
               
            </asp:MultiView>
            <br />
        </div>
    </form>
</body>
</html>
