<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="doctorPatients.aspx.cs" Inherits="FinalProject.Doctor.doctorPatients" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            font-size: large;
            color: #0000FF;
            width: 280px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        <table style="width:100%;">
            <tr>
                <td class="auto-style5">Name:
                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                </td>
                <td class="auto-style5">User:
                    <asp:LoginName ID="LoginName1" runat="server" />
                </td>
                <td>
                    <asp:LoginStatus ID="LoginStatus1" runat="server" />
                </td>
            </tr>
        </table>
        <br />
    </p>
    <p>
        Patients</p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="PatientsID" EmptyDataText="There are no data records to display." ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                <asp:BoundField DataField="PatientsID" HeaderText="PatientsID" ReadOnly="True" SortExpression="PatientsID" />
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [PatientsTable] WHERE [PatientsID] = @PatientsID" InsertCommand="INSERT INTO [PatientsTable] ([DoctorID], [FirstName], [LastName], [Address], [Phone], [Email], [UserLoginName], [MedicationID], [TestID]) VALUES (@DoctorID, @FirstName, @LastName, @Address, @Phone, @Email, @UserLoginName, @MedicationID, @TestID)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [PatientsID], [DoctorID], [FirstName], [LastName], [Address], [Phone], [Email], [UserLoginName], [MedicationID], [TestID] FROM [PatientsTable]" UpdateCommand="UPDATE [PatientsTable] SET [DoctorID] = @DoctorID, [FirstName] = @FirstName, [LastName] = @LastName, [Address] = @Address, [Phone] = @Phone, [Email] = @Email, [UserLoginName] = @UserLoginName, [MedicationID] = @MedicationID, [TestID] = @TestID WHERE [PatientsID] = @PatientsID">
            <DeleteParameters>
                <asp:Parameter Name="PatientsID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="DoctorID" Type="Int32" />
                <asp:Parameter Name="FirstName" Type="String" />
                <asp:Parameter Name="LastName" Type="String" />
                <asp:Parameter Name="Address" Type="String" />
                <asp:Parameter Name="Phone" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="UserLoginName" Type="String" />
                <asp:Parameter Name="MedicationID" Type="Int32" />
                <asp:Parameter Name="TestID" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="DoctorID" Type="Int32" />
                <asp:Parameter Name="FirstName" Type="String" />
                <asp:Parameter Name="LastName" Type="String" />
                <asp:Parameter Name="Address" Type="String" />
                <asp:Parameter Name="Phone" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="UserLoginName" Type="String" />
                <asp:Parameter Name="MedicationID" Type="Int32" />
                <asp:Parameter Name="TestID" Type="Int32" />
                <asp:Parameter Name="PatientsID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        &nbsp;</p>
    <p>
        Name:
        <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
    </p>
    <p>
        Email:
        <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
    </p>
    <p>
        Tests: </p>
    <p>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="TestID" EmptyDataText="There are no data records to display." ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="TestID" HeaderText="TestID" ReadOnly="True" SortExpression="TestID" />
                <asp:BoundField DataField="TestResults" HeaderText="TestResults" SortExpression="TestResults" />
                <asp:BoundField DataField="TestDate" HeaderText="TestDate" SortExpression="TestDate" />
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
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [TestTable] WHERE [TestID] = @TestID" InsertCommand="INSERT INTO [TestTable] ([PatientID], [TestResults], [TestDate], [DoctorID]) VALUES (@PatientID, @TestResults, @TestDate, @DoctorID)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [TestID], [PatientID], [TestResults], [TestDate], [DoctorID] FROM [TestTable]" UpdateCommand="UPDATE [TestTable] SET [PatientID] = @PatientID, [TestResults] = @TestResults, [TestDate] = @TestDate, [DoctorID] = @DoctorID WHERE [TestID] = @TestID">
            <DeleteParameters>
                <asp:Parameter Name="TestID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="PatientID" Type="Int32" />
                <asp:Parameter Name="TestResults" Type="String" />
                <asp:Parameter DbType="Date" Name="TestDate" />
                <asp:Parameter Name="DoctorID" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="PatientID" Type="Int32" />
                <asp:Parameter Name="TestResults" Type="String" />
                <asp:Parameter DbType="Date" Name="TestDate" />
                <asp:Parameter Name="DoctorID" Type="Int32" />
                <asp:Parameter Name="TestID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        Medications:</p>
    <p>
        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="MedicationId" EmptyDataText="There are no data records to display." ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="MedicationId" HeaderText="MedicationId" ReadOnly="True" SortExpression="MedicationId" />
                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
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
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [MedicationListTable] WHERE [MedicationId] = @MedicationId" InsertCommand="INSERT INTO [MedicationListTable] ([Description], [PatientID]) VALUES (@Description, @PatientID)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [MedicationId], [Description], [PatientID] FROM [MedicationListTable]" UpdateCommand="UPDATE [MedicationListTable] SET [Description] = @Description, [PatientID] = @PatientID WHERE [MedicationId] = @MedicationId">
            <DeleteParameters>
                <asp:Parameter Name="MedicationId" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="PatientID" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="PatientID" Type="Int32" />
                <asp:Parameter Name="MedicationId" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Doctor/doctorHomepage.aspx">Back</asp:HyperLink>
    </p>
</asp:Content>
