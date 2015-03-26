<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.Master" AutoEventWireup="true" CodeBehind="PrideRunOrdersEditor.aspx.cs" Inherits="EBFRW_Web.admin.PrideRunOrdersEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div>

<asp:FormView ID="PrideRunOrdersEditorFormView" runat="server" Height="169px" Width="956px" HorizontalAlign="Justify" 
             CellPadding="4" ForeColor="#333333"  
             OnItemDeleting="PrideRunOrdersEditorFormView_ItemDeleting" OnItemInserting="PrideRunOrdersEditorFormView_ItemInserting"  
             OnItemUpdating="PrideRunOrdersEditorFormView_ItemUpdating" 
             onmodechanging="PrideRunOrdersEditorFormView_ModeChanging" 
             style="margin-right: 0px">       

    <EmptyDataTemplate>
        <asp:Table id="Table1" runat="server"><asp:TableRow><asp:TableCell>
            <asp:Button ID="button1" runat="server" Text="Add New Record" CommandName="New"/>
        </asp:TableCell></asp:TableRow></asp:Table>
    </EmptyDataTemplate>

    <ItemTemplate>
        <asp:Table ID="itemTable" runat="server" HorizontalAlign="Left" CellPadding="2" BorderWidth="2">
        <asp:TableRow>
            <asp:TableCell>
            Order ID: <asp:TextBox ID="idTextBox" width="50px" runat="server" CausesValidation="false" ReadOnly="true" Text='<%# Bind("order_id") %>'></asp:TextBox>
            </asp:TableCell>            
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
            Order Status: <asp:TextBox ID="orderStatusTextBox" ReadOnly="true" Width="300px" runat="server" Text='<%# Bind("order_status") %>'></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
            Order Date: <asp:TextBox ID="orderDateTextBox" ReadOnly="true" Width="300px" runat="server" Text='<%# Bind("order_date") %>'></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
            Payment Date: <asp:TextBox ID="paymentDateTextBox" ReadOnly="true" Width="300px" runat="server" Text='<%# Bind("order_id") %>'></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>     
        <asp:TableRow>
            <asp:TableCell ColumnSpan="3" HorizontalAlign="center">
                <asp:Button ID="editButton" runat="server" Text="Edit" CommandName="Edit" />
                <asp:Button ID="deleteButton" runat="server" Text="Delete" CommandName="Delete" />
                <asp:Button ID="cancelButton" runat="server" Text="Cancel" CommandName="Cancel" />    
            </asp:TableCell>
        </asp:TableRow>
        </asp:Table>
    </ItemTemplate>
    
    <EditItemTemplate>
        <asp:Table ID="editItemTable" runat="server" HorizontalAlign="left" CellPadding="2" BorderWidth="2">
        <asp:TableRow>
            <asp:TableCell>
            Order ID: <asp:TextBox ID="idTextBox" width="50px" runat="server" CausesValidation="false" ReadOnly="true" Text='<%# Bind("order_id") %>'></asp:TextBox>
            </asp:TableCell>            
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
            Order Status: <asp:TextBox ID="orderStatusTextBox" ReadOnly="true" Width="300px" runat="server" Text='<%# Bind("order_status") %>'></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
            Order Date: <asp:TextBox ID="orderDateTextBox" ReadOnly="true" Width="300px" runat="server" Text='<%# Bind("order_date") %>'></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
            Payment Date: <asp:TextBox ID="paymentDateTextBox" ReadOnly="true" Width="300px" runat="server" Text='<%# Bind("order_id") %>'></asp:TextBox>
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
        <asp:Table ID="insertItemTable" runat="server" HorizontalAlign="left" CellPadding="2" BorderWidth="2">
        <asp:TableRow>
            <asp:TableCell>
            Order ID: <asp:TextBox ID="idTextBox" width="50px" runat="server" CausesValidation="false" ReadOnly="true" Text='<%# Bind("order_id") %>'></asp:TextBox>
            </asp:TableCell>            
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
            Order Status: <asp:TextBox ID="orderStatusTextBox" ReadOnly="true" Width="300px" runat="server" Text='<%# Bind("order_status") %>'></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
            Order Date: <asp:TextBox ID="orderDateTextBox" ReadOnly="true" Width="300px" runat="server" Text='<%# Bind("order_date") %>'></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
            Payment Date: <asp:TextBox ID="paymentDateTextBox" ReadOnly="true" Width="300px" runat="server" Text='<%# Bind("order_id") %>'></asp:TextBox>
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

