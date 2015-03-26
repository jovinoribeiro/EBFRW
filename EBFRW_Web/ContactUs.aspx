﻿<%@ Page Title="" Language="C#" AutoEventWireup="True" CodeBehind="ContactUs.aspx.cs" Inherits="EBFRW_Web.ContactUs" %>

<!DOCTYPE html>
<html><head>
<title>EBFRW - Contact Us</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<meta name="description" content="" />
<!-- STYLES -->
<link rel="stylesheet" type="text/css" href="css/kickstart.css" media="all" />
<link rel="stylesheet" type="text/css" href="style.css" media="all" />
<link rel="stylesheet" type="text/css" href="to_top_styles.css" media="all" />
<link rel="stylesheet" type="text/css" href="tabsty-membership.css" media="screen" />

<!-- GOOGLE FONTS -->
<link href='http://fonts.googleapis.com/css?family=Audiowide' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Stalinist+One' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Shojumaru' rel='stylesheet' type='text/css'>

<!-- SCRIPTS -->
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="js/kickstart.js"></script>

</head>
<body>

<!-- START : MENU -->
<ul class="menu">
<li><a href="Default.aspx"><i class="icon-home"></i>&nbsp;Home</a></li>
<li ><a href="calendar.aspx"><i class="icon-calendar"></i>&nbsp;Calendar</a></li>
<li><a href="WeeklyRun.aspx"><i class="icon-heart"></i>&nbsp;Weekly Run</a></li>
<li><a href="http://www.eastbayfrontrunners.org/blog"><i class="icon-comments-alt"></i>&nbsp;Blog</a></li>
<li ><a href="PrideRun.aspx"><i class="icon-flag"></i>&nbsp;Pride Run</a></li>
<li ><a href="Membership.aspx"><i class="icon-shopping-cart"></i>&nbsp;Membership</a></li>
<li ><a href="pictures.aspx"><i class="icon-picture"></i>&nbsp;Pictures</a></li>
<li><a href="MembersOnly.aspx"><i class="icon-group"></i>&nbsp;Members Only</a></li>
<li class="current"><a href="ContactUs.aspx"><i class="icon-envelope"></i>&nbsp;Contact Us</a></li>
</ul>
<!-- END : MENU -->

<div class="clear"></div>

<!-- START: LOGO, AND ICONS (MENU) -->
<div class="callout clearfix">
	<div class="grid">
		<div class="col_12" />
			<img src="img/ebfrw_logo.png"/>
			<h5 id="ebfrwheader">
				...Gives us a shout anytime...
			</h5>
		</div>
	</div> <!-- END GRID -->
</div> <!-- end of callout -->

<div class="clear"></div>

<div class="callout calloutext1 clearfix">
	<!--<h4 id="header"><i class="icon-envelope icon-2x align-left"></i></h4>-->
	<div class="grid" >
		<form runat="server">
			<div class="col_6"></div>
			<div class="col_6"><label for="message"><h5 id="contact_label" >Message</h5></label></div>

			<div class="col_6">
                <label for="nameTextBox"><h5 id="contact_label">Name</h5></label>
				<asp:TextBox ID="nameTextBox" type="text"  placeholder="Your Name" runat="server"></asp:TextBox>
                <asp:requiredfieldvalidator id="RequiredFieldValidator1" class="validation"
                     controltovalidate="nameTextBox"
                        validationgroup="ContactGroup"
                        errormessage="Enter your name."
                            runat="Server">
                </asp:requiredfieldvalidator> 
                <div class="clear"></div>

                <label for="email"><h5 id="contact_label">Email</h5></label>
                <asp:TextBox ID="emailTextBox" runat="server" type="text" placeholder="Your Email"></asp:TextBox> 
                <asp:requiredfieldvalidator id="RequiredFieldValidator2" class="validation"
                     controltovalidate="emailTextBox"
                        validationgroup="ContactGroup"
                        errormessage="Enter your email."
                            runat="Server">
                </asp:requiredfieldvalidator>
                <div class="clear"></div>

                <label for="phone"><h5 id="contact_label">Phone</h5></label>
                <asp:TextBox ID="phoneTextBox" runat="server" type="text" placeholder="Optional"></asp:TextBox>
			</div>

			<div class="col_6">
                <asp:TextBox TextMode="MultiLine" Rows="10" Columns="50" ID="messageTextBox" runat="server"></asp:TextBox> &nbsp;
                    <asp:requiredfieldvalidator id="RequiredFieldValidator3" class="validation"
                     controltovalidate="messageTextBox"
                        validationgroup="ContactGroup"
                        errormessage="Enter your message."
                            runat="Server">
                    </asp:requiredfieldvalidator>               
                <div class="clear"></div>       
            </div>

			<div class="col_12">
            <asp:Button CssClass="red large" ID="submitButton" Text="Submit" width="80px"  
                    CausesValidation="true" ValidationGroup="ContactGroup" 
                    runat="server" onclick="submitButton_Click1" />
			</div>
            <div class="clear"></div>
		</form>
	</div>
    <asp:Label ID="messageResult" runat="server"></asp:Label>
</div>


<!-- ===================================== START FOOTER ===================================== -->
<div class="clear"></div>
<div id="footer">
	&copy; Copyright EBFRW 2010â€“2013 All Rights Reserved.
</div>

<a href="#" class="go-top">Go Top</a>

	<!-- JavaScript -->
	<!--<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>-->
	<script>
	    $(document).ready(function () {
	        // Show or hide the sticky footer button
	        $(window).scroll(function () {
	            if ($(this).scrollTop() > 200) {
	                $('.go-top').fadeIn(200);
	            } else {
	                $('.go-top').fadeOut(200);
	            }
	        });

	        // Animate the scroll to top
	        $('.go-top').click(function (event) {
	            event.preventDefault();

	            $('html, body').animate({ scrollTop: 0 }, 300);
	        })
	    });
	</script>
</body>
</html>



















