﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="blog.aspx.cs" Inherits="EBFRW_Web.blog" %>

<!DOCTYPE html>
<html><head>
<title>EBFRW - Blog</title>
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
<li><a href="Membership.aspx"><i class="icon-shopping-cart"></i>&nbsp;Membership</a></li>
<li class="current"><a href="pictures.aspx"><i class="icon-picture"></i>&nbsp;Pictures</a></li>
<li><a href="MembersOnly.aspx"><i class="icon-group"></i>&nbsp;Members Only</a></li>
<li><a href="ContactUs.aspx"><i class="icon-envelope"></i>&nbsp;Contact Us</a></li>
</ul>
<!-- END : MENU -->
<div class="clear"></div>

<!-- START: LOGO, AND ICONS (MENU) -->
<div class="callout clearfix">
	<img src="img/ebfrw_logo.png"/>
	<h5 id="ebfrwheader">
		...Check out what we have been doing here...
	</h5>
</div> <!-- end of callout -->
<!-- END: LOGO, AND ICONS (MENU) -->
<div class="clear"></div>

<div class="callout calloutext1 clearfix">
	<!--<h1 id="header" style="color:#BLACK;#FFFF00;990033;749749;media:all;">EBFRW Blog</h1>-->
	<div class="grid">
    <iframe width="100%" height="2000px" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" 
    src="http://www.eastbayfrontrunners.org/blog"></iframe>
    </div>
</div> <!-- END OF CALL OUT -->
<div class="clear"></div>

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














