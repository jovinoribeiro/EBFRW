<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.Master" AutoEventWireup="true" CodeBehind="UploadDocuments.aspx.cs" Inherits="EBFRW_Web.admin.UploadDocuments" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <asp:FileUpload ID="fileUploadControl" runat="server"  />
    <br />
    <asp:Button runat="server" ID="uploadButton" Text="Upload" OnClick="uploadButton_Click" />   
    <br /><br />
    <asp:Label runat="server" id="StatusLabel" text="UploadStatus"></asp:Label>

    <asp:Table ID="newsLetterTable" runat="server" CellPadding="5" CellSpacing="0">
    </asp:Table>

</asp:Content>
