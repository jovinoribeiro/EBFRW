<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" Inherits="MembersOnly" Codebehind="MembersOnly.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">


    <h6 class="bold">ByLaws</h6>
    <p class="pj">
    Click <a href="http://www.eastbayfrontrunners.org/uploads/ebfrw_by_laws.doc" target="blank">here</a> for a copy of our latest ByLaws document
    </p>

    <h6 class="bold">Meeting Notes</h6>

    <ul>
        
        <li>
            <font color="blue">2012</font>
            <ul>
                <li><a href="http://www.eastbayfrontrunners.org/uploads/2012_annual_meeting_22912.doc" target="_blank">02/29/2012</a></li>
            </ul>
        </li>
        <li>
        <a href="http://www.eastbayfrontrunners.org/uploads/2011_annual_meeting.doc" target="_blank">2011</a>
            <ul>
                <li><a href="http://www.eastbayfrontrunners.org/uploads/2011_annual_meeting_11811.doc" target="_blank">01/18/2011</a></li>
                <li><a href="http://www.eastbayfrontrunners.org/uploads/2011_annual_meeting_22311.doc" target="_blank">02/23/2011</a></li>
                <li><a href="http://www.eastbayfrontrunners.org/uploads/2011_annual_meeting_5411.docx" target="_blank">05/04/2011</a></li>
                <li><a href="http://www.eastbayfrontrunners.org/uploads/2011_annual_meeting_82511.doc" target="_blank">08/25/2011</a></li>
                <li><a href="http://www.eastbayfrontrunners.org/uploads/2011_annual_meeting_111011.doc" target="_blank">11/10/2011</a></li>
            </ul>
        </li>
        <li><a href="http://www.eastbayfrontrunners.org/uploads/2010 Annual Meeting.doc">2010</a></li>
        <li><a href="http://www.eastbayfrontrunners.org/uploads/2009 Annual Meeting.doc">2009</a></li>
        <li><a href="http://www.eastbayfrontrunners.org/uploads/2008 Annual Meeting.doc">2008</a></li>
        <li><a href="http://www.eastbayfrontrunners.org/uploads/2007 Annual Meeting.doc">2007</a></li>
        <li><a href="http://www.eastbayfrontrunners.org/uploads/2006 Annual Meeting.doc">2006</a></li>
    </ul>

    <asp:BulletedList ID="meetingNotes" runat="server" DisplayMode="HyperLink" Target="_blank" Visible="false">
           <asp:ListItem Text="2011" Value="http://www.eastbayfrontrunners.org/uploads/2011_annual_meeting.doc">

           </asp:ListItem>
           <asp:ListItem Text="2010" Value="http://www.eastbayfrontrunners.org/uploads/2010 Annual Meeting.doc"></asp:ListItem>
           <asp:ListItem Text="2009" Value="http://www.eastbayfrontrunners.org/uploads/2009 Annual Meeting.doc"></asp:ListItem>
           <asp:ListItem Text="2008" Value="http://www.eastbayfrontrunners.org/uploads/2008 Annual Meeting.doc"></asp:ListItem>
           <asp:ListItem Text="2007" Value="http://www.eastbayfrontrunners.org/uploads/2007 Annual Meeting.doc"></asp:ListItem>
           <asp:ListItem Text="2006" Value="http://www.eastbayfrontrunners.org/uploads/2006 Annual Meeting.doc"></asp:ListItem>
    </asp:BulletedList>

    <!--
    <h6 class="bold">Membership Card</h6>
    <p class="pj">
    Click <a href="MembershipCardRequest.aspx">here</a>  to request the printing of  a new Membership Card
    </p>
    -->

    <h6 class="bold">Newsletter</h6>

    <asp:Table ID="newsletterout" runat="server" Visible="true">
    <asp:TableRow>

    <asp:TableCell HorizontalAlign="Justify">
    <asp:Image ID="newsletterimg" ImageUrl="~/img/newsletter.jpg" runat="server" 
        Height="110px" Width="359px"  />
    </asp:TableCell>

    <asp:TableCell Visible="true">
    <asp:Table ID="newsLetterTable" runat="server" CellPadding="3" CellSpacing="0" HorizontalAlign="Center">
    </asp:Table>
    </asp:TableCell>

    <asp:TableCell>
    <asp:Table ID="newsletter" runat="server" class="pj" cellpadding="5" GridLines="Both" align="left" Visible="true">
        <asp:TableHeaderRow>
            <asp:TableHeaderCell>SPRING</asp:TableHeaderCell>
            <asp:TableHeaderCell>SUMMER</asp:TableHeaderCell>
            <asp:TableHeaderCell>FALL</asp:TableHeaderCell>
            <asp:TableHeaderCell>WINTER</asp:TableHeaderCell>
        </asp:TableHeaderRow>
        <asp:TableRow HorizontalAlign="Center">
            <asp:TableCell><a href="http://www.eastbayfrontrunners.org/uploads/UP_2012_SPRING.pdf" target="_blank">2012</a></asp:TableCell>
            <asp:TableCell><a href="http://www.eastbayfrontrunners.org/uploads/UP_2012_SUMMER.pdf" target="_blank">2012</a></asp:TableCell>
            <asp:TableCell>2012</asp:TableCell>
            <asp:TableCell>2012</asp:TableCell>
        </asp:TableRow>
        <asp:TableRow  HorizontalAlign="center">
            <asp:TableCell><a href="http://www.eastbayfrontrunners.org/uploads/UP_2011_SPRING.pdf" target="_blank">2011</a></asp:TableCell>        
            <asp:TableCell><a href="http://www.eastbayfrontrunners.org/uploads/UP_2011_Summer.pdf" target="_blank">2011</a></asp:TableCell> 
            <asp:TableCell><a href="http://www.eastbayfrontrunners.org/uploads/UP_2011_FALL.pdf" target="_blank">2011</a></asp:TableCell> 
            <asp:TableCell><a href="http://www.eastbayfrontrunners.org/uploads/UP_2011_WINTER.pdf" target="_blank">2011</asp:TableCell> 
        </asp:TableRow>
        <asp:TableRow HorizontalAlign="center">
            <asp:TableCell><a href="http://www.eastbayfrontrunners.org/uploads/UP_2010_SPRING.pdf" target="_blank">2010</a></asp:TableCell>        
            <asp:TableCell>2010</asp:TableCell> 
            <asp:TableCell><a href="http://www.eastbayfrontrunners.org/uploads/UP_2010_FALL.pdf" target="_blank">2010</a></asp:TableCell> 
            <asp:TableCell><a href="http://www.eastbayfrontrunners.org/uploads/UP_2010_WINTER.pdf" target="_blank">2010</a></asp:TableCell> 
        </asp:TableRow>
        <asp:TableRow HorizontalAlign="center">
            <asp:TableCell><a href="http://www.eastbayfrontrunners.org/uploads/UP_2009_SPRING.pdf" target="_blank">2009</a></asp:TableCell>        
            <asp:TableCell><a href="http://www.eastbayfrontrunners.org/uploads/UP_2009_SUMMER.pdf" target="_blank">2009</a></asp:TableCell> 
            <asp:TableCell><a href="http://www.eastbayfrontrunners.org/uploads/UP_2009_FALL_1.pdf" target="_blank">2009-1</a>
                <a href="http://www.eastbayfrontrunners.org/uploads/UP_2009_WINTER.pdf" target="_blank"> 2009-2</a>
            </asp:TableCell> 
            <asp:TableCell><a href="http://www.eastbayfrontrunners.org/uploads/UP_2009_WINTER.pdf" target="_blank">2009</a></asp:TableCell> 
        </asp:TableRow>
        <asp:TableRow HorizontalAlign="center">
            <asp:TableCell><a href="http://www.eastbayfrontrunners.org/uploads/UP_2008_SPRING.pdf" target="_blank">2008</a></asp:TableCell>       
            <asp:TableCell><a href="http://www.eastbayfrontrunners.org/uploads/UP_2008_SUMMER.pdf" target="_blank">2008</a></asp:TableCell> 
            <asp:TableCell><a href="http://www.eastbayfrontrunners.org/uploads/UP_2008_FALL.pdf" target="_blank">2008</a></asp:TableCell> 
            <asp:TableCell><a href="http://www.eastbayfrontrunners.org/uploads/UP_2008_WINTER.pdf" target="_blank">2008</a></asp:TableCell> 
        </asp:TableRow>
        <asp:TableRow HorizontalAlign="center">
            <asp:TableCell><a href="http://www.eastbayfrontrunners.org/uploads/UP_2007_SPRING.pdf" target="_blank"">2007</a></asp:TableCell>        
            <asp:TableCell><a href="http://www.eastbayfrontrunners.org/uploads/UP_2007_SUMMER.pdf" target="_blank">2007</a></asp:TableCell>
            <asp:TableCell><a href="http://www.eastbayfrontrunners.org/uploads/UP_2007_FALL.pdf" target="_blank">2007</a></asp:TableCell>
            <asp:TableCell><a href="http://www.eastbayfrontrunners.org/uploads/UP_2007_WINTER.pdf" target="_blank">2007</a></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow HorizontalAlign="center">
            <asp:TableCell>2006</asp:TableCell>        
            <asp:TableCell><a href="http://www.eastbayfrontrunners.org/uploads/UP_2006_SUMMER.pdf" target="_blank">2006</a></asp:TableCell>
            <asp:TableCell><a href="http://www.eastbayfrontrunners.org/uploads/UP_2006_FALL.pdf" target="_blank">2006</a></asp:TableCell>
            <asp:TableCell><a href="http://www.eastbayfrontrunners.org/uploads/UP_2006_WINTER.pdf" target="_blank">2006</a></asp:TableCell>
        </asp:TableRow>
    </asp:Table>

    </asp:TableCell>
    </asp:TableRow>
    </asp:Table>
    
    <h6 class="bold">Membership Directory</h6>

    <div>
        <asp:Table ID="searchTable" runat="server">
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
                    <asp:Button ID="searchButton" runat="server" Text="Find Member" onclick="searchButton_Click"/>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="searchResultLbl" runat="server" Text="" ForeColor="Red"/>
                </asp:TableCell></asp:TableRow></asp:Table></div>&nbsp;<i>Note: For a complete membership directory, leave the fields above empty</i> <p class="pj">
        
        <asp:Table id="atozTable" runat="server">
            <asp:TableRow>
                <asp:TableCell>
                    <asp:LinkButton ID="A" runat="server"  CommandArgument="A" Text="A" OnCommand="onAlphabetSelected"></asp:LinkButton>
                </asp:TableCell><asp:TableCell>
                    <asp:LinkButton ID="B" runat="server"  CommandArgument="B" Text="B" OnCommand="onAlphabetSelected">
                    </asp:LinkButton>
                </asp:TableCell><asp:TableCell><asp:LinkButton  CommandArgument="C" ID="C" runat="server" Text="C" OnCommand="onAlphabetSelected"></asp:LinkButton></asp:TableCell><asp:TableCell><asp:LinkButton ID="D" runat="server"  CommandArgument="D" Text="D" OnCommand="onAlphabetSelected"></asp:LinkButton></asp:TableCell><asp:TableCell><asp:LinkButton ID="E" runat="server"  CommandArgument="E" Text="E" OnCommand="onAlphabetSelected"></asp:LinkButton></asp:TableCell><asp:TableCell><asp:LinkButton ID="F" runat="server"  CommandArgument="F" Text="F" OnCommand="onAlphabetSelected"></asp:LinkButton></asp:TableCell><asp:TableCell><asp:LinkButton ID="G" runat="server"  CommandArgument="G" Text="G" OnCommand="onAlphabetSelected"></asp:LinkButton></asp:TableCell><asp:TableCell><asp:LinkButton ID="H" runat="server" CommandArgument="H" Text="H" OnCommand="onAlphabetSelected"></asp:LinkButton></asp:TableCell><asp:TableCell><asp:LinkButton ID="I" runat="server" CommandArgument="I" Text="I" OnCommand="onAlphabetSelected"></asp:LinkButton></asp:TableCell><asp:TableCell><asp:LinkButton ID="J" runat="server" CommandArgument="J" Text="J" OnCommand="onAlphabetSelected"></asp:LinkButton></asp:TableCell><asp:TableCell><asp:LinkButton ID="K" runat="server" CommandArgument="K" Text="K" OnCommand="onAlphabetSelected"></asp:LinkButton></asp:TableCell><asp:TableCell><asp:LinkButton ID="L" runat="server" CommandArgument="L" Text="L" OnCommand="onAlphabetSelected"></asp:LinkButton></asp:TableCell><asp:TableCell><asp:LinkButton ID="M" runat="server" CommandArgument="M" Text="M" OnCommand="onAlphabetSelected"></asp:LinkButton></asp:TableCell><asp:TableCell><asp:LinkButton ID="N" runat="server" CommandArgument="N" Text="N" OnCommand="onAlphabetSelected"></asp:LinkButton></asp:TableCell><asp:TableCell><asp:LinkButton ID="O" runat="server" CommandArgument="O" Text="O" OnCommand="onAlphabetSelected"></asp:LinkButton></asp:TableCell><asp:TableCell><asp:LinkButton ID="P" runat="server" CommandArgument="P" Text="P" OnCommand="onAlphabetSelected"></asp:LinkButton></asp:TableCell><asp:TableCell><asp:LinkButton ID="Q" runat="server" CommandArgument="Q" Text="Q" OnCommand="onAlphabetSelected"></asp:LinkButton></asp:TableCell><asp:TableCell><asp:LinkButton ID="R" runat="server" CommandArgument="R" Text="R" OnCommand="onAlphabetSelected"></asp:LinkButton></asp:TableCell><asp:TableCell><asp:LinkButton ID="S" runat="server" CommandArgument="S" Text="S" OnCommand="onAlphabetSelected"></asp:LinkButton></asp:TableCell><asp:TableCell><asp:LinkButton ID="T" runat="server" CommandArgument="T" Text="T" OnCommand="onAlphabetSelected"></asp:LinkButton></asp:TableCell><asp:TableCell><asp:LinkButton ID="U" runat="server" CommandArgument="U" Text="U" OnCommand="onAlphabetSelected"></asp:LinkButton></asp:TableCell><asp:TableCell><asp:LinkButton ID="V" runat="server" CommandArgument="V" Text="V" OnCommand="onAlphabetSelected"></asp:LinkButton></asp:TableCell><asp:TableCell><asp:LinkButton ID="W" runat="server" CommandArgument="W" Text="W" OnCommand="onAlphabetSelected"></asp:LinkButton></asp:TableCell><asp:TableCell><asp:LinkButton ID="X" runat="server" CommandArgument="X" Text="X" OnCommand="onAlphabetSelected"></asp:LinkButton></asp:TableCell><asp:TableCell><asp:LinkButton ID="Y" runat="server" CommandArgument="Y" Text="Y" OnCommand="onAlphabetSelected"></asp:LinkButton></asp:TableCell><asp:TableCell><asp:LinkButton ID="Z" runat="server" CommandArgument="Z" Text="Z" OnCommand="onAlphabetSelected">
                </asp:LinkButton></asp:TableCell><asp:TableCell><asp:LinkButton CommandArgument="" ID="All" OnCommand="onAlphabetSelected" runat="server" Text="All"></asp:LinkButton></asp:TableCell></asp:TableRow></asp:Table><asp:DataGrid ID="membersGrid" runat="server" AllowPaging="true"  PageSize="25"
            CellPadding="2" ForeColor="#333333" OnPageIndexChanged="membersGrid_Page" HorizontalAlign="Center" Width="100%"
             OnEditCommand="membersGrid_Edit">
            <AlternatingItemStyle BackColor="White" />
            <EditItemStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <ItemStyle BackColor="#EFF3FB" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Right" 
                BorderStyle="Double" Mode="NumericPages" NextPageText="Next" 
                PrevPageText="Previous" />
            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />            
        </asp:DataGrid>
    </p>
    

    </asp:Content>

