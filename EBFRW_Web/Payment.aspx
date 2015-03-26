<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="EBFRW_Web.Payment" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head id="Head1" runat="server">
    <title></title>
    <link href="~/Styles/Site_General.css" rel="stylesheet" type="text/css" />
   <link href="~/Styles/UserFormatChoice4.css" rel="stylesheet" type="text/css" />
   <link href="Styles/prideregistration.css" rel="Stylesheet" type="text/css" />

    <style type="text/css">
        #master
        {
            margin-bottom: 4px;
        }
    </style>

    <script type="text/javascript">

        function printme() {
            document.paypal.item_name.value = "2012 EBFRW Pride Run Donation";
            //document.paypal.item_name_2.value = "Donation";
            //document.paypal.item_number.value = "RegNum:" + '<%= Session["registration_number"] %>';
            document.paypal.amount.value = "0.00";
            var don = '<%= Session["donation_amount"] %>';
            if (don != null && don != undefined && don.value != "0.00") {
                document.paypal.amount.value = parseFloat(don);
            }
            //alert(document.paypal.amount.value);
            //document.paypal.amount_2.value = '<%= Session["donationAmount"] %>';

            document.paypal.first_name.value = '<%= Session["donor_first_name"] %>';
            document.paypal.last_name.value = '<%= Session["donor_last_name"] %>';
            document.paypal.email.value = '<%= Session["donor_email"] %>';


            //document.paypal.address1.value = '<%= Session["address1"] %>';
            //document.paypal.address2.value = '<%= Session["address2"] %>';
            //document.paypal.city.value = '<%= Session["city"] %>';
            //document.paypal.state.value = '<%= Session["state"] %>';
            //document.paypal.zip.value = '<%= Session["zip"] %>';

            //document.paypal.night_phone_a.value = '<%= Session["night_phone_a"] %>';
            //document.paypal.night_phone_b.value = '<%= Session["night_phone_b"] %>';
            //document.paypal.night_phone_c.value = '<%= Session["night_phone_c"] %>';

            document.paypal.on0.value = "Name:" + '<%= Session["donor_first_name"] %>' + '<%= Session["donor_last_name"] %>' +
                    ":" + '<%= Session["donor_email"] %>';
            //return false;
            return true;
        }

    </script>
   

