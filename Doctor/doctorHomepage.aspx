﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="doctorHomepage.aspx.cs" Inherits="FinalProject.Doctor.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style4 {
            width: 280px;
            font-size: large;
            color: #0000FF;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        <table style="width:100%;">
            <tr>
                <td class="auto-style4">Name:
                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                </td>
                <td class="auto-style4">User:&nbsp;
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
    </p>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
</asp:Content>
