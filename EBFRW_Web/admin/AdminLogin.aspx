<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="EBFRW_Web.admin.AdminLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
     <br />
     <h6>Administrator Tool - Login</h6>
    <br /><br />
    
    <asp:Label Text="Administrator Name" runat="server"></asp:Label><br />
    <asp:TextBox ID="name" runat="server" Width="150"></asp:TextBox><br /><br />

    <asp:Label Text="Passord" runat="server"></asp:Label><br />
    <asp:TextBox ID="password" runat="server" Width="150"></asp:TextBox><br /><br />

    <asp:Button ID="loginButton" runat="server" width="100" Text="Login" 
         onclick="loginButton_Click"/><br /><br />


</asp:Content>

