<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="PrideRunOrders.aspx.cs" Inherits="EBFRW_Web.admin.PrideRunOrders" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <asp:Table runat="server">
        <asp:TableRow>
            <asp:TableCell>
                <asp:LinkButton ID="allButton" runat="server"  CommandArgument="All" Text="ALL" OnCommand="onStatusSelected"></asp:LinkButton>
            </asp:TableCell>
            <asp:TableCell>
                <asp:LinkButton ID="pendingLinkButton" runat="server"  CommandArgument="Pending" Text="PENDING" OnCommand="onStatusSelected"></asp:LinkButton>
            </asp:TableCell>
            <asp:TableCell>
                <asp:LinkButton ID="completeLinkButton" runat="server"  CommandArgument="Complete" Text="COMPLETE" OnCommand="onStatusSelected"></asp:LinkButton>
            </asp:TableCell>
            <asp:TableCell>
                <asp:LinkButton ID="cancelledLinkButton" runat="server"  CommandArgument="Cancelled" Text="CANCELLED" OnCommand="onStatusSelected"></asp:LinkButton>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    

    <asp:GridView ID="PrideRunOrderGV" runat="server" CellPadding="4"  AutoGenerateColumns="False"
    ForeColor="#333333" AllowSorting="True"  AutoGenerateEditButton="True" OnRowUpdating="PrideRunorderGV_RowUpdating"
        OnRowEditing="PrideRunorderGV_RowEditing" OnRowCancelingEdit="PrideRunorderGV_RowCancelingEdit">
                <AlternatingRowStyle BackColor="White" />
                <EditRowStyle BackColor="yellow" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />    
                <Columns>
                    <asp:BoundField DataField="order_id" HeaderText="Order #" ReadOnly="false"/>

                    <asp:TemplateField HeaderText="Status">
                        <ItemTemplate>
                            <asp:Label ID="label" runat="server" Text='<%# Bind("order_status") %>' EnableViewState="false"></asp:Label>
                        
                        </ItemTemplate>
                        
                        <EditItemTemplate>                      
                            <asp:DropDownList ID="statusListJovino"  runat="server" Enabled="true" DataValueField='<%# Bind("order_status") %>'  DataTextField='<%# Bind("order_status") %>'
                             AutoPostBack="false"  OnLoad="statusListJovino_OnLoad" OnTextChanged="statusListJovino_SelectedIndexChanged" OnDisposed="statusListJovino_SelectedIndexChanged" OnSelectedIndexChanged="statusListJovino_SelectedIndexChanged">
                                <asp:ListItem Text="" Value=""></asp:ListItem>
                                <asp:ListItem Text="Pending" Value="Pending"></asp:ListItem>
                                 <asp:ListItem Text="Complete" Value="Complete"></asp:ListItem>
                                  <asp:ListItem Text="Cancelled" Value="Cancelled"></asp:ListItem>
                            </asp:DropDownList>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="payment_date" HeaderText="Payment Date" />
                    <asp:BoundField DataField="payment_type" HeaderText="Payment Type" />
                    <asp:BoundField DataField="rc_desc" HeaderText="Category" ReadOnly="true" />
                    <asp:BoundField DataField="gen_desc" HeaderText="Gender" ReadOnly="true"/>
                    <asp:BoundField DataField="first_name" HeaderText="First" ReadOnly="true"/>
                    <asp:BoundField DataField="last_name" HeaderText="Last" ReadOnly="true"/>
                    <asp:BoundField DataField="dob" HeaderText="D.O.B" ReadOnly="true"/>
                    <asp:BoundField DataField="email" HeaderText="Email" ReadOnly="true"/>
                    <asp:BoundField DataField="phone" HeaderText="Phone" ReadOnly="true"/>
                    <asp:BoundField DataField="address1" HeaderText="Street" ReadOnly="true"/>
                    <asp:BoundField DataField="address2" HeaderText="Apt" ReadOnly="true"/>
                    <asp:BoundField DataField="city" HeaderText="City" ReadOnly="true"/>
                    <asp:BoundField DataField="state" HeaderText="State" ReadOnly="true"/>
                    <asp:BoundField DataField="zip" HeaderText="Zip" ReadOnly="true"/>
                    <asp:BoundField DataField="waiver" HeaderText="Waiver" ReadOnly="true"/>
                    <asp:BoundField DataField="order_date" HeaderText="Order Date" ReadOnly="true"/>
                </Columns>
    </asp:GridView>
    
   

    </asp:Content>


