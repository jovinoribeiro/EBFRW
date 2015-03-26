<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.Master" AutoEventWireup="true" CodeBehind="MembersEditor.aspx.cs" Inherits="EBFRW_Web.admin.MembersEditor" %>

<%@ Register TagPrefix="asp" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit"%>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="Server" />
          <div>
     
    <asp:FormView ID="MembersEditorFormView" runat="server" Height="169px" Width="956px" HorizontalAlign="Justify" 
             CellPadding="4" ForeColor="#333333"  
             OnItemDeleting="MembersEditorFormView_ItemDeleting" OnItemInserting="MembersEditorFormView_ItemInserting"  
             OnItemUpdating="MembersEditorFormView_ItemUpdating" 
             OnItemCommand="MembersEditorFormView_ItemCommand"  
             onmodechanging="MembersEditorFormView_ModeChanging" 
             style="margin-right: 0px">       
        
        <EmptyDataTemplate>
            <asp:Table ID="Table1" runat="server"><asp:TableRow><asp:TableCell>             
                <asp:Button ID="Button4" runat="server" Text="Add New Record" CommandName="New" />
            </asp:TableCell></asp:TableRow></asp:Table>
        </EmptyDataTemplate>     
        <ItemTemplate>
        <asp:Table ID="itemTable" runat="server" HorizontalAlign="left" CellPadding="2" BorderWidth="2">
        <asp:TableRow>
           <asp:TableCell>
            Member ID: <asp:TextBox ID="idTextBox" Width="50px" runat="server"  CausesValidation="false" ReadOnly="true" Text='<%# Bind ("Idx") %>'></asp:TextBox>
            </asp:TableCell>    
            </asp:TableRow>
            <asp:TableRow>
            <asp:TableCell>
            First Name:<br /><asp:TextBox ID="firstNameTextBox" ReadOnly="true" width="300" runat="server" Text='<%# Bind ("FirstName") %>'></asp:TextBox> </asp:TableCell>
            <asp:TableCell>
            Last Name:<br /><asp:TextBox ID="lastNameTextBox"  ReadOnly="true" width="300" runat="server" Text='<%# Bind ("LastName") %>'></asp:TextBox> </asp:TableCell>
            <asp:TableCell>
            Email:<br /><asp:TextBox ID="emailTextBox" ReadOnly="true" width="300" runat="server" Text='<%# Bind ("EMail") %>'></asp:TextBox>
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
            Member ID: <asp:TextBox ID="idTextBox" Width="50px" runat="server"  CausesValidation="false" ReadOnly="true" Text='<%# Bind ("Idx") %>'></asp:TextBox>
            </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
            <asp:TableCell>
            First Name:<br /><asp:TextBox ID="firstNameTextBox" ReadOnly="false" width="300" runat="server" Text='<%# Bind ("FirstName") %>'></asp:TextBox> </asp:TableCell>
            <asp:TableCell>
            Last Name:<br /><asp:TextBox ID="lastNameTextBox"  ReadOnly="false" width="300" runat="server" Text='<%# Bind ("LastName") %>'></asp:TextBox> </asp:TableCell>
            <asp:TableCell>
            Email:<br /><asp:TextBox ID="emailTextBox" ReadOnly="false" width="300" runat="server" Text='<%# Bind ("EMail") %>'></asp:TextBox>
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
            First Name:<br /><asp:TextBox ID="firstNameTextBox" ReadOnly="false" width="300" runat="server" Text='<%# Bind ("FirsName") %>'></asp:TextBox> </asp:TableCell>
            <asp:TableCell>
            Last Name:<br /><asp:TextBox ID="lastNameTextBox"  ReadOnly="false" width="300" runat="server" Text='<%# Bind ("LastName") %>'></asp:TextBox> </asp:TableCell>
            <asp:TableCell>
            Email:<br /><asp:TextBox ID="emailTextBox" ReadOnly="false" width="300" runat="server" Text='<%# Bind ("Email") %>'></asp:TextBox>
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
     </div>
   


    <asp:GridView 
            id="membersGridView" runat="server" CellPadding="3"  width="95%"  
        class="pj" Visible="true"
        ForeColor="#333333"  AutoGenerateColumns="false" DataKeyNames="Idx" AllowPaging="true" OnPageIndexChanging="membersGridView_PageIndexChanging"
            GridLines="Both" AutoGenerateDeleteButton="false"  OnSelectedIndexChanged="membersGridView_OnSelectedIndexChanged"
            AutoGenerateEditButton="false" AutoGenerateSelectButton="true"  
        style="text-align: center" PageSize="20"
            >
            
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
                        <asp:BoundField DataField="Idx" HeaderText="ID"/>
                        <asp:BoundField DataField="FirstName" HeaderText="FIRST NAME"/>
                        <asp:BoundField DataField="LastName" HeaderText="LAST NAME" />
                        <asp:BoundField DataField="EMail" HeaderText="EMAIL" />
                    </Columns>
                </asp:GridView>   

</asp:Content>






    
