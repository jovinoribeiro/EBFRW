<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.Master" AutoEventWireup="true" CodeBehind="PhotoGalleryEditor.aspx.cs" Inherits="EBFRW_Web.admin.PhotoGalleryEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:FormView ID="PGFV" runat="server" Height="169px" Width="948px" HorizontalAlign="Justify" 
             CellPadding="4" ForeColor="#333333"  
             OnItemDeleting="PGFV_ItemDeleting" 
             OnItemInserting="PGFV_ItemInserting"  
             OnItemUpdating="PGFV_ItemUpdating" 
             onmodechanging="PGFV_ModeChanging" 
             style="margin-right: 0px">    
                
        <EmptyDataTemplate>
            <asp:Table ID="Table1" runat="server" BorderWidth="5"><asp:TableRow><asp:TableCell>             
                <asp:Button ID="addNewRecordButton" runat="server" Text="Add New Record" CommandName="New" />
            </asp:TableCell></asp:TableRow></asp:Table>
        </EmptyDataTemplate>
        
       <ItemTemplate>
        <asp:Table ID="itemTable" runat="server" HorizontalAlign="left" CellPadding="2" BorderWidth="2">
        <asp:TableRow>
           <asp:TableCell>
            Album ID: <asp:TextBox ID="albumIdTextBox" Width="50px" runat="server"  CausesValidation="false" ReadOnly="true" Text='<%# Bind ("ALBUM_ID") %>'></asp:TextBox>
            </asp:TableCell>
            </asp:TableRow>
         <asp:TableRow>
            <asp:TableCell>
            Album Name:<br /><asp:TextBox ID="albumNameTextBox" ReadOnly="true" width="300" runat="server" Text='<%# Bind ("ALBUM_NAME") %>'></asp:TextBox> </asp:TableCell>
            <asp:TableCell>
            Album Description:<br /><asp:TextBox ID="albumDescTextBox" ReadOnly="true" width="300" runat="server" Text='<%# Bind ("DESCRIPTION") %>'></asp:TextBox>
            </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell ColumnSpan="3" HorizontalAlign="center">
                     <asp:Button ID="Button1" runat="server" Text="Edit" CommandName="Edit" />
            <asp:Button ID="Button3" runat="server" Text="Delete" CommandName="Delete" />
            <asp:Button ID="Button2" runat="server" Text="Cancel" CommandName="Cancel" />           
                </asp:TableCell>
            </asp:TableRow>
            </asp:Table>
        </ItemTemplate>
        
        <EditItemTemplate>
        <asp:Table ID="itemTable" runat="server" HorizontalAlign="left" CellPadding="2" BorderWidth="2">
        <asp:TableRow>
           <asp:TableCell>
            Album ID: <asp:TextBox ID="albumIdTextBox" Width="50px" runat="server"  CausesValidation="false" ReadOnly="true" Text='<%# Bind ("ALBUM_ID") %>'></asp:TextBox>
            </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
            <asp:TableCell>
            Album Name:<br /><asp:TextBox ID="albumNameTextBox" ReadOnly="false" width="300" runat="server" Text='<%# Bind ("ALBUM_NAME") %>'></asp:TextBox> </asp:TableCell>
            <asp:TableCell>
            Album Description:<br /><asp:TextBox ID="albumDescTextBox" ReadOnly="false" width="300" runat="server" Text='<%# Bind ("DESCRIPTION") %>'></asp:TextBox>
            </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell ColumnSpan="3" HorizontalAlign="center">
            <asp:Button ID="Button3" runat="server" Text="Update" CommandName="Update" />
            <asp:Button ID="Button2" runat="server" Text="Cancel" CommandName="Cancel" />           
                </asp:TableCell>
            </asp:TableRow>
            </asp:Table>
        </EditItemTemplate>

        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        
        <InsertItemTemplate>
        <asp:Table ID="itemTable" runat="server" HorizontalAlign="left" CellPadding="2" BorderWidth="2">
            <asp:TableRow>
            <asp:TableCell>
            Album Name:<br /><asp:TextBox ID="albumNameTextBox" ReadOnly="false" width="300" runat="server" Text='<%# Bind ("ALBUM_NAME") %>'></asp:TextBox> </asp:TableCell>
            <asp:TableCell>
            Album Description:<br /><asp:TextBox ID="albumDescTextBox" ReadOnly="false" width="300" runat="server" Text='<%# Bind ("DESCRIPTION") %>'></asp:TextBox>
            </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell ColumnSpan="3" HorizontalAlign="center">
                    <asp:Button ID="Button1" runat="server" Text="Insert" CommandName="Insert" />
                    <asp:Button ID="Button2" runat="server" Text="Cancel" CommandName="Cancel" />           
                </asp:TableCell>
            </asp:TableRow>
            </asp:Table>
        </InsertItemTemplate>
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
    </asp:FormView>

    <asp:GridView ID="AlbumsGV" runat="server" CellPadding="3"  width="95%"  class="pj" Visible="true"
        ForeColor="#333333"  AutoGenerateColumns="false"  DataKeyNames="ALBUM_ID" HorizontalAlign="center"
            GridLines="Both" AutoGenerateDeleteButton="false"  OnSelectedIndexChanged="albumsGV_OnSelectedIndexChanged"
            AutoGenerateEditButton="false" AutoGenerateSelectButton="true"  style="text-align: center">
          <AlternatingRowStyle BackColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Center"/>
            <EditRowStyle 
                BackColor="#2461BF" /><FooterStyle BackColor="#507CD1" Font-Bold="True" 
                ForeColor="White" /><HeaderStyle BackColor="#507CD1" Font-Bold="True" 
                ForeColor="White" /><PagerStyle BackColor="#2461BF" ForeColor="White" 
                HorizontalAlign="Center" /><RowStyle BackColor="#EFF3FB" /><SelectedRowStyle 
                BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" /><SortedAscendingCellStyle 
                BackColor="#F5F7FB" /><SortedAscendingHeaderStyle BackColor="#6D95E1" /><SortedDescendingCellStyle 
                BackColor="#E9EBEF" /><SortedDescendingHeaderStyle BackColor="#4870BE" />
                    <Columns>
                        <asp:BoundField DataField="ALBUM_ID" HeaderText="ID"  ReadOnly="false"/>
                        <asp:BoundField DataField="ALBUM_NAME" HeaderText="NAME" />
                        <asp:BoundField DataField="DESCRIPTION" HeaderText="DESCRIPTION" />
                    </Columns>
    </asp:GridView>


</asp:Content>
