<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.Master" AutoEventWireup="true" CodeBehind="TestLogin.aspx.cs" Inherits="EBFRW_Web.admin.TestLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

     <asp:LoginView ID="HeadLoginView" runat="server" EnableViewState="false">
        <LoggedInTemplate>
            You rock for having an ID...
        </LoggedInTemplate>
        <AnonymousTemplate>
            Please create an ID...
        </AnonymousTemplate>
        
     </asp:LoginView>

</asp:Content>
