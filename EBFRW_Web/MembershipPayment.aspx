<%@ Page Title="" Language="C#"  AutoEventWireup="true" CodeBehind="MembershipPayment.aspx.cs" Inherits="EBFRW_Web.MembershipPayment" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head id="Head1" runat="server">
    <title></title>
    <link href="~/Styles/Site_General.css" rel="stylesheet" type="text/css" />
   <link href="~/Styles/UserFormatChoice4.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #master
        {
            margin-bottom: 4px;
        }
    </style>

    <script type="text/javascript">
       
    function printme()
    {
       
        document.paypal.item_name.value = '<%= Session["membership_type"] %>' + " Membership";
        document.paypal.item_number.value = "OrderNumber";
        document.paypal.amount.value = '<%= Session["amount"] %>';
        document.paypal.first_name.value = '<%= Session["member1FirstName"] %>';
        document.paypal.last_name.value = '<%= Session["member1LastName"] %>';
        document.paypal.address1.value = '<%= Session["address1"] %>';
        document.paypal.address2.value = '<%= Session["address2"] %>';
        document.paypal.city.value = '<%= Session["city"] %>';
        document.paypal.state.value = '<%= Session["state"] %>';
        document.paypal.zip.value = '<%= Session["zip"] %>';
        document.paypal.night_phone_a.value = '<%= Session["night_phone_a"] %>';
        document.paypal.night_phone_b.value = '<%= Session["night_phone_b"] %>';
        document.paypal.night_phone_c.value = '<%= Session["night_phone_c"] %>';
        document.paypal.on0.value = "EC:" + '<%= Session["emContactFirstName"] %>' + " " + '<%= Session["emContactLastName"] %>' +
            "-" + '<%= Session["emContactPhone"] %>' + "|" + "NL_PDF:" + '<%= Session["NL_PDF"] %>' + "|" + "NL_MAIL:" + '<%= Session["NL_MAIL"] %>' +
            "|" + "PIC:" + '<%= Session["PHOTO"] %>' + "MD:" + '<%= Session["M_DIR"] %>' + "|" + "PN:" + '<%= Session["PN"] %>' +
            "|" + "EM:" + '<%= Session["EM"] %>' + "AD:" + '<%= Session["HA"] %>'; 
        document.paypal.email.value = '<%= Session["member1Email"] %>';        
    
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

      <asp:Table ID="paymentStepTable" runat="server"  BorderWidth="0px" 
        GridLines="Both" HorizontalAlign="Center" Width="950px"  >
         <asp:TableRow><asp:TableCell ColumnSpan="3" Text="Membership Registration" HorizontalAlign="Center" 
                BackColor="#284E98" BorderColor="#507CD1" BorderStyle="Solid" 
            BorderWidth="0px" Font-Bold="True" Font-Size="1.9em" ForeColor="White"></asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        <asp:Table runat="server" borderwidth="1px"  Width="950px" HorizontalAlign="Center" BackColor="#EFF3FB" BorderColor="#B5C7DE">
         <asp:TableRow><asp:TableCell ColumnSpan="3"><h3>Thank you for your order!</h3></asp:TableCell></asp:TableRow>
         
         <asp:TableRow>
            <asp:TableCell ColumnSpan="3"><p class="pj">Your order has been submitted and will remain in "Pending" status until confirmation of payment. <br />
            To submit your payment, please choose one of the following methods of payment. If you choose our prefered method "PayPal", <br />
            you will be routed to the "www.paypal.com" website for processing of payment. Upon completion, you will be redirected back to our site.
            </p></asp:TableCell>
         </asp:TableRow>
         <asp:TableRow>
            <asp:TableCell><p class="pj"></p></asp:TableCell>
         </asp:TableRow>
         <asp:TableRow>
            <asp:TableCell HorizontalAlign="Center"  BorderWidth="0px" Width="45%"><h3>Mail</h3></asp:TableCell>
            <asp:TableCell HorizontalAlign="Center" BorderWidth="0px" Width="10%" RowSpan="2"><h3>OR</h3></asp:TableCell>
            <asp:TableCell HorizontalAlign="Center" BorderWidth="0px" Width="45%"><h3>PayPal</h3></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell HorizontalAlign="Center" BorderWidth="0px">Send check to the following address:<br />
                East Bay Front Runners <br /> 
                        P.O. Box 71722 <br />
                        Oakland, CA,  94612  </asp:TableCell>
            <asp:TableCell HorizontalAlign="Center" BorderWidth="0px">


   <form action="https://www.paypal.com/cgi-bin/webscr" method="post" onsubmit="return printme()" name="paypal">

    <input type="hidden" name="quantity" value="1" />
    <input type="hidden" name="address_override" value="1" />
    <input type="hidden" name="address_override" value="1" />
    
    <input type="hidden" name="item_name" value="Membership" />
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





