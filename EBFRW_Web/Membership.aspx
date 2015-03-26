<%@ Page Title="" Language="C#" AutoEventWireup="true" Inherits="Membership" Codebehind="Membership.aspx.cs" %>

<!DOCTYPE html>
<html><head>
<title>EBFRW - Membership</title>
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
<li><a href="calendar.aspx"><i class="icon-calendar"></i>&nbsp;Calendar</a></li>
<li><a href="WeeklyRun.aspx"><i class="icon-heart"></i>&nbsp;Weekly Run</a></li>
<li><a href="http://www.eastbayfrontrunners.org/blog"><i class="icon-comments-alt"></i>&nbsp;Blog</a></li>
<li ><a href="PrideRun.aspx"><i class="icon-flag"></i>&nbsp;Pride Run</a></li>
<li class="current"><a href="Membership.aspx"><i class="icon-shopping-cart"></i>&nbsp;Membership</a></li>
<li ><a href="pictures.aspx"><i class="icon-picture"></i>&nbsp;Pictures</a></li>
<li><a href="MembersOnly.aspx"><i class="icon-group"></i>&nbsp;Members Only</a></li>
<li><a href="ContactUs.aspx"><i class="icon-envelope"></i>&nbsp;Contact Us</a></li>
</ul>
<!-- END : MENU -->

<!-- START: LOGO, AND ICONS (MENU) -->
<div class="callout clearfix">
	<div class="grid">
		<div class="col_12" />
			<img src="img/ebfrw_logo.png"/>
			<h5 id="ebfrwheader">
				...Joining our group is quick and easy...
			</h5>
		</div>
	</div> <!-- END GRID -->
</div> <!-- end of callout -->
<!-- START: LOGO, AND ICONS (MENU) -->
<div class="clear"></div>

<!-- START TOP -->
<div class="callout calloutext1 clearfix">
	<div class="grid">
		<h1 id="header" style="color:black;media:all;">Membership Information</h1>
		<div class="col_4 center">
			<h4><i class="icon-credit-card icon-4x align-left"></i></h4>
		</div>
		<div class="col_8 center">
			<p>Membership in East Bay Front Runners and Walkers is open to everyone.</p>

			<div class="col_6">
			<h5 style="color:black;media:all;">Membership Benefits</h5>
			<ul class="icons">
				<li><i class="icon-ok"></i>Discount at our local partners</li>
				<li><i class="icon-ok"></i>Access to our Yahoo Group</li>
			</ul>
			</div>
			<div class="col_6">
			<h5 style="color:black;media:all;">Register in 2 steps</h5>
			<ul class="icons">
				<li><i class="icon-ok"></i>Submit a membership application form</li>
				<li><i class="icon-ok"></i>Submit payment of membership dues&nbsp;</li>
			</ul>
			</div>
		</div>
	</div>
</div>

<!-- START: REGISTRATION TABLE -->
<div class="clearfix callout calloutext2">

	<div class="grid">
		<h1 id="header">Dues&nbsp;&nbsp;<i class="icon-money icon-2x align-left"></i></h1>
		<div class="col_3">
            <div class="pricingtable" id="Div1">
			    <div class="top">
					<h2 id="H1">Individual</h2>
				</div>
				<h1><sup>$</sup><asp:Label ID="individual" runat="server"/></h1>
				<a href="MembershipWizard.aspx"><button class="blue large">Sign Up</button></a>
			</div>          
        </div>
		<div class="col_3">
            <div class="pricingtable" id="Div2">
			    <div class="top">
					<h2 id="H2">Household</h2>
				</div>
				<h1><sup>$</sup><asp:Label ID="household" runat="server" /></h1>
				<a href="MembershipWizard.aspx"><button class="blue large">Sign Up</button></a>
			</div>          
        </div>
		<div class="col_3">
            <div class="pricingtable" id="Div3">
			    <div class="top">
					<h2 id="H3">Senior / Student <br />Individual</h2>
				</div>
				<h1><sup>$</sup><asp:Label ID="senior_student_individual" runat="server" /></h1>
				<a href="MembershipWizard.aspx"><button class="blue large">Sign Up</button></a>
			</div>          
        </div>
		<div class="col_3">
            <div class="pricingtable" id="Div4">
			    <div class="top">
					<h2 id="H4">Senior / Student <br />Household</h2>
				</div>
				<h1><sup>$</sup><asp:Label ID="senior_student_household" runat="server" /></h1>
				<a href="MembershipWizard.aspx"><button class="blue large">Sign Up</button></a>
			</div>          
        </div>
        

	</div>
	<div class="col_12 center" ><strong><em>We offer half year membership between 07/01 until 11/30 of current year
		</em></strong>
	</div>
