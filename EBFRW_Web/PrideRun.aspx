<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PrideRun.aspx.cs" Inherits="EBFRW_Web.PrideRun" %>
<!DOCTYPE html>
<html><head>
<title>EBFRW - Pride Run</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<meta name="description" content="" />
<!-- STYLES -->
<link rel="stylesheet" type="text/css" href="css/kickstart.css" media="all" />
<link rel="stylesheet" type="text/css" href="style.css" media="all" />
<link rel="stylesheet" type="text/css" href="to_top_styles.css" media="all" />
<link rel="stylesheet" type="text/css" href="tabsty.css" media="screen" />


<!-- GOOGLE FONTS -->
<link href='http://fonts.googleapis.com/css?family=Audiowide' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Stalinist+One' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Shojumaru' rel='stylesheet' type='text/css'>


<!-- SCRIPTS -->
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="js/kickstart.js"></script>

<script type="text/javascript">

    $(document).ready(function () {
        var d = new Date();

        var month = d.getMonth() + 1;
        var day = d.getDate();
        var hours = d.getHours();
        var year = d.getFullYear();

        if (year >= 2014 && month > 11 || year > 2014) {
           
            $("#run_details").hide();
            $("#registration_div").hide();
            $("#thankyou").show();
        } else {
            
            $("#registration_div").show();
            $("#run_details").show();
            $("#thankyou").hide();
        }

    });

    


</script>

</head>
<body>

<!-- START : MENU -->
<ul class="menu">
<li><a href="Default.aspx"><i class="icon-home"></i>&nbsp;Home</a></li>
<li><a href="calendar.aspx"><i class="icon-calendar"></i>&nbsp;Calendar</a></li>
<li><a href="WeeklyRun.aspx"><i class="icon-heart"></i>&nbsp;Weekly Run</a></li>
<li><a href="http://www.eastbayfrontrunners.org/blog"><i class="icon-comments-alt"></i>&nbsp;Blog</a></li>
<li class="current"><a href="PrideRun.aspx"><i class="icon-flag"></i>&nbsp;Pride Run</a></li>
<li><a href="Membership.aspx"><i class="icon-shopping-cart"></i>&nbsp;Membership</a></li>
<li><a href="pictures.aspx"><i class="icon-picture"></i>&nbsp;Pictures</a></li>
<li><a href="MembersOnly.aspx"><i class="icon-group"></i>&nbsp;Members Only</a></li>
<li><a href="ContactUs.aspx"><i class="icon-envelope"></i>&nbsp;Contact Us</a></li>
</ul>
<!-- END : MENU -->

<!-- START : TOP -->

<div id="run_details" class="callout clearfix" style="background:white;">
	
    <div class="grid">
   	    <h1><img src="img/ebfrw_logo.png"/></h1>
    	<div class="col_6">
			<img src="img/flyer.jpg" width="90%" height="100%" />
		</div>
		<div class="col_6">
			
			<span class="left" style="color:black;">
               <p class="center">Ten years and counting...</p>
			    <p>EBFRW's 10th Annual Pride Run and Walk is scheduled for Oct. 11, 2014 at 9AM, and we want you to be a part of it!</p>
			    <p>Join us at the recently renovated and beautiful Lake Merritt in downtown Oakland for a 10K run, 5K run, or 5K walk.</p>
			    <p>Stay afterwards and take in the community spirit and camaraderie of the East Bay's only pride race.</p>
			    <p>Every registered participant will receive a pair of rainbow-colored EBFRW running socks. Don't miss out!</p>
			</span>
			<h1 style="font-family:'Shojumaru', cursive; font-size:30px; color:#E9AB17;media:all;">
			    October, <span style="color:#F535AA">11th - </span><span style="color:#F535AA">9 AM</span></h1>
            <div style="background-color:#F535AA;padding:5px;">
			    <p class="center" style="color:black;font-weight:bold;">Location <br> Lakeside Park, Oakland <br> Starting point is near the intersection of Bellevue Ave. and Elitta Ave</p>
            </div>
            <hr />
            <p class="left" style="color:black;font-weight:bold;">Note: Due to constructions around the boat house, the approximate starting point is near the intersection of Bellevue Ave. and Elitta Ave. Parking may be limited.</p>
            <p class="left" style="color:black;font-weight:bold;">Note: The group will NOT be meeting for our regular weekly run during the race weekend</p>
            
		</div> 
	</div>
</div>
<!-- END: TOP -->
<div class="clear"></div>




