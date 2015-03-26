<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EventEditor.aspx.cs" MasterPageFile="~/admin/Admin.Master" Inherits="EBFRW_Web.admin.EventEditor" %>

<%@ Register TagPrefix="asp" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit"%>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">   
    
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="Server" />
          <div>
     
    <asp:FormView ID="EventEditorFormView" runat="server" Height="169px" Width="948px" HorizontalAlign="Justify" 
             CellPadding="4" ForeColor="#333333"  
             OnItemDeleting="EventEditorFormView_ItemDeleting" OnItemInserting="EventEditorFormView_ItemInserting"  
             OnItemUpdating="EventEditorFormView_ItemUpdating" 
             OnItemCommand="EventEditorFormView_ItemCommand"  
             onmodechanging="EventEditorFormView_ModeChanging" 
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
            Event ID: <asp:TextBox ID="idTextBox" Width="50px" runat="server"  CausesValidation="false" ReadOnly="true" Text='<%# Bind ("id") %>'></asp:TextBox>
            </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
            <asp:TableCell>
            Event Name:<br /><asp:TextBox ID="eventNameTextBox" ReadOnly="true" width="300" runat="server" Text='<%# Bind ("EVENT_NAME") %>'></asp:TextBox> </asp:TableCell>
            <asp:TableCell>
            <asp:CalendarExtender ID="calendartest" runat="server" TargetControlID="eventDateTextBox" Enabled="true"></asp:CalendarExtender>
            Distance:<br /><asp:TextBox ID="distanceTextBox"  ReadOnly="true" width="300" runat="server" Text='<%# Bind ("DISTANCE") %>'></asp:TextBox> </asp:TableCell>
            <asp:TableCell>
            Event Date:<br /><asp:TextBox ID="eventDateTextBox" ReadOnly="true" width="300" runat="server" Text='<%# Bind ("EVENT_DATE") %>'></asp:TextBox>
            </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
            <asp:TableCell>
            City:<br /><asp:TextBox ID="cityTextBox" ReadOnly="true" width="300" runat="server" Text='<%# Bind ("CITY") %>'></asp:TextBox> </asp:TableCell>
            <asp:TableCell>
            State:<br /><asp:TextBox ID="stateTextBox" ReadOnly="true" width="300" runat="server" Text='<%# Bind ("STATE") %>'></asp:TextBox> </asp:TableCell>
            <asp:TableCell>
            Website:<br /><asp:TextBox ID="websiteTextBox" width="300" ReadOnly="true" runat="server" Text='<%# Bind ("EVENT_URL") %>'></asp:TextBox>
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
            Event ID: <asp:TextBox ID="idTextBox" Width="50px" runat="server"  CausesValidation="false" ReadOnly="true" Text='<%# Bind ("id") %>'></asp:TextBox>
            </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
            <asp:TableCell>
            Event Name:<br /><asp:TextBox ID="eventNameTextBox" ReadOnly="false" width="300" runat="server" Text='<%# Bind ("EVENT_NAME") %>'></asp:TextBox> </asp:TableCell>
            <asp:TableCell>
            <asp:CalendarExtender ID="calendartest" runat="server" TargetControlID="eventDateTextBox" Enabled="true"></asp:CalendarExtender>
            Distance:<br /><asp:TextBox ID="distanceTextBox"  ReadOnly="false" width="300" runat="server" Text='<%# Bind ("DISTANCE") %>'></asp:TextBox> </asp:TableCell>
            <asp:TableCell>
            Event Date:<br /><asp:TextBox ID="eventDateTextBox" ReadOnly="false" width="300" runat="server" Text='<%# Bind ("EVENT_DATE") %>'></asp:TextBox>
            </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
            <asp:TableCell>
            City:<br /><asp:TextBox ID="cityTextBox" ReadOnly="false" width="300" runat="server" Text='<%# Bind ("CITY") %>'></asp:TextBox> </asp:TableCell>
            <asp:TableCell>
            State:<br /><asp:TextBox ID="stateTextBox" ReadOnly="false" width="300" runat="server" Text='<%# Bind ("STATE") %>'></asp:TextBox> </asp:TableCell>
            <asp:TableCell>
            Website:<br /><asp:TextBox ID="websiteTextBox" width="300" ReadOnly="false" runat="server" Text='<%# Bind ("EVENT_URL") %>'></asp:TextBox>
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
            Event Name:<br /><asp:TextBox ID="eventNameTextBox" ReadOnly="false" width="300" runat="server" Text='<%# Bind ("EVENT_NAME") %>'></asp:TextBox> </asp:TableCell>
            <asp:TableCell>
            <asp:CalendarExtender ID="calendartest" runat="server" TargetControlID="eventDateTextBox" Enabled="true"></asp:CalendarExtender>
            Distance:<br /><asp:TextBox ID="distanceTextBox"  ReadOnly="false" width="300" runat="server" Text='<%# Bind ("DISTANCE") %>'></asp:TextBox> </asp:TableCell>
            <asp:TableCell>
            Event Date:<br /><asp:TextBox ID="eventDateTextBox" ReadOnly="false" width="300" runat="server" Text='<%# Bind ("EVENT_DATE") %>'></asp:TextBox>
            </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
            <asp:TableCell>
            City:<br /><asp:TextBox ID="cityTextBox" ReadOnly="false" width="300" runat="server" Text='<%# Bind ("CITY") %>'></asp:TextBox> </asp:TableCell>
            <asp:TableCell>
            State:<br /><asp:TextBox ID="stateTextBox" ReadOnly="false" width="300" runat="server" Text='<%# Bind ("STATE") %>'></asp:TextBox> </asp:TableCell>
            <asp:TableCell>
            Website:<br /><asp:TextBox ID="websiteTextBox" width="300" ReadOnly="false" runat="server" Text='<%# Bind ("EVENT_URL") %>'></asp:TextBox>
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
            id="EVGridView" runat="server" CellPadding="3"  width="95%"  class="pj" Visible="true"
        ForeColor="#333333"  AutoGenerateColumns="false"  DataKeyNames="id" HorizontalAlign="center"
            GridLines="Both" AutoGenerateDeleteButton="false"  OnSelectedIndexChanged="localEventsGrid_OnSelectedIndexChanged"
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
                        <asp:BoundField DataField="EVENT_DATE" HeaderText="DATE"  ReadOnly="false" DataFormatString="{0:MM/dd/yyyy}"/>
                        <asp:BoundField DataField="EVENT_NAME" HeaderText="NAME" />
                        <asp:BoundField DataField="DISTANCE" HeaderText="DISTANCE" />
                        <asp:BoundField DataField="CITY" HeaderText="CITY" />
                        <asp:BoundField DataField="STATE" HeaderText="STATE" />
                        <asp:BoundField DataField="EVENT_URL" HeaderText="WEBSITE" />
                    </Columns>
                </asp:GridView>   


</asp:Content>






    
