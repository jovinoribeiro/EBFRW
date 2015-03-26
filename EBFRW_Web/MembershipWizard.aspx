<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" Codebehind="MembershipWizard.aspx.cs" Inherits="test" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="membershipInfo">

    <asp:Wizard ID="ProcessMembership" runat="server" CellPadding="5" Width="100%" 
            OnActiveStepChanged="ProcessMembership_ActiveStepChanged" OnFinishButtonClick="ProcessMembership_FinishButtonClick" 
             HeaderText="Membership Registration" ActiveStepIndex="0" 
        BackColor="#EFF3FB" BorderColor="#B5C7DE" BorderWidth="1px" 
        Font-Names="Verdana" Font-Size="0.8em" Height="227px" 
        CancelDestinationPageUrl="~/Membership.aspx" DisplayCancelButton="True" 
        
        HeaderStyle-Width="300"

        SideBarStyle-Width="70"
        SideBarStyle-VerticalAlign="Top"

        StepStyle-Width="600"
        StepStyle-Height="100"
        StepStyle-VerticalAlign="Top"

        NavigationStyle-Width="100"
        NavigationStyle-HorizontalAlign="right"
        NavigationButtonStyle-Width="170" FinishCompleteButtonText="Submit" 
            FinishDestinationPageUrl="~/MembershipPayment.aspx" DisplaySideBar="False"
        >

        <HeaderStyle BackColor="#284E98" BorderColor="#507CD1" BorderStyle="Solid" 
            BorderWidth="0px" Font-Bold="True" Font-Size="1.9em" ForeColor="White" 
            HorizontalAlign="Center" />
        <NavigationButtonStyle BackColor="White" BorderColor="#507CD1" 
            BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="1.6em" 
            ForeColor="#284E98" CssClass="textEntryJr"  Width="100"/>

        <NavigationStyle HorizontalAlign="Right" Width="100px"></NavigationStyle>

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
                Font-Size="1.6em" ForeColor="#284E98" Text="Previous"  Width="100"/>
            <asp:Button ID="StepNextButton" runat="server" BackColor="White" 
                BorderColor="#507CD1" BorderStyle="Solid" BorderWidth="1px" 
                CommandName="MoveNext" Font-Names="Verdana" Font-Size="1.6em" 
                ForeColor="#284E98" Text="Next" ValidationGroup="CreateUserWizard1" Width="100" />
            <asp:Button ID="CancelButton" runat="server" BackColor="White" 
                BorderColor="#507CD1" BorderStyle="Solid" BorderWidth="1px" 
                CausesValidation="False" CommandName="Cancel" Font-Names="Verdana" 
                Font-Size="1.6em" ForeColor="#284E98" Text="Cancel"  Width="100"/>
        </StepNavigationTemplate>
        <StepStyle Font-Size="1.2em" ForeColor="#333333" BorderWidth="0px"  />
        <WizardSteps>
            <asp:WizardStep runat="server" ID="IntroductionStep" Title="Introduction">
                   <h3><p class="pj">Welcome!</p></h3>
                       <p class="pj">
                           In the following steps, we will guide you through submitting your membership 
                           application and paying for your membership dues.</p>
                       <p class="pj">
                           At any time click on &quot;Next&quot; to proceed, or click on &quot;Previous&quot; to return.
                       </p>
                       <p class="pj">
                           To cancel your request, click on &quot;Cancel&quot;.</p>
            </asp:WizardStep>
            <asp:WizardStep runat="server"   ID="RegisterOptionStep" Title="RegisterOption">
                <h3><p class="pj">Select your prefered way to submit your registration</p> </h3>
                   <p class="pj">
                        <asp:RadioButtonList ID="registerOptionBL" runat="server" CssClass="pj">
                            <asp:ListItem Selected="True" Text="Online: Recommended way. No manual form filling required." Value="Online"></asp:ListItem>
                            <asp:ListItem Value="Manual" Text="Manual: Manually both download the form and pay for membership dues"></asp:ListItem>
                        </asp:RadioButtonList>
                    </p>
            </asp:WizardStep>
            <asp:WizardStep runat="server" ID="MembershipTypeStep" Title="MembershipType">
             <div class="membershipInfo">
                <h3><p class="pj">Select one of the following plans</p></h3>
                <p class="pj">
                    <asp:PlaceHolder ID="membershipTypeBlistHolder" runat="server">
                        <asp:RadioButtonList ID="memtypeblistst" runat="server"></asp:RadioButtonList>
                    </asp:PlaceHolder>
                </p>
                </div>            
            </asp:WizardStep> 
            <asp:WizardStep runat="server" ID="Member1Step" Title="Member 1">
            <div class="membership">     
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="failureNotification" 
                 ValidationGroup="CreateUserWizard1"/>
                <h3><p class="pj">Enter primary member information</p></h3>
                <asp:Table ID="member1table" runat="server"  GridLines="none" BorderWidth="0px" BorderColor="Red" CssClass="pj">
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="Label1" runat="server"  AssociatedControlID="member1FirstNameTBox">First Name</asp:Label>
                        
                        
                        













</asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="member1FirstNameTBox" runat="server" CssClass="textEntryJr"></asp:TextBox> 
                        
                        
                        













</asp:TableCell>
                        <asp:TableCell>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="member1FirstNameTBox" 
                                CssClass="failureNotification" ToolTip="First name is required." 
                                ValidationGroup="CreateUserWizard1">First name is required</asp:RequiredFieldValidator>
                        
                        
                        













</asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="Label2" runat="server"  AssociatedControlID="member1LastNameTBox">Last Name</asp:Label>    
                        
                        
                        













</asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="member1LastNameTBox" runat="server" CssClass="textEntryJr"></asp:TextBox>   
                        
                        
                        













</asp:TableCell>
                        <asp:TableCell>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="member1LastNameTBox" 
                                CssClass="failureNotification" ErrorMessage="" ToolTip="Last name is required." 
                                ValidationGroup="CreateUserWizard1">Last name is required</asp:RequiredFieldValidator>    
                        
                        
                        













</asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="Label3" runat="server"  AssociatedControlID="member1BirthdayTBox">Birthday (mm/dd)</asp:Label>    
                        
</asp:TableCell>
                        <asp:TableCell>
                             <asp:TextBox ID="member1BirthdayTBox" runat="server" CssClass="textEntryJr"></asp:TextBox>
                        
                        
                        













</asp:TableCell>
                        <asp:TableCell>
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="member1BirthdayTBox" 
                                    CssClass="failureNotification" ErrorMessage="" ToolTip="Birthday (mm/dd) is required." 
                                    ValidationGroup="CreateUserWizard1">Birthday (mm/dd) is required</asp:RequiredFieldValidator>
                        
                        
                        













</asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="Label4" runat="server"  AssociatedControlID="member1EmailTBox">Email</asp:Label>
                        
                        
                        













</asp:TableCell>
                        <asp:TableCell>
                           <asp:TextBox ID="member1EmailTBox" runat="server" CssClass="textEntryJr"></asp:TextBox>
                        
                        
                        













</asp:TableCell>
                        <asp:TableCell>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="member1EmailTBox" 
                                CssClass="failureNotification" ErrorMessage="" ToolTip="Email is required." 
                                ValidationGroup="CreateUserWizard1">Email is required</asp:RequiredFieldValidator> 
                        
                        
                        













</asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="Label9" runat="server" AssociatedControlID="member1HomePhoneTBox">Home Phone (xxx-xxx-xxxx) </asp:Label>
                        
                        
                        













</asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="member1HomePhoneTBox" runat="server" CssClass="textEntryJr"></asp:TextBox>
                        
                        
                        