</div>
<!-- END: REGISTRATION TABLE -->
<div class="clear"></div>

<!-- START: LOCAL PARTNERS -->
<div class="callout clearfix calloutext1">
	<div class="grid">
		<h1 id="header" style="color:black;media:all;">LOCAL PARTNERS</h1>
		<div class="col_4">
			<img class="imgborder" src="http://eastbayfrontrunners.org/img/sportsbasement.bmp" style="height:64px;width:140px;">
			<p>EBFRW members receive 10% off all merchandise at their four retail locations</p>
			<address><p>1881 Ygnacio Valley Rd </br>Walnut Creek, CA 94598<br/>925-941-6100</p></address>
		</div>
		<div class="col_4">
			<img class="imgborder" src="http://eastbayfrontrunners.org/img/transport.bmp" style="height:39px;width:230px;">
			<p>EBFRW members receive a 10% discount on all store merchandise</p>
			<address><p>6014 College Ave<br />Oakland, CA <br />94618</p></address>
		</div>
		<div class="col_4">
			<img class="imgborder" src="http://eastbayfrontrunners.org/img/seejanerun.bmp" style="height:129px;width:129px;">
			<p>EBFRW members receive 15% off all non-sale merchandise, excluding wetsuits, electronics, training and events</p>
			<address><p>5817 College Ave <br />Oakland, CA  94618 <br />510 428-2681</p></address>
		</div>

		<div class="col_4">
			<img class="imgborder" src="http://eastbayfrontrunners.org/img/haka.bmp" style="height:92px;width:200px;">
			<p>For services not covered by insurance: Offering EBFRW members $25 off their first visit, and $10 off each subsequent visit</p>
			<address><p>Dr. Aundi Mevoli DC, ART, CCEP<br />2000 Hearst Ave., Suite 201 
                    <br />Berkeley, CA 94709<br />510-704-1505</p></address>
		</div>
		<div class="col_4">
			<img class="imgborder" src="http://eastbayfrontrunners.org/img/innersport.bmp" style="height:103px;width:146px;">
			<p>For services not covered by insurance: Offering EBFRW members $25 off their first visit, and $10 off each subsequent visit</p>
			<address><p>1250 Addison St #102<br />Berkeley, CA <br />510 883-1126</p></address>
		</div>
		<div class="col_4">
			<img class="imgborder" src="http://eastbayfrontrunners.org/img/activewelness.jpg" style="height:129px;width:129px;">
			<p>Offering EBFRW members $42 off their first visit and $10 off each subsequent visit. This excludes; Medicare, Personal Injury, Work Comp and Billed Insurance</p>
			<address><p>Dr. Richard Burg<br />Chiropractor<br />Certified ART Provide
                <br />Nutrition Consultant<br /> 2509 Milvia Street<br />Berkeley, CA 94704<br />Ph:  510-843-1234<br /> Fax:  510-843-1209</p></address>
		</div>

			<div class="col_12 center" ><strong><em>On all of the above offers, some restrictions may apply. <br />
			Merchants reserve the right to change or terminate these arrangements without prior notice. <br />
			Present your EBFRW membership card as proof of your eligibility to receive these discount offers.
				</em></strong>
			</div>
	</div>
</div>
<!-- END: LOCAL PARTNERS -->
<div class="clear"></div>

<!-- ===================================== START FOOTER ===================================== -->
<div class="clear"></div>
<div id="footer">
	&copy; Copyright EBFRW 2010â€“2013 All Rights Reserved.
</div>

<a href="#" class="go-top">Go Top</a>

	<!-- JavaScript -->
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
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



















