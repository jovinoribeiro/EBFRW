<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistrationOrderEditor.aspx.cs" MasterPageFile="~/admin/Admin.Master" Inherits="EBFRW_Web.admin.RegistrationOrderEditor" %>

<%@ Register TagPrefix="asp" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit"%>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">   

    
    
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="Server" />
          <div>
     
    <asp:FormView ID="RegistrationOrderFormView"  runat="server" Height="169px" Width="500px" HorizontalAlign="Justify" 
             CellPadding="4" ForeColor="#333333" 
             style="margin-right: 0px"
             OnItemDeleting="RegistrationOrderFormView_ItemDeleting" OnItemInserting="RegistrationOrderFormView_ItemInserting"  
             OnItemUpdating="RegistrationOrderFormView_ItemUpdating" 
             OnItemCommand="RegistrationOrderFormView_ItemCommand"  
             onmodechanging="RegistrationOrderFormView_ModeChanging" 
             >       
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <ItemTemplate>
        <asp:Table ID="itemTable" runat="server" HorizontalAlign="left" CellPadding="2" BorderWidth="1">
                <asp:TableRow>
                    <asp:TableCell>
                        Order Id: <br /><asp:TextBox ID="orderIdTextBox" ReadOnly="true" runat="server" Text='<%# Bind("order_id") %>'></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>Order Status: <br /> <asp:TextBox ID="orderStatusTextBox" ReadOnly="true" runat="server" Text='<%# Bind("order_status") %>'></asp:TextBox></asp:TableCell>
                    <asp:TableCell>Order Date: <br /> <asp:TextBox ID="orderDateTextBox" ReadOnly="true" runat="server" Text='<%# Bind("order_date") %>'></asp:TextBox></asp:TableCell>
                    <asp:TableCell>Membership Type: <br /><asp:TextBox ID="membershipTypeTextBox" ReadOnly="true" runat="server" Text='<%# Bind("membership_type") %>'></asp:TextBox></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>First Name: <br /> <asp:TextBox ID="firstNameTextBox1" ReadOnly="true" runat="server" Text='<%# Bind("fc_first_name") %>'></asp:TextBox></asp:TableCell>
                    <asp:TableCell>Last Name: <br /> <asp:TextBox ID="lastNameTextBox1" ReadOnly="true" runat="server" Text='<%# Bind("fc_last_name") %>'></asp:TextBox></asp:TableCell>
                    <asp:TableCell>Birthday: <br /> <asp:TextBox ID="birthdayTextBox1" ReadOnly="true" runat="server" Text='<%# Bind("fc_bday") %>'></asp:TextBox></asp:TableCell>
                    <asp:TableCell>Email: <br /> <asp:TextBox ID="emailTextBox1" runat="server" ReadOnly="true" Text='<%# Bind("fc_email") %>'></asp:TextBox></asp:TableCell>
                    <asp:TableCell>Home Phone: <br /> <asp:TextBox ID="homePhoneTextBox1" ReadOnly="true" width="85px" runat="server" Text='<%# Bind("fc_home_phone") %>'></asp:TextBox></asp:TableCell>
                    <asp:TableCell>Cell Phone: <br /> <asp:TextBox ID="cellPhoneTextBox1" ReadOnly="true" width="85px" runat="server" Text='<%# Bind("fc_cell_phone") %>'></asp:TextBox></asp:TableCell>
                    <asp:TableCell>Work Phone: <br /> <asp:TextBox ID="workPhoneTextBox1" ReadOnly="true" width="85px" runat="server" Text='<%# Bind("fc_work_phone") %>'></asp:TextBox></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>First Name: <br /> <asp:TextBox ID="firstNameTextBox2" ReadOnly="true" runat="server" Text='<%# Bind("sc_first_name") %>'></asp:TextBox></asp:TableCell>
                    <asp:TableCell>Last Name: <br /> <asp:TextBox ID="lastNameTextBox2" ReadOnly="true" runat="server" Text='<%# Bind("sc_last_name") %>'></asp:TextBox></asp:TableCell>
                    <asp:TableCell>Birthday: <br /> <asp:TextBox ID="birthdayTextBox2" ReadOnly="true" runat="server" Text='<%# Bind("sc_bday") %>'></asp:TextBox></asp:TableCell>
                    <asp:TableCell>Email: <br /> <asp:TextBox ID="emailTextBox2" ReadOnly="true"  runat="server" Text='<%# Bind("sc_email") %>'></asp:TextBox></asp:TableCell>
                    <asp:TableCell>Home Phone: <br /> <asp:TextBox ID="homePhoneTextBox2" ReadOnly="true" width="85px" runat="server" Text='<%# Bind("sc_home_phone") %>'></asp:TextBox></asp:TableCell>
                    <asp:TableCell>Cell Phone: <br /> <asp:TextBox ID="cellPhoneTextBox2" ReadOnly="true" width="85px" runat="server" Text='<%# Bind("sc_cell_phone") %>'></asp:TextBox></asp:TableCell>
                    <asp:TableCell>Work Phone: <br /> <asp:TextBox ID="workPhoneTextBox2" ReadOnly="true"  width="85px" runat="server" Text='<%# Bind("sc_work_phone") %>'></asp:TextBox></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>Street Name: <br /> <asp:TextBox ID="streetNameTextBox" ReadOnly="true" runat="server" Text='<%# Bind("street1") %>'></asp:TextBox></asp:TableCell>
                    <asp:TableCell>Apt: <br /> <asp:TextBox ID="apartmentTextBox" runat="server" ReadOnly="true" Text='<%# Bind("street2") %>'></asp:TextBox></asp:TableCell>
                    <asp:TableCell>City: <br /> <asp:TextBox ID="cityTextBox" runat="server" ReadOnly="true" Text='<%# Bind("city") %>'></asp:TextBox></asp:TableCell>
                    <asp:TableCell>State: <br /> <asp:TextBox ID="stateTextBox" runat="server" ReadOnly="true" Text='<%# Bind("state") %>'></asp:TextBox></asp:TableCell>
                    <asp:TableCell>Zip Code: <br /> <asp:TextBox ID="zipTextBox" width="85px" ReadOnly="true" runat="server" Text='<%# Bind("zip") %>'></asp:TextBox></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>Em Ct First Name: <br /> <asp:TextBox ID="emCtFirstName" ReadOnly="true" runat="server" Text='<%# Bind("em_ct_first_name") %>'></asp:TextBox></asp:TableCell>
                    <asp:TableCell>Em Ct Last Name: <br /> <asp:TextBox ID="emCtLastName" ReadOnly="true" runat="server" Text='<%# Bind("em_ct_last_name") %>'></asp:TextBox></asp:TableCell>
                    <asp:TableCell>Em Ct Phone: <br /> <asp:TextBox ID="emCtPhone" ReadOnly="true" runat="server" Text='<%# Bind("em_ct_phone") %>'></asp:TextBox></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>Include Phone? <br /><asp:CheckBox id="includePhoneCB" ReadOnly="true" Enabled="false" runat="server" Checked='<%# Eval("include_phone").ToString() == "Y"?true:false %>' /></asp:TableCell>
                    <asp:TableCell>Include Email? <br /><asp:CheckBox id="includeEmailCB" ReadOnly="true" Enabled="false" runat="server" Checked='<%# Eval("include_email").ToString() == "Y"?true:false %>' /></asp:TableCell>
                    <asp:TableCell>Include Home Address? <br /><asp:CheckBox id="includeHomeAddCB" ReadOnly="true" Enabled="false" runat="server" Checked='<%# Eval("include_home_address").ToString() == "Y"?true:false %>' /></asp:TableCell>
                    <asp:TableCell>Use Photo in Website? <br /><asp:CheckBox id="usePhotoCB" ReadOnly="true" Enabled="false" runat="server" Checked='<%# Eval("use_photo_consent").ToString() == "Y"?true:false %>' /></asp:TableCell>
                    <asp:TableCell>Host Potluck? <br /><asp:CheckBox id="hostPotluckCB" ReadOnly="true" Enabled="false" runat="server" Checked='<%# Eval("host_potluck").ToString() == "Y"?true:false %>'></asp:CheckBox></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>Waiver: <br /><asp:TextBox ID="waiverTextBox" runat="server" ReadOnly="true" Text='<%# Bind("waiver_init") %>'></asp:TextBox></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell ColumnSpan="7" runat="server" HorizontalAlign="Center">
                        <asp:Button ID="editButton" runat="server" Text="Edit" CommandName="Edit"  Visible="true"/>
                        <asp:Button ID="deleteButton" runat="server" Text="Delete" CommandName="Delete" Visible="false"/>
                        <asp:Button ID="cancelButton" runat="server" Text="Cancel" CommandName="Cancel" />
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
            </ItemTemplate>
           
          <EditItemTemplate>
            <asp:Table ID="editTable" runat="server" HorizontalAlign="left" CellPadding="2" BorderWidth="1">
                <asp:TableRow>
                    <asp:TableCell>
                        Order Id: <br /><asp:TextBox ID="orderIdTextBox" ReadOnly="true" runat="server" Text='<%# Bind("order_id") %>'></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell Width="100px">Order Status: <br /> 
                        <asp:DropDownList ID="orderStatusDD" BackColor="Yellow" runat="server"  Width="200px" DataValueField='<%# Eval("order_status") %>'  DataTextField='<%# Eval("order_status") %>'>
                            <asp:ListItem Text="" Value="" Selected="false"></asp:ListItem>
                            <asp:ListItem Text="Complete" Value="Complete" Selected="false"></asp:ListItem>
                            <asp:ListItem Text="Cancelled" Value="Cancelled" Selected="False"></asp:ListItem>
                            <asp:ListItem Text="Pending" Value="Pending" Selected="False"></asp:ListItem>
                        </asp:DropDownList>
                    </asp:TableCell>                  
                    <asp:TableCell Width="100px">Payment Type: <br />
                        <asp:DropDownList ID="paymentTypeDD" BackColor="Yellow" runat="server" Width="200px">
                            <asp:ListItem Text="" Value=""></asp:ListItem>
                            <asp:ListItem Text="Check" Value="Check"></asp:ListItem>
                            <asp:ListItem Text="Cash" Value="Cash"></asp:ListItem>
                            <asp:ListItem Text="Visa" Value="Visa"></asp:ListItem>
                            <asp:ListItem Text="MasterCard" Value="MasterCard"></asp:ListItem>
                            <asp:ListItem Text="Amex" Value="Amex"></asp:ListItem>
                            <asp:ListItem Text="Other" Value="Other"></asp:ListItem>
                        </asp:DropDownList>
                    </asp:TableCell>
                    <asp:TableCell Width="100px"> Payment Date: <br />
                    <asp:TextBox ID="paymentDateTextBox"  BackColor="Yellow" Width="200px" runat="server" Text='<%# Bind("payment_date") %>'></asp:TextBox>
                    <asp:CalendarExtender ID="calendartest" runat="server" TargetControlID="paymentDateTextBox" Enabled="true"></asp:CalendarExtender>
                    
                    </asp:TableCell>
                    <asp:TableCell Visible="false">Order Date: <br /> <asp:TextBox ID="orderDateTextBox" ReadOnly="true" Visible="false" runat="server" Text='<%# Bind("order_date") %>'></asp:TextBox></asp:TableCell>
                    <asp:TableCell Visible="false">Membership Type: <br /><asp:TextBox ID="membershipTypeTextBox" ReadOnly="true" Visible="false" runat="server" Text='<%# Bind("membership_type") %>'></asp:TextBox></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow Visible="false">
                    <asp:TableCell>First Name: <br /> <asp:TextBox ID="firstNameTextBox1" ReadOnly="true" Visible="false" runat="server" Text='<%# Bind("fc_first_name") %>'></asp:TextBox></asp:TableCell>
                    <asp:TableCell>Last Name: <br /> <asp:TextBox ID="lastNameTextBox1" ReadOnly="true" Visible="false" runat="server" Text='<%# Bind("fc_last_name") %>'></asp:TextBox></asp:TableCell>
                    <asp:TableCell>Birthday: <br /> <asp:TextBox ID="birthdayTextBox1" ReadOnly="true" Visible="false" runat="server" Text='<%# Bind("fc_bday") %>'></asp:TextBox></asp:TableCell>
                    <asp:TableCell>Email: <br /> <asp:TextBox ID="emailTextBox1" runat="server" ReadOnly="true" Visible="false" Text='<%# Bind("fc_email") %>'></asp:TextBox></asp:TableCell>
                    <asp:TableCell>Home Phone: <br /> <asp:TextBox ID="homePhoneTextBox1" ReadOnly="true" Visible="false" width="85px" runat="server" Text='<%# Bind("fc_home_phone") %>'></asp:TextBox></asp:TableCell>
                    <asp:TableCell>Cell Phone: <br /> <asp:TextBox ID="cellPhoneTextBox1" ReadOnly="true" Visible="false" width="85px" runat="server" Text='<%# Bind("fc_cell_phone") %>'></asp:TextBox></asp:TableCell>
                    <asp:TableCell>Work Phone: <br /> <asp:TextBox ID="workPhoneTextBox1" ReadOnly="true" Visible="false" width="85px" runat="server" Text='<%# Bind("fc_work_phone") %>'></asp:TextBox></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow Visible="false">
                    <asp:TableCell>First Name: <br /> <asp:TextBox ID="firstNameTextBox2" ReadOnly="true" Visible="false" runat="server" Text='<%# Bind("sc_first_name") %>'></asp:TextBox></asp:TableCell>
                    <asp:TableCell>Last Name: <br /> <asp:TextBox ID="lastNameTextBox2" ReadOnly="true" Visible="false" runat="server" Text='<%# Bind("sc_last_name") %>'></asp:TextBox></asp:TableCell>
                    <asp:TableCell>Birthday: <br /> <asp:TextBox ID="birthdayTextBox2" ReadOnly="true" Visible="false" runat="server" Text='<%# Bind("sc_bday") %>'></asp:TextBox></asp:TableCell>
                    <asp:TableCell>Email: <br /> <asp:TextBox ID="emailTextBox2" ReadOnly="true"  Visible="false" runat="server" Text='<%# Bind("sc_email") %>'></asp:TextBox></asp:TableCell>
                    <asp:TableCell>Home Phone: <br /> <asp:TextBox ID="homePhoneTextBox2" ReadOnly="true" Visible="false" width="85px" runat="server" Text='<%# Bind("sc_home_phone") %>'></asp:TextBox></asp:TableCell>
                    <asp:TableCell>Cell Phone: <br /> <asp:TextBox ID="cellPhoneTextBox2" ReadOnly="true" Visible="false" width="85px" runat="server" Text='<%# Bind("sc_cell_phone") %>'></asp:TextBox></asp:TableCell>
                    <asp:TableCell>Work Phone: <br /> <asp:TextBox ID="workPhoneTextBox2" ReadOnly="true"  Visible="false" width="85px" runat="server" Text='<%# Bind("sc_work_phone") %>'></asp:TextBox></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow Visible="false">
                    <asp:TableCell>Street Name: <br /> <asp:TextBox ID="streetNameTextBox" Visible="false" ReadOnly="true" runat="server" Text='<%# Bind("street1") %>'></asp:TextBox></asp:TableCell>
                    <asp:TableCell>Apt: <br /> <asp:TextBox ID="apartmentTextBox" runat="server" Visible="false" ReadOnly="true" Text='<%# Bind("street2") %>'></asp:TextBox></asp:TableCell>
                    <asp:TableCell>City: <br /> <asp:TextBox ID="cityTextBox" runat="server" Visible="false" ReadOnly="true" Text='<%# Bind("city") %>'></asp:TextBox></asp:TableCell>
                    <asp:TableCell>State: <br /> <asp:TextBox ID="stateTextBox" runat="server" Visible="false" ReadOnly="true" Text='<%# Bind("state") %>'></asp:TextBox></asp:TableCell>
                    <asp:TableCell>Zip Code: <br /> <asp:TextBox ID="zipTextBox" width="85px" Visible="false" ReadOnly="true" runat="server" Text='<%# Bind("zip") %>'></asp:TextBox></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow Visible="false">
                    <asp:TableCell>Em Ct First Name: <br /> <asp:TextBox ID="emCtFirstName" ReadOnly="true" Visible="false" runat="server" Text='<%# Bind("em_ct_first_name") %>'></asp:TextBox></asp:TableCell>
                    <asp:TableCell>Em Ct Last Name: <br /> <asp:TextBox ID="emCtLastName" ReadOnly="true" Visible="false"  runat="server" Text='<%# Bind("em_ct_last_name") %>'></asp:TextBox></asp:TableCell>
                    <asp:TableCell>Em Ct Phone: <br /> <asp:TextBox ID="emCtPhone" ReadOnly="true" runat="server" Visible="false" Text='<%# Bind("em_ct_phone") %>'></asp:TextBox></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow Visible="false">
                    <asp:TableCell>Include Phone? <br /><asp:CheckBox id="includePhoneCB" ReadOnly="true" Visible="false"  Enabled="false" runat="server" Checked='<%# Eval("include_phone").ToString() == "Y"?true:false %>' /></asp:TableCell>
                    <asp:TableCell>Include Email? <br /><asp:CheckBox id="includeEmailCB" ReadOnly="true" Visible="false" Enabled="false" runat="server" Checked='<%# Eval("include_email").ToString() == "Y"?true:false %>' /></asp:TableCell>
                    <asp:TableCell>Include Home Address? <br /><asp:CheckBox id="includeHomeAddCB" ReadOnly="true" Visible="false" Enabled="false" runat="server" Checked='<%# Eval("include_home_address").ToString() == "Y"?true:false %>' /></asp:TableCell>
                    <asp:TableCell>Use Photo in Website? <br /><asp:CheckBox id="usePhotoCB" ReadOnly="true" Enabled="false" Visible="false" runat="server" Checked='<%# Eval("use_photo_consent").ToString() == "Y"?true:false %>' /></asp:TableCell>
                    <asp:TableCell>Host Potluck? <br /><asp:CheckBox id="hostPotluckCB" Enabled="false" ReadOnly="true" Visible="false" runat="server" Checked='<%# Eval("host_potluck").ToString() == "Y"?true:false %>'></asp:CheckBox></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow Visible="false">
                    <asp:TableCell>Waiver: <br /><asp:TextBox ID="waiverTextBox" runat="server" ReadOnly="true" Visible="false" Text='<%# Bind("waiver_init") %>'></asp:TextBox></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell ID="TableCell1" ColumnSpan="7" runat="server" HorizontalAlign="Center">
                        <asp:Button ID="updateButton" runat="server" Text="Update" CommandName="Update"  Visible="true"/>
                        <asp:Button ID="cancelButton" runat="server" Text="Cancel" CommandName="Cancel" />
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
            </EditItemTemplate>
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />

    </asp:FormView>
     </div>
   
    <div class="pj">
       <asp:Table ID="Table1" runat="server">
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
  </div>

<asp:GridView 
            id="registrationOrderEditorGDView" runat="server" CellPadding="3"  width="95%"  class="pj" Visible="true"
        ForeColor="#333333"  AutoGenerateColumns="false"  DataKeyNames="order_id" 
            GridLines="Both" AutoGenerateDeleteButton="false"  OnSelectedIndexChanged="registrationOrderEditorGDView_SelectedIndexChanged"
            AutoGenerateEditButton="false" AutoGenerateSelectButton="true"  style="text-align: center"
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
                       <asp:BoundField DataField="ORDER_ID" HeaderText="ORDER #" />
                       <asp:BoundField DataField="order_status" HeaderText="STATUS" />
                       <asp:BoundField DataField="order_date" HeaderText="DATE" />
                       <asp:BoundField DataField="membership_type" HeaderText="MEMB TYPE" />
                       <asp:BoundField DataField="fc_first_name" HeaderText="1ST F NAME" />
                       <asp:BoundField DataField="fc_last_name" HeaderText="1ST L NAME" />
                       <asp:BoundField DataField="fc_email" HeaderText="1st EMAIL" />
                </Columns>
                </asp:GridView>   

</asp:Content>






    