<div id="thankyou" class="callout calloutext2 clearfix" style="background-color:White">
	<div class="grid">
     <h1><img src="img/ebfrw_logo.png"/></h1>
	<h1 id="h1" style="color:black;media:all;">THANK YOU</h1>
 	    <div class="col_12">
        <span style="color:black;">
	        <p>Thank you to all of our volunteers, sponsors, organizer committee, and most importantly all of you who joined us and helped us make this event a success.</p>
            <p>We hope you all had a good run and enjoyed yourselves along with old and new friends.</p>
            <p>Keep on running, being healthy, and we will see you again next year.</p>
        </span>
        </div>
        <div class="col_12">
            <a href="pride_run_results.aspx"><button class="orange large">Results</button></a>
        </div>
	</div>
</div>
<div class="clear"></div>


<!-- END: PRICE TABLE -->
<div class="clear"></div>
<!-- START: PRICE TABLE
<div class="clearfix callout" id="orangegradiant" style="backgroundd:#336699;color:black;">-->
<div class="callout calloutext1 clearfix" id="registration_div">
	<h1 id="header" style="color:black;media:all;">Registration</h1>
	<div class="grid">
        <div class="col_4">
				<div class="pricingtable">
					<div class="top">
						<h2>5K Walk</h2>
					</div>
					<ul>
						<li>1 lap around Lake Merritt</li>
						<li>No Running Please</li>
					</ul>
					<hr>
					<h1><sup>$</sup>20</h1>
					<a href="priderunregistration.aspx"><button class="blue large">Sign Up</button></a>
				</div>        
        </div>
        <div class="col_4">
				<div class="pricingtable">
					<div class="top">
						<h2>5K Run</h2>
					</div>
					<ul>
						<li>1 lap around Lake Merritt</li>
						<li>&nbsp;</li>
					</ul>
					<hr>
					<h1><sup>$</sup>20</h1>
					<a href="priderunregistration.aspx"><button class="blue large">Sign Up</button></a>
				</div>        
        </div>
        <div class="col_4">
				<div class="pricingtable">
					<div class="top">
						<h2>10K Run</h2>
					</div>
					<ul>
						<li>2 laps around Lake Merritt</li>
						<li>&nbsp;</li>
					</ul>
					<hr>
					<h1><sup>$</sup>20</h1>
					<a href="priderunregistration.aspx"><button class="blue large">Sign Up</button></a>
				</div>        
        </div>

	</div>
	<div class="col_12 center" ><strong><em>Prices go up to $25.00 on registration day
		<br/>Registration fees are non-refundable.</em></strong>
	</div>
</div>
<!-- END: PRICE TABLE -->
<div class="clear"></div>


<!-- START: BENEFICIARIES -->
<div class="callout calloutext2 clearfix">
	<div class="grid">
		<h1 id="header" style="color:black;media:all;">BENEFICIARIES</h1>
		<div class="col_6">
            <a href="http://www.oebgmc.org/" target="_blank">
			<img class="imgborder" src="http://eastbayfrontrunners.org/img/priderun/2012/OEBGMC.png"></img></a>
		</div>
		<div class="col_6">
			<a href="http://www.pacificcenter.org/" target="_blank">
            <img class="imgborder" src="http://eastbayfrontrunners.org/img/priderun/2012/pacificcenter.png" ></img></a>
		</div>
		<div class="col_4" style="display:none;">
			<a href="http://www.rboakland.org/" target="_blank">
            <img class="imgborder" src="http://eastbayfrontrunners.org/img/priderun/2012/rfbo-logo.png"></img></a>
		</div>
	</div>
</div>
<!-- END: BENEFICIARIES -->
<div class="clear"></div>

<!-- SPONSORS -->
<div class="callout calloutext1 clearfix" >
	<div class="grid">
		<h1 id="header" style="color:black;media:all;">Sponsors</h1>

        <div class="col_12 center">
            <a href="http://www.lmjs.org/" target="_blank">
                <img class="imgborder" src="img/lmjs.gif" width="300px" height="300px" />
            </a>
        </div>

        <div class="col_8 center" style="display:none;">
            <a href="http://drrichardburg.com/" target="_blank">
                <img class="imgborder caption" title="Dr Richard Burg - Chiropractor" src="http://eastbayfrontrunners.org/img/priderun/2012/activewelness.jpg" width="300px" height="300px" />
            </a>
        
         
            <a href="http://www.lmjs.org/" target="_blank">
                <img class="imgborder" src="img/lmjs.gif" width="300px" height="300px" />
            </a>
        
            <a href="http://tri-cityhealth.org/" target="_blank">
                <img class="imgborder" src="img/try_city.png" width="300px" height="300px" />
            </a>
         </div>
        <div class="col_4" style="display:none;">
            <div class="imgborder caption" title="test"><a href="http://www.theperfectsidekick.com/" target="_blank">
                <img class="imgborder" src="img/sidekick.jpg" /><img class="imgborder" src="img/sidekick1.jpg" width="200px" height="200px" />
            </a></div>
        </div>

                <div class="col_4">

        </div>
                <div class="col_4">

        </div>

		<div class="col_12">
			<h4>Want to see your name and/or logo here?</h4>
			<i class="icon-heart icon-4x" style="color:red;"></i><br/><br/>
			<a href="ContactUs.aspx"><button class="large red"><i class="icon-question-sign"></i>&nbsp;Contact Us</button></a>
		</div>
        <div class="col_4"></div>
	</div>
