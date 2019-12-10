<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="doctorAppointments.aspx.cs" Inherits="FinalProject.Doctor.doctorAppointments" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style6 {
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
                <td class="auto-style6">Name:
                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                </td>
                <td class="auto-style6">User:&nbsp; <asp:LoginName ID="LoginName1" runat="server" />
                </td>
                <td>
                    <asp:LoginStatus ID="LoginStatus1" runat="server" />
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </p>
    <p>
        Appointments</p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="AppointmentID" EmptyDataText="There are no data records to display." ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" />
                <asp:BoundField DataField="PatientID" HeaderText="PatientID" SortExpression="PatientID" />
                <asp:BoundField DataField="Purpose" HeaderText="Purpose" SortExpression="Purpose" />
                <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
                <asp:BoundField DataField="Time" HeaderText="Time" SortExpression="Time" />
                <asp:BoundField DataField="VisitSummary" HeaderText="VisitSummary" SortExpression="VisitSummary" />
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [AppointmentsTable] WHERE [AppointmentID] = @AppointmentID" InsertCommand="INSERT INTO [AppointmentsTable] ([PatientID], [DoctorID], [Purpose], [Date], [Time], [VisitSummary]) VALUES (@PatientID, @DoctorID, @Purpose, @Date, @Time, @VisitSummary)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [AppointmentID], [PatientID], [DoctorID], [Purpose], [Date], [Time], [VisitSummary] FROM [AppointmentsTable]" UpdateCommand="UPDATE [AppointmentsTable] SET [PatientID] = @PatientID, [DoctorID] = @DoctorID, [Purpose] = @Purpose, [Date] = @Date, [Time] = @Time, [VisitSummary] = @VisitSummary WHERE [AppointmentID] = @AppointmentID">
            <DeleteParameters>
                <asp:Parameter Name="AppointmentID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="PatientID" Type="Int32" />
                <asp:Parameter Name="DoctorID" Type="Int32" />
                <asp:Parameter Name="Purpose" Type="String" />
                <asp:Parameter DbType="Date" Name="Date" />
                <asp:Parameter DbType="Time" Name="Time" />
                <asp:Parameter Name="VisitSummary" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="PatientID" Type="Int32" />
                <asp:Parameter Name="DoctorID" Type="Int32" />
                <asp:Parameter Name="Purpose" Type="String" />
                <asp:Parameter DbType="Date" Name="Date" />
                <asp:Parameter DbType="Time" Name="Time" />
                <asp:Parameter Name="VisitSummary" Type="String" />
                <asp:Parameter Name="AppointmentID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Doctor/doctorHomepage.aspx">Back</asp:HyperLink>
    </p>
</asp:Content>
