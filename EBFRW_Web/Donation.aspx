<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Donation.aspx.cs" Inherits="EBFRW_Web.Donation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="~/Styles/Site_General.css" rel="stylesheet" type="text/css" />
   <link href="~/Styles/UserFormatChoice4.css" rel="stylesheet" type="text/css" />
   <link href="Styles/prideregistration.css" rel="Stylesheet" type="text/css" />

    <script type="text/javascript">
        function selectotherRadio() {
            var rb = document.getElementById('<%= other.ClientID %>');
            rb.checked = true;
        }

        function validate(oSrc, args) {
            var otherSel = document.getElementById('<%= other.ClientID %>');
            if (otherSel.checked) {
                var regex = /^(\$|)([1-9]\d{0,2}(\,\d{3})*|([1-9]\d*))(\.\d{2})?$/;
                var number = 0;

                if (args.Value != null && args.Value != undefined) {
                    number = parseFloat(args.Value);
                }

                if (number != null && number != undefined)
                    args.IsValid = regex.test(number);
                else
                    args.IsValid = false;
            }
        }
    </script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Wizard ID="DonationWizard" runat="server" Width="100%"
            OnActiveStepChanged="Donation_ActiveStepChanged" OnFinishButtonClick="Donation_FinishButtonClick" 
            ActiveStepIndex="0"  
        BorderColor="#443266" 
        Font-Names="Verdana" Font-Size="0.8em" Height="100%" 
        CancelDestinationPageUrl="~/PrideRun.aspx" DisplayCancelButton="True" 
        HeaderStyle-Width="300"
        SideBarStyle-Width="70"
        SideBarStyle-VerticalAlign="Top"
        StepStyle-Width="100%"
        StepStyle-Height="100"
        StepStyle-VerticalAlign="Top"
         
        NavigationStyle-Width="100"
        NavigationStyle-HorizontalAlign="right"
        NavigationButtonStyle-Width="170" FinishCompleteButtonText="Submit" 
            FinishDestinationPageUrl="~/Payment.aspx" 
            StartNextButtonImageUrl="~/img/forwardarrow.png" BorderStyle="Solid" CellPadding="10"
        HeaderText="2013 EBFRW PRIDE RUN AND WALK<br> DONATION" 
        ForeColor="#FF3300" 
        HeaderStyle-ForeColor="#99FF66" BorderWidth="1px"  CssClass="ebsignupbody" 
        DisplaySideBar="false">

        
        <HeaderStyle BorderColor="#507CD1" BorderStyle="Solid" 
            BorderWidth="0px" Font-Bold="True" Font-Size="3.9em" ForeColor="White"
            HorizontalAlign="Center" VerticalAlign="Middle" CssClass="ebsignup" />


        <NavigationButtonStyle BackColor="White" BorderColor="#507CD1" 
            BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="1.6em" 
            ForeColor="#284E98" Width="100"/>

        <NavigationStyle HorizontalAlign="Right" Width="100px" BorderColor="#AA0078"></NavigationStyle>

        <SideBarButtonStyle BackColor="#507CD1" Font-Names="Verdana" 
            ForeColor="White" />
        <SideBarStyle BackColor="#507CD1" Font-Size="0.9em" VerticalAlign= "Top" />
        <SideBarTemplate>
            <asp:DataList ID="SideBarList" runat="server">
                <ItemTemplate>
                    <asp:LinkButton ID="SideBarButton" runat="server" BackColor="#507CD1" 
                        Font-Names="Verdana" ForeColor="White"></asp:LinkButton>
                </ItemTemplate>
                <SelectedItemStyle Font-Bold="True" />
            </asp:DataList>
        </SideBarTemplate>
        <StepNavigationTemplate>
            <asp:Button ID="StepPreviousButton" runat="server" BackColor="White" 
                BorderColor="#507CD1" BorderStyle="Solid" BorderWidth="1px" 
                CausesValidation="False" CommandName="MovePrevious" Font-Names="Verdana" 
                Font-Size="1.6em" ForeColor="#284E98" Text="Previous"  Width="100" />
            <asp:Button ID="StepNextButton" runat="server" BackColor="White" 
                BorderColor="#507CD1" BorderStyle="Solid" BorderWidth="1px" 
                CommandName="MoveNext" Font-Names="Verdana" Font-Size="1.6em" 
                ForeColor="#284E98" Text="Next" ValidationGroup="CreateUserWizard1" Width="100" />
            <asp:Button ID="CancelButton" runat="server" BackColor="White" 
                BorderColor="#507CD1" BorderStyle="Solid" BorderWidth="1px" 
                CausesValidation="False" CommandName="Cancel" Font-Names="Verdana" 
                Font-Size="1.6em" ForeColor="#284E98" Text="Cancel"  Width="100"/><br />
        </StepNavigationTemplate>
        <StepStyle Font-Size="1.2em" ForeColor="#333333" BorderWidth="0px"  />
       