</div>
<!-- END SPONSORS -->

<!-- START: SPONSORSHIP TABLE
<div class="callout calloutext1 clearfix" style="background:#C8CFB4;#E9AB17;color:black;">-->
<div class="callout calloutext2 clearfix" >
	<h1 id="header" style="color:black;media:all;">Sponsorship Information</h1>
	<div class="grid">
		<div class="col_8 left">
			<table cellspacing="0" cellpadding="0" >
				<thead>
					<tr>
						<th><h4 class="right">Sponsorship Levels and<br/> Donation Ammount</h4></th>
						<th class="center">Ultra<br />Marathon<br /><span class="center">$250.00</span></th>
						<th class="center">Full<br />Marathon<br /><span class="center">$200.00</span></th>
						<th class="center">Half<br />Marathon<br /><span class="center">$150.00</span></th>
						<th class="center"><br/>10K&nbsp;&nbsp;<br /><span class="center">$100.00</span></th>
						<th class="center"><br/>5K&nbsp;&nbsp;<br /><span class="center">$50.00</span></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th>Name on EBFRW website</th>
						<td><i class="icon-ok-circle icon-2x" style="color:green"></i></td>
						<td><i class="icon-ok-circle icon-2x" style="color:green"></i></td>
						<td><i class="icon-ok-circle icon-2x" style="color:green"></i></td>
						<td><i class="icon-ok-circle icon-2x" style="color:green"></i></td>
						<td><i class="icon-ok-circle icon-2x" style="color:green"></i></td>
					</tr>
					<tr>
						<th>Link on website</th>
						<td><i class="icon-ok-circle icon-2x" style="color:green"></i></td>
						<td><i class="icon-ok-circle icon-2x" style="color:green"></i></td>
						<td><i class="icon-ok-circle icon-2x" style="color:green"></i></td>
						<td><i class="icon-ok-circle icon-2x" style="color:green"></i></td>
						<td><i class="icon-ban-circle icon-2x" style="color:red"></i></td>
					</tr>
					<tr>
						<th>Logo on website</th>
						<td><i class="icon-ok-circle icon-2x" style="color:green"></i></td>
						<td><i class="icon-ok-circle icon-2x" style="color:green"></i></td>
						<td><i class="icon-ok-circle icon-2x" style="color:green"></i></td>
						<td><i class="icon-ban-circle icon-2x" style="color:red"></i></td>
						<td><i class="icon-ban-circle icon-2x" style="color:red"></i></td>
					</tr>
					<tr>
						<th>Sponsor link, logo, promotional material <br /> on a general promo table at run</th>
						<td><i class="icon-ok-circle icon-2x" style="color:green"></i></td>
						<td><i class="icon-ok-circle icon-2x" style="color:green"></i></td>
						<td><i class="icon-ban-circle icon-2x" style="color:red"></i></td>
						<td><i class="icon-ban-circle icon-2x" style="color:red"></i></td>
						<td><i class="icon-ban-circle icon-2x" style="color:red"></i></td>
					</tr>
					<tr>
						<th>Table at the event or own both</th>
						<td><i class="icon-ok-circle icon-2x" style="color:green"></i></td>
						<td><i class="icon-ban-circle icon-2x" style="color:red"></i></td>
						<td><i class="icon-ban-circle icon-2x" style="color:red"></i></td>
						<td><i class="icon-ban-circle icon-2x" style="color:red"></i></td>
						<td><i class="icon-ban-circle icon-2x" style="color:red"></i></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="col_4 right">
			<div class="col_12 center">
				<h5>Have a question?</h5>
				<a href="ContactUs.aspx"><button class="large blue"><i class="icon-question-sign"></i>&nbsp;Contact Us</button></a>
			</div>
			<div class="col_12 center">
				<h5>Want to make an online donation?</h5>
               <a href="priderunregistration.aspx"><button class="large blue"><i class="icon-leaf"></i>&nbsp;Donation</button></a>
			</div>
			<div class="col_12 center">
				<h5>Prefer to donate via <br/> snail mail?</h5>
				<address>
					<p>East Bay Front Runners<br />
						P.O. Box 71722<br />
						Oakland, CA, 94612
					</p>
				</address>
			</div>
		</div>
	</div>
	<div class="col_12">
		<h4>	We can only be a success with your help and support. <br/>Thank you!</h4>
	</div>
