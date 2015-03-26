<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WebUserControl1.ascx.cs" Inherits="EBFRW_Web.admin.WebUserControl1" %>

    <h6 class="bold">Membership Directory</h6>

    <div>
        <asp:Table ID="searchTable" runat="server" Visible="false">
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="searchFNLabel" runat="server" Text="First Name"></asp:Label> 
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="searchLNLabel" runat="server" Text="Last Name"></asp:Label> 
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:TextBox ID="searchFNBox" runat="server"></asp:TextBox>                
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="searchLNBox" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="searchResultLbl" runat="server" Text="" ForeColor="Red"/>
                </asp:TableCell></asp:TableRow></asp:Table></div>&nbsp;<i><!--Note: For a complete membership directory, leave the fields above empty--></i> <p class="pj">
        
        <asp:Table id="atozTable" runat="server" Visible="false">
            <asp:TableRow>
                <asp:TableCell>
                    <asp:LinkButton ID="A" runat="server"  CommandArgument="A" Text="A" OnCommand="onAlphabetSelected"></asp:LinkButton>
                </asp:TableCell><asp:TableCell>
                    <asp:LinkButton ID="B" runat="server"  CommandArgument="B" Text="B" OnCommand="onAlphabetSelected">
                    </asp:LinkButton>
                </asp:TableCell><asp:TableCell><asp:LinkButton  CommandArgument="C" ID="C" runat="server" Text="C" OnCommand="onAlphabetSelected"></asp:LinkButton></asp:TableCell><asp:TableCell><asp:LinkButton ID="D" runat="server"  CommandArgument="D" Text="D" OnCommand="onAlphabetSelected"></asp:LinkButton></asp:TableCell><asp:TableCell><asp:LinkButton ID="E" runat="server"  CommandArgument="E" Text="E" OnCommand="onAlphabetSelected"></asp:LinkButton></asp:TableCell><asp:TableCell><asp:LinkButton ID="F" runat="server"  CommandArgument="F" Text="F" OnCommand="onAlphabetSelected"></asp:LinkButton></asp:TableCell><asp:TableCell><asp:LinkButton ID="G" runat="server"  CommandArgument="G" Text="G" OnCommand="onAlphabetSelected"></asp:LinkButton></asp:TableCell><asp:TableCell><asp:LinkButton ID="H" runat="server" CommandArgument="H" Text="H" OnCommand="onAlphabetSelected"></asp:LinkButton></asp:TableCell><asp:TableCell><asp:LinkButton ID="I" runat="server" CommandArgument="I" Text="I" OnCommand="onAlphabetSelected"></asp:LinkButton></asp:TableCell><asp:TableCell><asp:LinkButton ID="J" runat="server" CommandArgument="J" Text="J" OnCommand="onAlphabetSelected"></asp:LinkButton></asp:TableCell><asp:TableCell><asp:LinkButton ID="K" runat="server" CommandArgument="K" Text="K" OnCommand="onAlphabetSelected"></asp:LinkButton></asp:TableCell><asp:TableCell><asp:LinkButton ID="L" runat="server" CommandArgument="L" Text="L" OnCommand="onAlphabetSelected"></asp:LinkButton></asp:TableCell><asp:TableCell><asp:LinkButton ID="M" runat="server" CommandArgument="M" Text="M" OnCommand="onAlphabetSelected"></asp:LinkButton></asp:TableCell><asp:TableCell><asp:LinkButton ID="N" runat="server" CommandArgument="N" Text="N" OnCommand="onAlphabetSelected"></asp:LinkButton></asp:TableCell><asp:TableCell><asp:LinkButton ID="O" runat="server" CommandArgument="O" Text="O" OnCommand="onAlphabetSelected"></asp:LinkButton></asp:TableCell><asp:TableCell><asp:LinkButton ID="P" runat="server" CommandArgument="P" Text="P" OnCommand="onAlphabetSelected"></asp:LinkButton></asp:TableCell><asp:TableCell><asp:LinkButton ID="Q" runat="server" CommandArgument="Q" Text="Q" OnCommand="onAlphabetSelected"></asp:LinkButton></asp:TableCell><asp:TableCell><asp:LinkButton ID="R" runat="server" CommandArgument="R" Text="R" OnCommand="onAlphabetSelected"></asp:LinkButton></asp:TableCell><asp:TableCell><asp:LinkButton ID="S" runat="server" CommandArgument="S" Text="S" OnCommand="onAlphabetSelected"></asp:LinkButton></asp:TableCell><asp:TableCell><asp:LinkButton ID="T" runat="server" CommandArgument="T" Text="T" OnCommand="onAlphabetSelected"></asp:LinkButton></asp:TableCell><asp:TableCell><asp:LinkButton ID="U" runat="server" CommandArgument="U" Text="U" OnCommand="onAlphabetSelected"></asp:LinkButton></asp:TableCell><asp:TableCell><asp:LinkButton ID="V" runat="server" CommandArgument="V" Text="V" OnCommand="onAlphabetSelected"></asp:LinkButton></asp:TableCell><asp:TableCell><asp:LinkButton ID="W" runat="server" CommandArgument="W" Text="W" OnCommand="onAlphabetSelected"></asp:LinkButton></asp:TableCell><asp:TableCell><asp:LinkButton ID="X" runat="server" CommandArgument="X" Text="X" OnCommand="onAlphabetSelected"></asp:LinkButton></asp:TableCell><asp:TableCell><asp:LinkButton ID="Y" runat="server" CommandArgument="Y" Text="Y" OnCommand="onAlphabetSelected"></asp:LinkButton></asp:TableCell><asp:TableCell><asp:LinkButton ID="Z" runat="server" CommandArgument="Z" Text="Z" OnCommand="onAlphabetSelected">
                </asp:LinkButton></asp:TableCell><asp:TableCell><asp:LinkButton CommandArgument="" ID="All" OnCommand="onAlphabetSelected" runat="server" Text="All"></asp:LinkButton></asp:TableCell></asp:TableRow></asp:Table>
                <asp:GridView 
            id="membersGrid" runat="server" CellPadding="4" ForeColor="#333333"  AutoGenerateColumns="false"
            GridLines="Both" AutoGenerateDeleteButton="True" 
            AutoGenerateEditButton="True" AutoGenerateSelectButton="True"  OnRowEditing="membersGrid_RowEditing"
             OnRowUpdating="membersGrid_RowUpdating"
              OnRowCancelingEdit="membersGrid_RowCancelingEdit"
               >
            
            <AlternatingRowStyle BackColor="White" /><EditRowStyle 
                BackColor="#2461BF" /><FooterStyle BackColor="#507CD1" Font-Bold="True" 
                ForeColor="White" /><HeaderStyle BackColor="#507CD1" Font-Bold="True" 
                ForeColor="White" /><PagerStyle BackColor="#2461BF" ForeColor="White" 
                HorizontalAlign="Center" /><RowStyle BackColor="#EFF3FB" /><SelectedRowStyle 
                BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" /><SortedAscendingCellStyle 
                BackColor="#F5F7FB" /><SortedAscendingHeaderStyle BackColor="#6D95E1" /><SortedDescendingCellStyle 
                BackColor="#E9EBEF" /><SortedDescendingHeaderStyle BackColor="#4870BE" />
                    <Columns>
                        <asp:BoundField DataField="Idx" HeaderText="ID"  ReadOnly="false"/>
                        <asp:BoundField DataField="FirstName" HeaderText="FIRST NAME" />
                        <asp:BoundField DataField="LastName" HeaderText="LAST NAME" />
                        <asp:BoundField DataField="Address" HeaderText="ADDRESS" />
                        <asp:BoundField DataField="Apt" HeaderText="APT" />
                        <asp:BoundField DataField="City" HeaderText="CITY" />
                        <asp:BoundField DataField="ZIP" HeaderText="ZIP" />
                        <asp:BoundField DataField="EMail" HeaderText="EMAIL" />
                        <asp:BoundField DataField="Home" HeaderText="HOME" />
                        <asp:BoundField DataField="Cel" HeaderText="CELL" />                    
                    </Columns>
                </asp:GridView>
                
 </p>