<center>
    <asp:GridView ID="overalGridView" runat="server" CellPadding="3" class="pj" ForeColor="#333333"  width="50%"
    AutoGenerateColumns="false" style="text-align: center">
    <AlternatingRowStyle BackColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" 
            />
             <Columns>
            <asp:BoundField DataField="RC_DESC" HeaderText="RACE CATEGORY" />
                        <asp:BoundField DataField="GEN_DESC" HeaderText="GENDER " />
                        <asp:BoundField DataField="totalOrders" HeaderText="# OF PARTICIPANTS" ReadOnly="true"/>
                         </Columns>
    </asp:GridView></center>

    <center><asp:Label ID="totalNumberOfOrders" runat="server" Text="Total # of registered: " BackColor="Yellow"></asp:Label></center>

<div class="pj">
    <asp:Table ID="orderStatusSelect" runat="server">
        <asp:TableRow>
            <asp:TableCell>
                <asp:LinkButton id="allButton" runat="server" CommandArgument="All" Text="ALL"  OnCommand="onStatusSelected"></asp:LinkButton>
            </asp:TableCell>
            <asp:TableCell>
                <asp:LinkButton ID="pendingLinkButton" runat="server" CommandArgument="Pending" Text="PENDING" OnCommand="onStatusSelected"></asp:LinkButton>
            </asp:TableCell>
            <asp:TableCell>
                <asp:LinkButton ID="completeLinkButton" runat="server" CommandArgument="Complete" Text="COMPLETE" OnCommand="onStatusSelected"></asp:LinkButton>
            </asp:TableCell>
            <asp:TableCell>
                <asp:LinkButton ID="cancelledLinkButton" runat="server" CommandArgument="Cancelled" Text="CANCELLED" OnCommand="onStatusSelected"></asp:LinkButton>
            </asp:TableCell>
            <asp:TableCell>
                <asp:LinkButton ID="summaryLinkButton" Visible="false" runat="server" CommandArgument="Summary" Text="OVERALL SUMMARY" OnCommand="onStatusSelected"></asp:LinkButton>
            </asp:TableCell>
 
        </asp:TableRow>
    </asp:Table>
    
</div>

    <asp:GridView 
            id="prideRunOrdersGridView" runat="server" CellPadding="3"  width="95%"  
        class="pj" Visible="true"
        ForeColor="#333333"  AutoGenerateColumns="false" 
    DataKeyNames="order_id" OnPageIndexChanging="prideRunOrdersGridView_PageIndexChanging"
            GridLines="Both" AutoGenerateDeleteButton="false"  OnSelectedIndexChanged="prideRunOrdersGridView_OnSelectedIndexChanged"
            AutoGenerateEditButton="True"  
             OnRowUpdating="PrideRunOrdersGridView_RowUpdating"  OnRowEditing="PrideRunOrdersGridView_RowEditing" 
             OnRowCancelingEdit="PrideRunOrdersGridView_RowCancelingEdit"
        style="text-align: center" PageSize="100"
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
                                        
                    <asp:BoundField DataField="order_id" HeaderText="ORDER #" ReadOnly="false"/>
                      <asp:TemplateField HeaderText="STATUS">
                        <ItemTemplate>
                            <asp:Label ID="label" runat="server" Text='<%# Bind("order_status") %>' EnableViewState="false"></asp:Label>                        
                        </ItemTemplate>
                        
                        <EditItemTemplate>                      
                            <asp:DropDownList ID="statuslist"  runat="server" Enabled="true" DataValueField='<%# Bind("order_status") %>'  DataTextField='<%# Bind("order_status") %>'
                             AutoPostBack="false" >
                                <asp:ListItem Text="" Value=""></asp:ListItem>
                                <asp:ListItem Text="Pending" Value="Pending"></asp:ListItem>
                                 <asp:ListItem Text="Complete" Value="Complete"></asp:ListItem>
                                  <asp:ListItem Text="Cancelled" Value="Cancelled"></asp:ListItem>
                            </asp:DropDownList>
                        </EditItemTemplate>
                    </asp:TemplateField>

                        <asp:BoundField DataField="PAYMENT_DATE" HeaderText="PAYMENT DATE" />
                        <asp:BoundField DataField="PAYMENT_TYPE" HeaderText="PAYMENT TYPE" />
                        <asp:BoundField DataField="ORDER_DATE" HeaderText="ORDER DATE" ReadOnly="true"/>
                        <asp:BoundField DataField="RC_DESC" HeaderText="RACE CATEGORY" ReadOnly="true"/>
                        <asp:BoundField DataField="GEN_DESC" HeaderText="GENDER" ReadOnly="true"/>
                        <asp:BoundField DataField="FIRST_NAME" HeaderText="FIRST NAME" ReadOnly="true"/>
                        <asp:BoundField DataField="LAST_NAME" HeaderText="LAST NAME" ReadOnly="true"/>
                    </Columns>
                </asp:GridView>   



</asp:Content>