</asp:TableCell>
                        <asp:TableCell>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="member1HomePhoneTBox" 
                                CssClass="failureNotification" ErrorMessage="" ToolTip="Home Phone Number is required." 
                                ValidationGroup="CreateUserWizard1">Home Phone Number is required</asp:RequiredFieldValidator>
                        
                        













</asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="Label10" runat="server" AssociatedControlID="member1CellPhoneTBox">Cell Phone (xxx-xxx-xxxx)</asp:Label>
                        
                        
                        













</asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="member1CellPhoneTBox" runat="server" CssClass="textEntryJr"></asp:TextBox>
                        
                        
                        













</asp:TableCell>
                   
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="Label11" runat="server" AssociatedControlID="member1WorkPhoneTBox">Work Phone (xxx-xxx-xxxx)</asp:Label>
 
</asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="member1WorkPhoneTBox" runat="server" CssClass="textEntryJr"></asp:TextBox>
 
</asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </div>
            </asp:WizardStep>

            <asp:WizardStep runat="server" ID="Member2Step" Title="Member 2">
            <div class="membership">     
            <asp:ValidationSummary ID="ValidationSummary2" runat="server" CssClass="failureNotification" 
                 ValidationGroup="CreateUserWizard1"/>
                <h3><p class="pj">Enter Secondary member Information</p></h3>
                <asp:Table ID="member2table" runat="server"  GridLines="none" BorderWidth="0px" BorderColor="Red" CssClass="pj">
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="Label5" runat="server"  AssociatedControlID="member2FirstNameTBox">First Name</asp:Label> 
                        
                        
                        













</asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="member2FirstNameTBox" runat="server" CssClass="textEntryJr"></asp:TextBox> 
                        
                        
                        













</asp:TableCell>
                        <asp:TableCell>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="member2FirstNameTBox" 
                    CssClass="failureNotification" ErrorMessage="" ToolTip="First name is required." 
                    ValidationGroup="CreateUserWizard1">First name is required</asp:RequiredFieldValidator>
                        
                        
                        













</asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="Label6" runat="server"  AssociatedControlID="member2LastNameTBox">Last Name</asp:Label>    
                        
                        
                        













</asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="member2LastNameTBox" runat="server" CssClass="textEntryJr"></asp:TextBox>   
                        
                        
                        













</asp:TableCell>
                        <asp:TableCell>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="member2LastNameTBox" 
                                CssClass="failureNotification" ErrorMessage="" ToolTip="Last name is required." 
                                ValidationGroup="CreateUserWizard1">Last name is required</asp:RequiredFieldValidator>
                        
                        
                        













</asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="Label7" runat="server"  AssociatedControlID="member2BirthdayTBox">Date of Birth (mm/dd)</asp:Label>
                        
                        
                        













</asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="member2BirthdayTBox" runat="server" CssClass="textEntryJr"></asp:TextBox>
                        
                        
                        













</asp:TableCell>
                        <asp:TableCell>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="member2BirthdayTBox" 
                                CssClass="failureNotification" ErrorMessage="" ToolTip="Birthday (mm/dd) is required." 
                                ValidationGroup="CreateUserWizard1">Birthday (mm/dd) is required</asp:RequiredFieldValidator>
                        
                        
                        













</asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="Label8" runat="server"  AssociatedControlID="member2EmailTBox">Email</asp:Label> 
                        
                        
                        













</asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="member2EmailTBox" runat="server" CssClass="textEntryJr"></asp:TextBox>
                        
                        
                        













</asp:TableCell>
                        <asp:TableCell>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="member2EmailTBox" 
                                CssClass="failureNotification" ErrorMessage="" ToolTip="Email is required." 
                                ValidationGroup="CreateUserWizard1">Email is required</asp:RequiredFieldValidator> 
                        
                        
                        













</asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="Label12" runat="server" AssociatedControlID="member2HomePhoneTBox">Home Phone (xxx-xxx-xxxx)</asp:Label>
                        
                        
                        













</asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="member2HomePhoneTBox" runat="server" CssClass="textEntryJr"></asp:TextBox>
                        
                        
                        