</div>
<!-- END: SPONSORSHIP TABLE -->
<div class="clear"></div>

<!-- START: THE COURSE & VOLUNTEERING
<div class="callout clearfix" style="background:#A3AE7E;#FFFF32;color:black;">-->
<div class="callout calloutext1 clearfix" >
	<div class="grid">
		<div class="col_6 center">
			<h1 id="header" style="color:black;media:all;">The Course</h1>
			<p>The course of our Pride Run is flat, fun, and can be fast. <br>
			Participants will circle beautiful Lake Merritt once (5K Run/Walk) or twice (10K Run)
			</p>
			<img class="caption imgborder" title="Due to constructions around the lake, the course may vary"
				src="http://eastbayfrontrunners.org/img/prideruncourse.jpg"/>
		</div>
		<div class="col_6 center">
			<h1 id="header" style="color:black;media:all;">volunteering</h1>
			<h6>Care to give us a hand on race day with?</h6>
			<ul class="icons">
				<li><i class="icon-ok"></i>Course Monitor&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
				<li><i class="icon-ok"></i>Registration&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
				<li><i class="icon-ok"></i>Food/Water Tables</li>
				<li><i class="icon-ok"></i>Athletic Supporter&nbsp;&nbsp;</li>
				<li><i class="icon-ok"></i>Last Minute Things&nbsp;</li>
			</ul>
			<p>
				 It takes a village to stage a successful race. <br>Give us a shout and tell us your preference and availability.
			</p>
			<br/>
			<a href="ContactUs.aspx"><button class="large red"><i class="icon-question-sign"></i>&nbsp;Contact Us</button></a>
		</div>
	</div>
</div>
<!-- END: THE COURSE & VOLUNTEERING -->
<div class="clear"></div>


<!--<div class="callout clearfix" style="background:#C8CFB4;color:black;">-->
<div class="callout calloutext2 clearfix" >

	<h1 id="header" style="color:black;media:all;">Pride Run Pictures</h1>
	<div class="grid">
		<div class="gallery col_6">
			<a href="img/finisher_ribbons.jpg"><img src="img/finisher_ribbons.jpg" width="400" height="300"/></a>
		</div>
		<div class="gallery col_6 center">
        <a href="img/priderun/2013/_DSC8528.JPG"><img src="img/priderun/2013/_DSC8528.JPG" width="100" height="100"/></a>
        <a href="img/priderun/2013/_DSC8529.JPG"><img src="img/priderun/2013/_DSC8529.JPG" width="100" height="100"/></a>
        <a href="img/priderun/2013/_DSC8530.JPG"><img src="img/priderun/2013/_DSC8530.JPG" width="100" height="100"/></a>
        <a href="img/priderun/2013/_DSC8532.JPG"><img src="img/priderun/2013/_DSC8532.JPG" width="100" height="100"/></a>
        <a href="img/priderun/2013/_DSC8533.JPG"><img src="img/priderun/2013/_DSC8533.JPG" width="100" height="100"/></a>
        <a href="img/priderun/2013/_DSC8535.JPG"><img src="img/priderun/2013/_DSC8535.JPG" width="100" height="100"/></a>
        <a href="img/priderun/2013/_DSC8536.JPG"><img src="img/priderun/2013/_DSC8536.JPG" width="100" height="100"/></a>
		</div>
        <a href="pictures.aspx"><button class="large green"><i class="icon-picture"></i>&nbsp;More Pics</button></a>
        </div>
</div>


<!-- START: RESULTS
<div class="clearfix callout" id="orangegradiant" style="backgroundd:#336699;color:black;">-->
<div class="callout calloutext1 clearfix" id="result_div">
	<h1 id="header" style="color:black;media:all;">Race Results</h1>
	<div class="grid">
        
        <h3>This and previous year's race results can be found using the following link</h3>
        <a href="pride_run_results.aspx"><button class="orange large">Results</button></a>

	</div>
</div>
<div class="clear"></div>

</div><!-- END GRID-->

<!-- ===================================== START FOOTER ===================================== -->
<div class="clear"></div>
<div id="footer">@ Copyright EBFRW 2014 All Rights Reserved.</div>

<a href="#" class="go-top">Go Top</a>

<script src="prefixfree.min.js" type="text/javascript"></script>

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
</body></html>