<WizardSteps>

<asp:WizardStep runat="server" ID="descriptionstep" Title="Race Information">
<br /><br />
<div class="titles"><center>THANK YOU!</center></div>
<div class="contentA">
<center>
<p class="pj">
<font color="#443266"></font> On behalf of the following beneficiaries, East Bay Front Runners and Wakers thank you for your contribution.
</p></center>
</div>
<br />
<div class="titles"><center>THIS YEAR'S BENEFICIARIES</center></div>
<div class="contentA">
     <table id="beneficiariesTable" width="100%">
                 <tr align="center">
                     <td>
                         <a href="http://www.oebgmc.org" target="_blank">
                         <asp:Image ID="oebgmcImg" runat="server" BorderColor="ActiveBorder" 
                             BorderWidth="0px" Height="175px" ImageUrl="~/img/priderun/2012/OEBGMC.png" 
                             Width="175px" />
                         </a>
                     </td>
                     <td>
                         <a href="http://www.pacificcenter.org" target="_blank">
                         <asp:Image ID="pacificCenterImg" runat="server" BorderColor="ActiveBorder" 
                             BorderWidth="0px" Height="175px" 
                             ImageUrl="~/img/priderun/2012/pacificcenter.png" Width="175px" />
                         </a>
                     </td>
                     <td>
                         <a href="http://www.rboakland.org" target="_blank">
                         <asp:Image ID="runBetterOaklandImg" runat="server" BorderColor="ActiveBorder" 
                             BorderWidth="0px" Height="175px" ImageUrl="~/img/priderun/2012/rfbo-logo.png" 
                             Width="100px" />
                         </a>
                     </td>
                 </tr>            
    </table>
    <table id="Table1" runat="server" width="100%" visible="false">
        <tr id="Tr1" runat="server" align="center">
        <td id="Td1" runat="server">
            <a href="http://www.midwayshelter.org" 
                    target="_blank"><asp:Image runat="server" 
                ImageUrl="~/img/priderun/2012/midwayshelter.jpg" BorderColor="ActiveBorder" 
                BorderWidth="0px" Height="175px" Width="60%" ID="midwayShelterImg"></asp:Image>
        </a>
        </td>
        </tr>
    </table>
    </div>
 </asp:WizardStep>

<asp:WizardStep runat="server" ID="personalInfo" Title="Sponsor Information">
<div class="titles">1. Sponsor Information</div>
<div class="contentA">
<div class="row">
<div class="left"><asp:Label ID="Label1" runat="server"  AssociatedControlID="firstNameTBox">First Name or Business Name</asp:Label></div>
<div class="right">
<asp:TextBox ID="firstNameTBox" runat="server" CssClass="text"></asp:TextBox>

<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="firstNameTBox"
CssClass="failure" ToolTip="Name is required." 
ValidationGroup="CreateUserWizard1">Required</asp:RequiredFieldValidator></div>
<div class="clear"></div>
</div>

<div class="row">
<div class="left"><asp:Label ID="Label2" runat="server"  AssociatedControlID="lastNameTBox">Last Name</asp:Label></div>
<div class="right">
<asp:TextBox ID="lastNameTBox" runat="server" CssClass="text"></asp:TextBox>   
</div><div class="clear"></div></div>

<div class="row">
<div class="left"><asp:Label ID="Label4" runat="server"  AssociatedControlID="emailTBox">Email</asp:Label></div>
<div class="right">
<asp:TextBox ID="emailTBox" runat="server" CssClass="text"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="emailTBox" 
CssClass="failure" ErrorMessage="" ToolTip="Email is required." 
ValidationGroup="CreateUserWizard1">Required</asp:RequiredFieldValidator> 
<asp:RegularExpressionValidator   ID="RegularExpressionValidator1" runat="server" ControlToValidate="emailTBox"
CssClass="failure" ErrorMessage="you@server.com" ToolTip="you@server.com"
ValidationExpression="^[a-zA-Z][\w\.-]*[a-zA-Z0-9]@[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]\.[a-zA-Z][a-zA-Z\.]*[a-zA-Z]$"
ValidationGroup="CreateUserWizard1">
</asp:RegularExpressionValidator>
</div>
</div>
</div>

