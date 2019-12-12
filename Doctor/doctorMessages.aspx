<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="doctorMessages.aspx.cs" Inherits="FinalProject.Doctor.doctorMessages" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style6 {
            font-size: large;
            color: #0000FF;
            width: 280px;
        }
        .auto-style7 {
            font-size: xx-large;
        }
        .auto-style9 {
            font-size: larger;
        }
        .auto-style10 {
            width: 458px;
        }
        .auto-style11 {
            width: 457px;
            font-size: large;
        }
        .auto-style12 {
            width: 143px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        <table style="width:100%;">
            <tr>
                <td class="auto-style6">Name:
                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                </td>
                <td class="auto-style6">User:
                    <asp:LoginName ID="LoginName1" runat="server" />
                </td>
                <td>
                    <asp:LoginStatus ID="LoginStatus1" runat="server" />
                </td>
            </tr>
        </table>
        <br />
    </p>
    <p class="auto-style7">
        Messages</p>
    <p class="auto-style9">
        Inbox</p>
    <p class="auto-style7">
        <table style="width:100%;">
            <tr>
                <td class="auto-style10">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="MessageID" EmptyDataText="There are no data records to display." ForeColor="#333333" GridLines="None" style="font-size: large" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:CommandField ShowDeleteButton="False" ShowSelectButton="True" />
                            <asp:BoundField DataField="MessageFROM" HeaderText="MessageFROM" SortExpression="MessageFROM" />
                            <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
                        </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [MessagesTable] WHERE [MessageID] = @MessageID" InsertCommand="INSERT INTO [MessagesTable] ([MessageTO], [MessageFROM], [Date], [Message]) VALUES (@MessageTO, @MessageFROM, @Date, @Message)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [MessageID], [MessageTO], [MessageFROM], [Date], [Message] FROM [MessagesTable]" UpdateCommand="UPDATE [MessagesTable] SET [MessageTO] = @MessageTO, [MessageFROM] = @MessageFROM, [Date] = @Date, [Message] = @Message WHERE [MessageID] = @MessageID">
                        <DeleteParameters>
                            <asp:Parameter Name="MessageID" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="MessageTO" Type="String" />
                            <asp:Parameter Name="MessageFROM" Type="String" />
                            <asp:Parameter DbType="Date" Name="Date" />
                            <asp:Parameter Name="Message" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="MessageTO" Type="String" />
                            <asp:Parameter Name="MessageFROM" Type="String" />
                            <asp:Parameter DbType="Date" Name="Date" />
                            <asp:Parameter Name="Message" Type="String" />
                            <asp:Parameter Name="MessageID" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <asp:Button ID="Button3" runat="server" Text="Delete" OnClick="Button3_Click" />
                </td>
                <td style="font-size: small">
                    <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
        </table>
    </p>
    <p class="auto-style9">
        Outbox</p>
    <table style="width:100%;">
        <tr>
            <td class="auto-style11">
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="MessageID" EmptyDataText="There are no data records to display." ForeColor="#333333" GridLines="None" style="font-size: large" Width="416px" OnSelectedIndexChanged="GridView2_SelectedIndexChanged">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:CommandField ShowDeleteButton="False" ShowSelectButton="True" />
                        <asp:BoundField DataField="MessageTO" HeaderText="MessageTO" SortExpression="MessageTO" />
                        <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [MessagesTable] WHERE [MessageID] = @MessageID" InsertCommand="INSERT INTO [MessagesTable] ([MessageTO], [MessageFROM], [Date], [Message]) VALUES (@MessageTO, @MessageFROM, @Date, @Message)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [MessageID], [MessageTO], [MessageFROM], [Date], [Message] FROM [MessagesTable]" UpdateCommand="UPDATE [MessagesTable] SET [MessageTO] = @MessageTO, [MessageFROM] = @MessageFROM, [Date] = @Date, [Message] = @Message WHERE [MessageID] = @MessageID">
                    <DeleteParameters>
                        <asp:Parameter Name="MessageID" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="MessageTO" Type="String" />
                        <asp:Parameter Name="MessageFROM" Type="String" />
                        <asp:Parameter DbType="Date" Name="Date" />
                        <asp:Parameter Name="Message" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="MessageTO" Type="String" />
                        <asp:Parameter Name="MessageFROM" Type="String" />
                        <asp:Parameter DbType="Date" Name="Date" />
                        <asp:Parameter Name="Message" Type="String" />
                        <asp:Parameter Name="MessageID" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:Button ID="Button4" runat="server" Text="Delete" OnClick="Button4_Click" />

            </td>
            <td>
                <asp:Label ID="Label3" runat="server" style="font-size: small" Text="Label"></asp:Label>
            </td>
        </tr>
    </table>
    <br />
    <span class="auto-style9">New Message<br />
    <table style="width: 100%; height: 111px;">
        <tr>
            <td class="auto-style12">To: </td>
            <td>
                <asp:DropDownList ID="DropDownList1" AppendDataBoundItems="true" runat="server">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style12">Message:</td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server" Height="53px" Width="1073px"></asp:TextBox>
            </td>
        </tr>
    </table>
    </span>
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Send" />
    <br />
    <p>
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Doctor/doctorHomepage.aspx">Back</asp:HyperLink>
    </p>
</asp:Content>