</asp:TableCell>
                        <asp:TableCell>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="member2HomePhoneTBox" 
                                CssClass="failureNotification" ErrorMessage="" ToolTip="Home Phone Number is required." 
                                ValidationGroup="CreateUserWizard1">Home Phone Number is required</asp:RequiredFieldValidator> 
                        
                        
                        













</asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="Label13" runat="server" AssociatedControlID="member2CellPhoneTBox">Cell Phone (xxx-xxx-xxxx)</asp:Label>
                        
                        
                        













</asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="member2CellPhoneTBox" runat="server" CssClass="textEntryJr"></asp:TextBox>
                        
                        
                        













</asp:TableCell>
                        
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="Label14" runat="server" AssociatedControlID="member2WorkPhoneTBox">Work Phone (xxx-xxx-xxxx)</asp:Label>
                        
                        
                        













</asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="member2WorkPhoneTBox" runat="server" CssClass="textEntryJr"></asp:TextBox>
                        
                        
                        













</asp:TableCell>
                       
                    </asp:TableRow>
                </asp:Table>
            </div>
            </asp:WizardStep>
            <asp:WizardStep runat="server" ID="AddressStep" Title="AddressStep">
            <h3><p class="pj">Enter your address information</p></h3>
                <asp:Table ID="addressTable" runat="server"  GridLines="none" BorderWidth="0px" BorderColor="Red" CssClass="pj">
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="addressLabel1" runat="server" AssociatedControlID="address1TBox">Street</asp:Label>
                        
                        
                        













</asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="address1TBox" runat="server" CssClass="textEntryJr"></asp:TextBox>
                        
                        
                        













</asp:TableCell>
                        <asp:TableCell>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="address1TBox" 
                                CssClass="failureNotification" ErrorMessage="" ToolTip="Number and Streeet Address are required." 
                                ValidationGroup="CreateUserWizard1">Number and Streeet Address are required</asp:RequiredFieldValidator>
                        
                        
                        













</asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="addressLabel2" runat="server" AssociatedControlID="address2TBox">Apt</asp:Label>
                        
                        
                        













</asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="address2TBox" runat="server" CssClass="textEntryJr"></asp:TextBox>
                        
                        
                        













</asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="cityLabel" runat="server" AssociatedControlID="cityTBox">City</asp:Label>
                        
                        
                        













</asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="cityTBox" runat="server" CssClass="textEntryJr"></asp:TextBox>
                        
                        
                        













</asp:TableCell>
                        <asp:TableCell>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="cityTBox" 
                                CssClass="failureNotification" ErrorMessage="" ToolTip="City is required." 
                                ValidationGroup="CreateUserWizard1">City is required</asp:RequiredFieldValidator>
                        
                        
                        













</asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="stateLabel" runat="server" AssociatedControlID="stateTBox">State</asp:Label>
                        
                        
                        













</asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="stateTBox" runat="server" CssClass="textEntryJr"></asp:TextBox>
                        
                        
                        













</asp:TableCell>
                        <asp:TableCell>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="stateTBox" 
                                CssClass="failureNotification" ErrorMessage="" ToolTip="State is required." 
                                ValidationGroup="CreateUserWizard1">State is required</asp:RequiredFieldValidator>
                        
                        
                        













</asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="zipLabel" runat="server" AssociatedControlID="zipTBox">Zip</asp:Label>
                        
                        
                        













</asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="zipTBox" runat="server" CssClass="textEntryJr"></asp:TextBox>
                        
                        
                        













</asp:TableCell>
                        <asp:TableCell>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="zipTBox" 
                                CssClass="failureNotification" ErrorMessage="" ToolTip="Email is required." 
                                ValidationGroup="CreateUserWizard1">Zip code is required</asp:RequiredFieldValidator>
                        
                        
                        













</asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </asp:WizardStep>
            <asp:WizardStep ID="Phone" runat="server" Title="Emergency Contact">
                <h3><p class="pj">Enter your emergency contact information</p></h3>
                <asp:Table ID="emergencyContactTable" runat="server"  GridLines="none" BorderWidth="0px" BorderColor="Red" CssClass="pj">
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="emContactFirstNameLabel" runat="server" AssociatedControlID="emContactFirstNameTBox">First Name</asp:Label>
                        
                        
                        













</asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="emContactFirstNameTBox" runat="server" CssClass="textEntryJr"></asp:TextBox>
                        
                        
                        













</asp:TableCell>
                        <asp:TableCell>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ControlToValidate="emContactFirstNameTBox" 
                                CssClass="failureNotification" ErrorMessage="" ToolTip="Emergency contact first name is required." 
                                ValidationGroup="CreateUserWizard1">Emergency contact first name is required</asp:RequiredFieldValidator>
                        
                        
                        













</asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="emContactLastNameLabel" runat="server" AssociatedControlID="emContactLastNameTBox">Last Name</asp:Label>
                        
                        
                        













</asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="emContactLastNameTBox" runat="server" CssClass="textEntryJr"></asp:TextBox>
                        
                        
                        













</asp:TableCell>
                        <asp:TableCell>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" ControlToValidate="emContactLastNameTBox" 
                                CssClass="failureNotification" ErrorMessage="" ToolTip="Emergency contact last name is required." 
                                ValidationGroup="CreateUserWizard1">Emergency contact last name is required</asp:RequiredFieldValidator>
                        
                        
                        













</asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="emContactPhoneLabel" runat="server" AssociatedControlID="emContactPhoneTBox">Phone</asp:Label>
                        
                        
                        













</asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="emContactPhoneTBox" runat="server" CssClass="textEntryJr"></asp:TextBox>
                        
                        
                        













</asp:TableCell>
                        <asp:TableCell>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" ControlToValidate="emContactPhoneTBox" 
                                CssClass="failureNotification" ErrorMessage="" ToolTip="User Name is required." 
                                ValidationGroup="CreateUserWizard1">Emergency phone number is required</asp:RequiredFieldValidator>
                        
                        
                        













</asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </asp:WizardStep>
            <asp:WizardStep ID="extraOptionsStep" runat="server" Title="Extra Options">
                <h3><p class="pj">Select all the following that apply</p></h3>
                    <asp:CheckBoxList ID="checkList" runat="server" CssClass="pj">
                        <asp:ListItem Selected="True" 
                            Text="I consent to the use of photos from runs and other events that include my likeness on the Club's website"></asp:ListItem>
                        <asp:ListItem Selected="True" Text="I am willing to host an EBFR potluck (typical attendance 20-30)">
                            </asp:ListItem>
                    </asp:CheckBoxList>
                    <asp:CheckBox ID="mdir"  Checked="true"
                        Text="I wish to be listed in the membership directory distributed to members" 
                        Value="mdir" runat="server" CssClass="pj" />
                    <p class="pj">&nbsp If yes, I would like the following information included:</p>
                    <p class="pj"><asp:CheckBox ID="phoneNumber" Checked="true" Text="Phone Numbers" value="phoneNumber" runat="server" CssClass="pj" /></p>
                    <p class="pj"><asp:CheckBox ID="emails" Checked="true" Text="E-mails" value="emails" runat="server" CssClass="pj" /> </p>
                    <p class="pj"><asp:CheckBox ID="homeaddress" Checked="true" Text="Home Address" value="homeaddress" runat="server" CssClass="pj" /> </p>
            </asp:WizardStep>
            <asp:WizardStep ID="waiterSteP" runat="server" Title="Waiver">
                <h3><p class="pj">WAIVER</p></h3>
                <p class="pj">
                In consideration of your accepting my membership to the East Bay Front Runners and Walkers, I, the undersigned, 
                intending to be legally bound, hereby for myself, my heirs, executors and administrators, waive and release all 
                rights and claims for damages I may have against the East Bay Front Runners and Walkers, their representatives, 
                successors and assigns for any and all injuries suffered by me in any events sponsored by East Bay Front Runners. 
                I attest and verify that I am physically fit. <br />
                </p>
                <p class="pj">
                        As part of this release and waiver, I acknowledge that I have read and understand all of the above.
                </p>
                <p class="pj">
                <asp:Label ID="waiverL" Text="Initial:" runat="server"></asp:Label>
                    <asp:TextBox ID="waiverTBox" runat="server" Width="50px"></asp:TextBox>
                </p>
            </asp:WizardStep>
            <asp:WizardStep runat="server" ID="summaryStep" Title="Summary" StepType="Finish">
                <h6><p class="pj"><center>Summary of order</center></h6>
                <p class="pj">
                    <asp:Label ID="sumLabel" runat="server"></asp:Label>
                    <asp:Table ID="primaryMemberSummaryTable" runat="server" BorderColor="#AA0078" CellPadding="5"
                        BorderWidth="1px" GridLines="Both" HorizontalAlign="Center" Width="750px">
                        <asp:TableRow runat="server">
                            <asp:TableCell runat="server" Width="200px" HorizontalAlign="Left"><b>Membership Type:</b></asp:TableCell>
                            <asp:TableCell runat="server"><asp:Label runat="server" ID="memTypeLabel"></asp:Label>
</asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow ID="TableRow1" runat="server" Height="20px">
                            <asp:TableCell ID="TableCell1" runat="server"></asp:TableCell>
                            <asp:TableCell ID="TableCell2" runat="server"></asp:TableCell>
                        </asp:TableRow>          
                        <asp:TableRow runat="server">
                            <asp:TableCell runat="server" HorizontalAlign="left"><b>Name:</b></asp:TableCell>
                            <asp:TableCell runat="server"><asp:Label runat="server" ID="name1Label"></asp:Label>
</asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow runat="server">
                            <asp:TableCell runat="server"><b>Bday:</b></asp:TableCell>
                            <asp:TableCell runat="server"><asp:Label runat="server" ID="bday1Label"></asp:Label>
</asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow runat="server">
                            <asp:TableCell runat="server"><b>Email:</b></asp:TableCell>
                            <asp:TableCell runat="server"><asp:Label runat="server" ID="email1Label"></asp:Label>
</asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow runat="server">
                            <asp:TableCell runat="server"><b>Home Phone Number:</b></asp:TableCell>
                            <asp:TableCell runat="server"><asp:Label runat="server" ID="hpn1Label"></asp:Label>
</asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow runat="server">
                            <asp:TableCell runat="server"><b>Cell Phone Number:</b></asp:TableCell>
                            <asp:TableCell runat="server"><asp:Label runat="server" ID="cpn1Label"></asp:Label>
</asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow runat="server">
                            <asp:TableCell runat="server"><b>Work Phone Number:</b></asp:TableCell>
                            <asp:TableCell runat="server"><asp:Label runat="server" ID="wpn1Label"></asp:Label>
</asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow runat="server" Height="20px">
                            <asp:TableCell runat="server"></asp:TableCell>
                            <asp:TableCell runat="server"></asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow runat="server">
                            <asp:TableCell runat="server"><b>Name:</b></asp:TableCell>
                            <asp:TableCell runat="server"><asp:Label runat="server" ID="name2Label"></asp:Label>
</asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow runat="server">
                            <asp:TableCell runat="server"><b>Bday:</b></asp:TableCell>
                            <asp:TableCell runat="server"><asp:Label runat="server" ID="bday2Label"></asp:Label>
</asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow runat="server">
                            <asp:TableCell runat="server"><b>Email:</b></asp:TableCell>
                            <asp:TableCell runat="server"><asp:Label runat="server" ID="email2Label"></asp:Label>
</asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow runat="server">
                            <asp:TableCell runat="server"><b>Home Phone Number:</b></asp:TableCell>
                            <asp:TableCell runat="server"><asp:Label runat="server" ID="hpn2Label"></asp:Label>
</asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow runat="server">
                            <asp:TableCell runat="server"><b>Cell Phone Number:</b></asp:TableCell>
                            <asp:TableCell runat="server"><asp:Label runat="server" ID="cpn2Label"></asp:Label>
</asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow runat="server">
                            <asp:TableCell runat="server"><b>Work Phone Number:</b></asp:TableCell>
                            <asp:TableCell runat="server"><asp:Label runat="server" ID="wpn2Label"></asp:Label>
</asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow runat="server" Height="20px">
                            <asp:TableCell runat="server"></asp:TableCell>
                            <asp:TableCell runat="server"></asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow runat="server">
                            <asp:TableCell runat="server"><b>Address:</b></asp:TableCell>
                            <asp:TableCell runat="server"><asp:Label runat="server" ID="addressLabel"></asp:Label></asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow runat="server" Height="20px">
                            <asp:TableCell runat="server"></asp:TableCell>
                            <asp:TableCell runat="server"></asp:TableCell>
                        </asp:TableRow>          

                    <asp:TableRow>
                        <asp:TableCell><b>Emergency</b>:</asp:TableCell>
                        <asp:TableCell><asp:Label runat="server" ID="emContact"></asp:Label></asp:TableCell></asp:TableRow>
                        <asp:TableRow ID="TableRow2" runat="server" Height="20px">
                            <asp:TableCell ID="TableCell3" runat="server"></asp:TableCell>
                            <asp:TableCell ID="TableCell4" runat="server"></asp:TableCell>
                        </asp:TableRow>          

                    <asp:TableRow>
                        <asp:TableCell><b>Use photos online?</b></asp:TableCell>
                        <asp:TableCell><asp:Label ID="Photo_L" runat="server"></asp:Label></asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell><b>Host a potluck?</b></asp:TableCell>
                        <asp:TableCell><asp:Label ID="potluckL" runat="server"></asp:Label></asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell><b>Include Phone Number in Member's directory?</b></asp:TableCell>
                        <asp:TableCell><asp:Label ID="pn_L" runat="server"></asp:Label></asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell><b>Include Email Address in Member's directory?</b></asp:TableCell>
                        <asp:TableCell><asp:Label ID="em_L" runat="server"></asp:Label> </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell><b>Include Home Address in Member's directory?</b></asp:TableCell>
                        <asp:TableCell><asp:Label ID="HA_l" runat="server"></asp:Label></asp:TableCell>
                    </asp:TableRow>
         </asp:Table>
         </p>
                    <br />
                 
                    <p class="pj">
                        To edit your order, click on &quot;Previous&quot; to go back. To submit your order and 
                        proceed to payment, click on &quot;Submit&quot;. To cancel your order, click on &quot;Cancel&quot;</p>
                    


            </asp:WizardStep>
            <asp:WizardStep runat="server"  ID="ManualStep" Title="Manual" StepType="Complete">
                <h3><p class="pj">Manual Membership Form Download</p></h3>
                <p class="pj">1. Download (print) the Membership form (
                <a href="http://www.eastbayfrontrunners.org/uploads/2014_MembershipForm.docx" target="_blank">Word</a> /
                <a href="http://www.eastbayfrontrunners.org/uploads/2014_MembershipForm.pdf" target="_blank"> PDF</a>), 
                and completelly fill out the form.</p>
                <p class="pj">2. Mail the Membership form and a check for the membeship dues to the following address:<br />
                East Bay Front Runners <br /> 
                        P.O. Box 71722 <br />
                        Oakland, CA,  94612                   
                </p>  
                <p class="pj">Alternatively, you can also bring your Membership form, along with a check for the membeship dues, to one of our 
                Saturday morning runs and hand it to any of our officers.</p>
                 
                
            </asp:WizardStep>



        </WizardSteps>
    </asp:Wizard>

    </div>
</asp:Content>