</head>
<body>
    <div class="page">
        <form id="master" runat="server">
            <div class="header">
                <div>
                    <asp:Image ID="lake" ImageUrl="img/header.gif" runat="server" Height="100px" Width="960px"/> 
                </div>
                <div class="title"><h1>East Bay Front Runners and Walkers</h1></div>
                <div class="loginDisplay">
                <asp:LoginView ID="HeadLoginView" runat="server" EnableViewState="false">
                    <AnonymousTemplate>
                        [ <a href="~/Account/Login.aspx" ID="HeadLoginStatus" runat="server">Log In</a> ]
                    </AnonymousTemplate>
                    <LoggedInTemplate>
                        Welcome <span class="bold"><asp:LoginName ID="HeadLoginName" runat="server" /></span>!
                        [ <asp:LoginStatus ID="HeadLoginStatus" runat="server" LogoutAction="Redirect" LogoutText="Log Out" LogoutPageUrl="~/Default.aspx"/> ]
                    </LoggedInTemplate>
                </asp:LoginView>
                </div>
                <div class="clear hideSkiplink">
                <asp:Menu  ID="NavigationMenu" runat="server" CssClass="menu" EnableViewState="false" IncludeStyleBlock="false" Orientation="Horizontal">
                <StaticSelectedStyle  BackColor="Yellow"/>
                    <Items>
                        <asp:MenuItem NavigateUrl="Default.aspx" Text="Home" /> 
                        <asp:MenuItem  Selectable="false" Text="Calendar">
                            <asp:MenuItem NavigateUrl="WeeklyRun.aspx" Text="Weekly Runs"  />
                            <asp:MenuItem NavigateUrl="LocalRuns.aspx" Text="Local Runs" />
                            <asp:MenuItem NavigateUrl="SocialCalendar.aspx" Text="Social" />
                        </asp:MenuItem>
                        <asp:MenuItem NavigateUrl="PrideRun.aspx" Text="Pride Run">
                            <asp:MenuItem NavigateUrl="PrideRunResults.aspx" Text="Results" />
                            <asp:MenuItem NavigateUrl="http://www.flickr.com/photos/ebfrw" Text="Pictures" />
                        </asp:MenuItem>
                        <asp:MenuItem NavigateUrl="Membership.aspx" Text="Membership" />
                        <asp:MenuItem NavigateUrl="ContactLinks.aspx" Text="Contact Links" >
                        </asp:MenuItem>
                        <asp:MenuItem NavigateUrl="MembersOnly.aspx" Text="Members"></asp:MenuItem>
                        <asp:MenuItem NavigateUrl="FAQ.aspx" Text="FAQs" />
                        <asp:MenuItem NavigateUrl="~/ContactUs.aspx" Text="Email Us"></asp:MenuItem>
                    </Items>
                </asp:Menu>
            </div>
        </form>
      </div>

      <asp:Table ID="paymentStepTable" runat="server"  BorderWidth="1px" BorderColor="#443266"
        GridLines="Both" HorizontalAlign="Center" Width="950px" >
         <asp:TableRow><asp:TableCell ColumnSpan="3"  Font-Size="2.9em" ForeColor="White"
            HorizontalAlign="Center" VerticalAlign="Middle" Text="2012 EBFRW PRIDE RUN AND WALK<br> DONATION" CssClass="ebsignup"></asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        <asp:Table ID="Table1" runat="server" GridLines="none" borderwidth="1px"  Width="950px" HorizontalAlign="Center" BackColor="#EFF3FB" BorderColor="#443266">
         <asp:TableRow><asp:TableCell ColumnSpan="3"><h3><center>Thank you for your donation!</center></h3></asp:TableCell></asp:TableRow>
         
         <asp:TableRow>
            <asp:TableCell ColumnSpan="5"><center><p class="pj">
            To submit your payment, please click on the "Pay Now" button bellow. <br />
            You will be routed to the "www.paypal.com" website for processing of payment. <br />Upon completion, you will be redirected back to our site.</center>
            </p></asp:TableCell>
         </asp:TableRow>
         <asp:TableRow>
            <asp:TableCell><p class="pj"></p></asp:TableCell>
         </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell HorizontalAlign="Center" BorderWidth="0px">

    <form action="https://www.paypal.com/cgi-bin/webscr" method="post" onsubmit="return printme()" name="paypal">

    <input type="hidden" name="quantity" value="1" />
    <input type="hidden" name="address_override" value="1" />
    <input type="hidden" name="address_override" value="1" />
    
    <input type="hidden" name="item_name" value="Donation" />
    <input type="hidden" name="item_number" value="" />
    <input type="hidden" name="amount" value="125.00">
    <input type="hidden" name="first_name" value="First Name" />
    <input type="hidden" name="last_name" value="Last Name" />
    <input type="hidden" name="address1" value="Address1" /> 
    <input type="hidden" name="address2" value="Address2" />    
    <input type="hidden" name="city" value="City" /> 
    <input type="hidden" name="country" value="US" />
    <input type="hidden" name="state" value="State" /> 
    <input type="hidden" name="zip" value="Zip" /> 
    <input type="hidden" name="email" value="" />
    <input type="hidden" name="night_phone_a" value="" />
    <input type="hidden" name="night_phone_b" value="" />
    <input type="hidden" name="night_phone_c" value="" />
    <input type="hidden" name="on0" value="Add here the other fields: Emergency Contact, etc" />

    <input type="hidden" name="no_shipping" value="1" />
    <input type="hidden" name="no_note" value="1" />
    <input type="hidden" name="business" value="ebfrw@yahoo.com" />
    <input type="hidden" name="cmd" value="_xclick">
    <input type="hidden" name="lc" value="US">
    <input type="hidden" name="currency_code" value="USD">
    <input type="hidden" name="cn" value="Add special instructions to the seller">
    <input type= "hidden" name="return" value="http://www.eastbayfrontrunners.org/Default.aspx">
 

     <input type="hidden" name="bn" value="PP-BuyNowBF:btn_buynowCC_LG.gif:NonHosted">


    <input type="image" src="https://www.paypalobjects.com/WEBSCR-640-20110429-1/en_US/i/btn/btn_paynowCC_LG.gif" border="0" name="submit" alt="PayPal - The safer, easier way to pay online!">
    <img alt="" border="0" src="https://www.paypalobjects.com/WEBSCR-640-20110429-1/en_US/i/scr/pixel.gif" width="1" height="1">
    </form>     
            
            </asp:TableCell>
        </asp:TableRow>
      </asp:Table>
      <br />

      </div>
        <div class="footer">
        Copyright East Bay Front Runners and Walkers. All rights reserved.
        </div>
         

</body>
</html>