<div class="titles">2. Donation</div>
<div class="contentA">

<div class="row">
<div class="donation">Select one of the following amount</div>

<div class="right">
<asp:Table ID="Table3" runat="server">
    <asp:TableRow>
        <asp:TableCell>
            <asp:RadioButton GroupName="donationButtons" ID="_5" Text="5.00" value="5.00" Checked="true" runat="server" />
            <asp:RadioButton GroupName="donationButtons" ID="_10" Text="10.00" value="10.00" runat="server" />
            <asp:RadioButton GroupName="donationButtons" ID="_15" Text="15.00" value="15.00" runat="server" />
            <asp:RadioButton GroupName="donationButtons" ID="_20" Text="20.00" value="20.00" runat="server" />
            <asp:RadioButton GroupName="donationButtons" ID="_25" Text="25.00" value="25.00" runat="server" />
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
            <asp:TableCell>
                <asp:RadioButton GroupName="donationButtons" ID="other" Text="Other Amount $" value="other" runat="server"/>
                &nbsp; <asp:TextBox ID="donationAmountTxb" runat="server" Text="0.00"
                onfocus="javascript:selectotherRadio()"></asp:TextBox> <asp:Label ID="othernote" Text="** Do not use 'comma' in the amount" runat="server"></asp:Label> 
            </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell>
        <asp:CustomValidator id="CustomValidator1" runat="server" 
            ControlToValidate = "donationAmountTxb" 
            ErrorMessage = "Validate donation amount"
            ClientValidationFunction="validate" ValidationGroup="CreateUserWizard1" CssClass="failure" >
        </asp:CustomValidator>
        </asp:TableCell>
    </asp:TableRow>

</asp:Table>
</div>
</div>
<div class="row"></div>
<div class="row"></div>
<div class="row"></div>

</div>

</asp:WizardStep>

<asp:WizardStep runat="server" ID="summaryStep" Title="Summary" StepType="Finish">

<h6 class="gentext" style=" font-size:30px; text-align:center">DONATION SUMMARY</h6><br />


<asp:Table ID="primaryMemberSummaryTable" runat="server" BorderColor="black" BorderStyle="Solid"
BorderWidth="1px" CellPadding="5" GridLines="Horizontal"  BackColor="White" HorizontalAlign="Center" 
Width="750px">

<asp:TableRow ID="TableRow4" runat="server">
<asp:TableCell ID="TableCell7" runat="server" HorizontalAlign="Left" CssClass="tddark"><b>Name:</b></asp:TableCell>
<asp:TableCell ID="TableCell8" runat="server" CssClass="tddark"><asp:Label runat="server" ID="nameLabel"></asp:Label>
</asp:TableCell>
</asp:TableRow>

<asp:TableRow ID="TableRow6" runat="server">
<asp:TableCell ID="TableCell11" runat="server" CssClass="tdlight"><b>Email:</b></asp:TableCell>
<asp:TableCell ID="TableCell12" runat="server" CssClass="tdlight"><asp:Label runat="server" ID="email1Label"></asp:Label>
</asp:TableCell>
</asp:TableRow>

<asp:TableRow ID="TableRow8" runat="server" Height="20px">
<asp:TableCell ID="TableCell15" runat="server" CssClass="tddark"></asp:TableCell>
<asp:TableCell ID="TableCell16" runat="server" CssClass="tddark"></asp:TableCell>
</asp:TableRow>

<asp:TableRow ID="TableRow10" runat="server">
    <asp:TableCell runat="server" CssClass="tdlight" ID="donationAmountLabel1"><b>Donation Amount:</b></asp:TableCell>
    <asp:TableCell ID="TableCell1" runat="server" CssClass="tdlight"><asp:Label runat="server" ID="donationAmountLabel2"></asp:Label>
</asp:TableCell>
</asp:TableRow>

</asp:Table>


<br />

<p class="pj" style="text-align:center; font-family:Verdana; color:#443266">
To edit your donation, click on &quot;Previous&quot; to go back. To submit your donation 
and proceed to payment, click on &quot;Submit&quot;.<br /> To cancel your donation, click on 
&quot;Cancel&quot;</p>
</asp:WizardStep>

</WizardSteps>
</asp:Wizard>


</asp:Content>
