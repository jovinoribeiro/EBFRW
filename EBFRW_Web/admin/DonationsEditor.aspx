<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.Master" AutoEventWireup="true" CodeBehind="DonationsEditor.aspx.cs" Inherits="EBFRW_Web.admin.DonationsEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <br />&nbsp;&nbsp; 
    <asp:Label runat="server" ID="totalDonationLbl" Font-Bold="true" BackColor="Yellow"><b>Total donation received : $ </b></asp:Label>
    <br />

    <asp:GridView runat="server" ID="donationsGV"  CellPadding="3"  width="95%"  
        class="pj" 
        ForeColor="#333333"  AutoGenerateColumns="true" 
        
            GridLines="Both" 
                        
        style="text-align: center" PageSize="100" >
    
    </asp:GridView>

</asp:Content>
