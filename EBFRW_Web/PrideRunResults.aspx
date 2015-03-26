<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" Inherits="PrideRunResults" Codebehind="PrideRunResults.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <!-- <h6 class="bold">Official Results</h6> -->
            <hr id="Hr1" title="overall" runat="server" />
     <div align="center">
     
    
    <!--
    <asp:Table ID="eventTable" runat="server" BorderStyle="Solid" BorderWidth="1" GridLines="none" Visible="false">
        <asp:TableRow>
            <asp:TableCell >
                <header align="center">YEAR</header>
            </asp:TableCell>
            <asp:TableCell >
                <asp:DropDownList ID="yearList" runat="server" AutoPostBack="true" ToolTip="Select a different year's results">
                <asp:ListItem Selected="true">2012</asp:ListItem>
                <asp:ListItem>2011</asp:ListItem>
                <asp:ListItem>2010</asp:ListItem>
                <asp:ListItem>2009</asp:ListItem>
                </asp:DropDownList>
            </asp:TableCell>
            <asp:TableCell>             
                <header align="center">EVENT</header>
            </asp:TableCell>           
            <asp:TableCell>                
                <asp:DropDownList ID="OverAllDropList" runat="server"  AutoPostBack="true" 
                    onselectedindexchanged="OverAllDropList_SelectedIndexChanged">                  
                     <asp:ListItem>10 K Run</asp:ListItem>
                    <asp:ListItem>5 K Run</asp:ListItem>
                    <asp:ListItem>5 K Walk</asp:ListItem>                  
                </asp:DropDownList>
            </asp:TableCell>            
        </asp:TableRow>
    </asp:Table>

    <hr />

    </div>


    <div align="center">
    <asp:Table ID="yearResultTable" runat="server" Visible="false">
        <asp:TableRow>
            <asp:TableCell><h6 class="bold"><asp:Label ID="yearLabel" runat="server" Text="2009"></asp:Label> Pride Run Leaderboard</h6></asp:TableCell>
        </asp:TableRow>
    </asp:Table>
      </div>    
    <div>
      <asp:Table ID="MaleResults" runat="server" align="center" CellPadding="10" Visible="false">
        <asp:TableRow>
            <asp:TableCell>
                <asp:DataGrid ID="_10KRGrid_Male" runat="server" AutoGenerateColumns="false" Caption="<b>10K Run - MEN</b>"
                                        ForeColor="#333333" GridLines="Both">
                        <AlternatingItemStyle BackColor="White" />
                        <EditItemStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Center"/>
                        <ItemStyle BackColor="#EFF3FB"  HorizontalAlign="Center"/>
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        
                </asp:DataGrid>
            </asp:TableCell>
            <asp:TableCell>
                <asp:DataGrid ID="_5KRGrid_Male" runat="server" AutoGenerateColumns="false" Caption="<b>5K Run - MEN</b>"
                                        ForeColor="#333333" GridLines="Both">
                        <AlternatingItemStyle BackColor="White" />
                        <EditItemStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Center"/>
                        <ItemStyle BackColor="#EFF3FB"  HorizontalAlign="Center"/>
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                </asp:DataGrid>
            </asp:TableCell>
            <asp:TableCell>
                <asp:DataGrid ID="_5KWGrid_Male" runat="server" AutoGenerateColumns="false" Caption="<b>5K Walk - MEN</b>"
                                        ForeColor="#333333" GridLines="Both">
                        <AlternatingItemStyle BackColor="White" />
                        <EditItemStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Center"/>
                        <ItemStyle BackColor="#EFF3FB"  HorizontalAlign="Center"/>
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                </asp:DataGrid>            
            </asp:TableCell>
        </asp:TableRow>
      </asp:Table>
    </div>

        <div>
      <asp:Table ID="FemaleResults" runat="server" align="center" CellPadding="10">
        <asp:TableRow>
            <asp:TableCell>
                <asp:DataGrid ID="_10KRGrid_Female" runat="server" AutoGenerateColumns="false" Caption="<b>10K Run - WOMEN</b>"
                        ForeColor="#333333" GridLines="Both">
                        <AlternatingItemStyle BackColor="White" />
                        <EditItemStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Center"/>
                        <ItemStyle BackColor="#EFF3FB"  HorizontalAlign="Center"/>
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                </asp:DataGrid>
            </asp:TableCell>
            <asp:TableCell>
                <asp:DataGrid ID="_5KRGrid_Female" runat="server" AutoGenerateColumns="false" Caption="<b>5K Run - WOMEN</b>"
                        ForeColor="#333333" GridLines="Both">
                        <AlternatingItemStyle BackColor="White" />
                        <EditItemStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Center"/>
                        <ItemStyle BackColor="#EFF3FB"  HorizontalAlign="Center"/>
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                </asp:DataGrid>
            </asp:TableCell>
            <asp:TableCell>
                <asp:DataGrid ID="_5KWGrid_Female" runat="server" AutoGenerateColumns="false" Caption="<b>5K Walk - WOMEN</b>"
                        ForeColor="#333333" GridLines="Both">
                        <AlternatingItemStyle BackColor="White" />
                        <EditItemStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Center"/>
                        <ItemStyle BackColor="#EFF3FB"  HorizontalAlign="Center"/>
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                </asp:DataGrid>
            </asp:TableCell>
        </asp:TableRow>
      </asp:Table>
    </div>


        <div align="center">
            <h6 class="bold"><asp:Label ID="eventLabel" runat="server" Text="2009"></asp:Label>&nbsp;Overall Results</h6>
      </div>   

    <div>
      <asp:Table ID="OverallTable" runat="server" align="center" CellPadding="10" Width="94%">
        <asp:TableRow>
            <asp:TableCell>
                        <asp:DataGrid ID="AllResults"  Width="100%" runat="server" 
                        AutoGenerateColumns="False" CellPadding="4" 
                        ForeColor="#333333" GridLines="Both">
                        <AlternatingItemStyle BackColor="White" />
                        <EditItemStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Center"/>
                        <ItemStyle BackColor="#EFF3FB"  HorizontalAlign="Center"/>
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        </asp:DataGrid>
            </asp:TableCell>
        </asp:TableRow>
      </asp:Table>
    </div>

     <div>
      <asp:Table ID="overAllTable2nd" runat="server" align="center" CellPadding="10" Width="94%">
        <asp:TableRow>
            <asp:TableCell>
                        <asp:DataGrid ID="AllResults2nd"  Width="100%" runat="server" 
                        AutoGenerateColumns="False" CellPadding="4" 
                        ForeColor="#333333" GridLines="Both">
                        <AlternatingItemStyle BackColor="White" />
                        <EditItemStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Center"/>
                        <ItemStyle BackColor="#EFF3FB"  HorizontalAlign="Center"/>
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        </asp:DataGrid>
            </asp:TableCell>
        </asp:TableRow>
      </asp:Table>
    </div>-->
</asp:Content>


