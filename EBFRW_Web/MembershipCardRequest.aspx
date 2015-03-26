<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" Inherits="MembershipCardRequest" Codebehind="MembershipCardRequest.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<h6 class="bold">Membership Card Request</h6>

    <p class="pj"><asp:Label ID="msg" runat="server">Please enter your name and email.</asp:Label></p>
    <div class="accountInfo">
    <fieldset class="login">
    <legend>Contact Information</legend>

    <asp:Table ID="contactTable" runat="server" class="pj" GridLines="none">
        <asp:TableRow>
            <asp:TableCell><asp:Label ID="name" Text="Name*" runat="server"></asp:Label></asp:TableCell>
            <asp:TableCell><asp:TextBox ID="nameTextBox" runat="server"></asp:TextBox> &nbsp;
                    <asp:requiredfieldvalidator id="RequiredFieldValidator1" class="validation"
                     controltovalidate="nameTextBox"
                        validationgroup="ContactGroup"
                        errormessage="Enter your name."
                            runat="Server">
                    </asp:requiredfieldvalidator> 
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell><asp:label ID="email" Text="E-mail*" runat="server"></asp:label></asp:TableCell>
            <asp:TableCell><asp:TextBox ID="emailTextBox" runat="server"></asp:TextBox> &nbsp;
                    <asp:requiredfieldvalidator id="RequiredFieldValidator2" class="validation"
                     controltovalidate="emailTextBox"
                        validationgroup="ContactGroup"
                        errormessage="Enter your email."
                            runat="Server">
                    </asp:requiredfieldvalidator>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell></asp:TableCell>
                <asp:TableCell><asp:Button ID="submitButton" Text="Submit" width="80px"  
        CausesValidation="true" ValidationGroup="ContactGroup" 
            runat="server" onclick="submitButton_Click" />
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    
    </fieldset>
    
    </div>


</asp:Content>

