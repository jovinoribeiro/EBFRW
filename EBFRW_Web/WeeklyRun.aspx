<%@ Page Title="" Language="C#" AutoEventWireup="true" Inherits="Schedule" 
    Codebehind="WeeklyRun.aspx.cs" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<!DOCTYPE html>
<html><head>
<title>EBFRW - Weekly run</title>
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
<li class="current"><a href="WeeklyRun.aspx"><i class="icon-heart"></i>&nbsp;Weekly Run</a></li>
<li><a href="http://www.eastbayfrontrunners.org/blog"><i class="icon-comments-alt"></i>&nbsp;Blog</a></li>
<li><a href="PrideRun.aspx"><i class="icon-flag"></i>&nbsp;Pride Run</a></li>
<li><a href="Membership.aspx"><i class="icon-shopping-cart"></i>&nbsp;Membership</a></li>
<li><a href="pictures.aspx"><i class="icon-picture"></i>&nbsp;Pictures</a></li>
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
				Here are some directions to help you. <br /> Don't get lost.
			</h5>
		</div>
	</div> <!-- END GRID -->
</div> <!-- end of callout -->
<!-- START: LOGO, AND ICONS (MENU) -->
<div class="clear"></div>

<div class="callout calloutext1 clearfix">
<!--
<div class="grid">
<p>This weekend is our Pride Run.</p>
        <p>We will <span style="color:red;font-weight:bold;">NOT</span> be meeting for our regular weekly run.</p>
        <p>More information (location/time) about our pride run can be found <a href="PrideRun.aspx">here</a></p>
</div>
-->
<div class="grid">
    <h1 id="header" style="color:black;">Weekly Saturday Runs/Walks</h1>
    <div class="col_4">
    </div>
    <div class="col_4 center">  
        <!-- This table is dynamically built. It will contains the date/run location -->
       <asp:Table ID="runOutterTable" runat="server">
            <asp:TableHeaderRow>
            </asp:TableHeaderRow>
        </asp:Table>            
    </div>
   <div class="clear"></div>
    <h5>Meeting time is every Saturday at 9:00 AM. <br />Brunch to follow.</h5>    
</div>
</div>

<div class="callout calloutext2 clearfix">
    <div class="grid">
    <h5>Click on the following tabs for directions to our runs</h5>
        <div class="col_12">

            <!-- Tabs Left -->
            <ul class="tabs left">
            <li><a href="#tabr1">Lake Chabot/Castro Valley</a></li>
            <li><a href="#tabr2">Lake Merritt/Oakland</a></li>
            <li><a href="#tabr3">Bay Farm Island/Alameda</a></li>
            <li><a href="#tabr4">Emeryville Marina</a></li>
            <li><a href="#tabr5">Strawberry Canyon/Berkeley</a></li>
            <li><a href="#tabr6">San Leandro Marina/San Leandro</a></li>
            </ul>

             <div id="tabr1" class="tab-content">
               <h6 >Lake Chabot Marina <br />17600 Lake Chabot Road - Castro Valley, CA 94546</h6>
               <div class="col_12 ">
				     <h1>Directions</h1>
                    <div class="col_6">
                    	<h5>From Oakland</h5>
						<ol class="left">
							<li>Take Highway 580 south and take the 150th Avenue exit</li>
							<li>Go straight to the 2nd light and turn left on Fairmont Drive</li>
							<li>Follow Fairmont Drive up the hill</li>
							<li>On the downhill side Fairmont Drive turns into Lake Chabot Road</li>
							<li>The Lake Chabot Marina will be on the left</li>
							<li>Park on Lake Chabot Road for free or pay $5 to park in the Regional Park parking lot</li>
						</ol>
					</div>
					<div class="col_6">
						<h5>From San Jose</h5>
						<ol class="left">
							<li>Take highway 880 north to highway 238. Take 238 to Highway 580 north toward Oakland</li>
							<li>Take the 150th Avenue exit. At the stop sign turn left to the first stoplight</li>
							<li>At the stoplight turn right on Fairmont Drive and follow up the hill</li>
							<li>On the downhill side Fairmont Drive turns into Lake Chabot Road</li>
							<li>The Lake Chabot Marina will be on the left</li>
							<li>Park on Lake Chabot Road for free or pay $5 to park in the Regional Park parking lot></li>
						</ol>
					</div>
				</div>
				<div class="col_12">
						<h1>Map</h1>
<iframe width="100%" height="394" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" 
src="https://maps.google.com/maps?ie=UTF8&amp;cid=6927850299889457865&amp;q=Lake+Chabot+Regional+Park&amp;gl=US&amp;hl=en&amp;ll=37.716553,-122.104024&amp;spn=0.006295,0.006295&amp;t=m&amp;output=embed">
</iframe><br />
<small>
<a href="https://maps.google.com/maps?ie=UTF8&amp;cid=6927850299889457865&amp;q=Lake+Chabot+Regional+Park&amp;gl=US&amp;hl=en&amp;ll=37.716553,-122.104024&amp;spn=0.006295,0.006295&amp;t=m&amp;source=embed" style="color:#0000FF;text-align:left">View Larger Map
</a>
</small>
                </div>
				
                <div class="col_12">
<h1>Brunch</h1> is at Rancho Steak House, 3240 Castro Valley Blvd., Castro Valley, CA 95456 - (510) 940-2482
<br /><small><a href="https://www.google.com/maps/dir/Chabot+Regional+Park,+9999+Redwood+Rd,+Castro+Valley,+CA+94552/3240+Castro+Valley+Blvd,+Castro+Valley,+CA+94546/@37.7052499,-122.1683792,12z/data=!4m13!4m12!1m5!1m1!1s0x808f8ef22aceba01:0x6807f11b60f3fd56!2m2!1d-122.103401!2d37.750158!1m5!1m1!1s0x808f9226133ec473:0x7768d1c3b5ca61f0!2m2!1d-122.0790248!2d37.6958064?hl=en-US" style="color:#0000FF;text-align:left">View Larger Map</a></small>
            </div>  
            <div class="col_12">
                <h1>3.36 Mile Run Course - East Leg</h1>
                    <iframe width="100%" height="800" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" 
                    src="http://www.mapmyrun.com/us/ashland-ca/east-leg-route-76958548"></iframe>
                    <br /><small><a href="http://www.mapmyrun.com/us/ashland-ca/east-leg-route-76958548" target="_blank" style="color:#0000FF;text-align:left">
                    More Details</a></small>
            </div>
            <div class="col_12">
                <h1>3.37 Mile Run Course - West Leg</h1>
                    <iframe width="100%" height="800" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" 
                    src="http://www.mapmyrun.com/routes/fullscreen/301604543/#center"></iframe>
                    <br /><small><a href="http://www.mapmyrun.com/routes/fullscreen/301604543/#center" target="_blank" style="color:#0000FF;text-align:left">
                    More Details</a></small>
            </div>
            </div>

            <div id="tabr2" class="tab-content">
               <h6 >Lake Merritt<br />1418 Lakeside Drive, Oakland</h6>
               <div class="col_12 ">
				     <h1>Directions</h1>
                    <div class="col_6">
                    	<h5> I-880 Southbound</h5>
						<ol class="left">
							<li>Take the Broadway exit</li>
							<li>Turn right on 7th Street</li>
							<li>Continue about 1.5 miles to Oak Street, and turn left</li>
							<li>Oak Street becomes Lakeside Drive at 14th Street</li>
						</ol>
					</div>
					<div class="col_6">
						<h5>I-880 Northbound</h5>
						<ol class="left">
							<li>Take the Oak Street exit and turn right</li>
							<li>Oak Street becomes Lakeside Drive at 14th Street (Oak Street/Lakeside Drive is one-way northbound)</li>
						</ol>
					</div>
				</div>
				<p>Meet at 1418 Lakeside Drive, at the corner of 14th Street, in front of the historical Camron-Stanford House.
				<br />Metered street parking is available near the Camron-Stanford House; non-metered street parking is available farther north on Lakeside Drive.
				<br />Metered parking is available on 14th Street and along Oak Street.</p>
				<div class="col_12">
						<h1>Map</h1>
						<iframe width="100%" height="394" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="http://maps.google.com/maps?hl=en&amp;ie=UTF8&amp;view=map&amp;cid=12466089905781239417&amp;q=Camron-Stanford+House&amp;t=m&amp;layer=c&amp;cbll=37.80155,-122.262584&amp;panoid=OIQpb7wAvu1ScEjAIefShw&amp;cbp=13,119.99,,0,-0.59&amp;ll=37.80155,-122.262584&amp;spn=0.000017,0.012059&amp;z=16&amp;source=embed&amp;output=svembed"></iframe><br /><small><a href="http://maps.google.com/maps?hl=en&amp;ie=UTF8&amp;view=map&amp;cid=12466089905781239417&amp;q=Camron-Stanford+House&amp;t=m&amp;layer=c&amp;cbll=37.80155,-122.262584&amp;panoid=OIQpb7wAvu1ScEjAIefShw&amp;cbp=13,119.99,,0,-0.59&amp;ll=37.80155,-122.262584&amp;spn=0.000017,0.012059&amp;z=16&amp;source=embed" target="_blank" style="color:#0000FF;text-align:left">View Larger Map and/or Get Directions</a></small>
                </div>
				<div class="col_12">
						<h1>Brunch</h1> is at Lakeshore Café. 3257 Lakeshore Avenue, Oakland, CA 94610.
<iframe src="https://www.google.com/maps/embed?pb=!1m29!1m12!1m3!1d12608.87135539034!2d-122.26336693245452!3d37.80836624320253!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m14!1i0!3e6!4m5!1s0x808f874a7dcebe41%3A0x421b20e475b404a5!2s1418+Lakeside+Dr%2C+Oakland%2C+CA+94612!3m2!1d37.8014422!2d-122.2621662!4m5!1s0x808f87419a404d2f%3A0x1f54e559bbe4a5c9!2s3257+Lakeshore+Ave%2C+Oakland%2C+CA+94610!3m2!1d37.8104764!2d-122.2449237!5e0!3m2!1sen!2sus!4v1427336930717" width="100%" height="394" frameborder="0" scrolling="no" marginheight="0" marginwidth="0">
</iframe> <br />
<small>
<a href="https://www.google.com/maps/embed?pb=!1m29!1m12!1m3!1d12608.87135539034!2d-122.26336693245452!3d37.80836624320253!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m14!1i0!3e6!4m5!1s0x808f874a7dcebe41%3A0x421b20e475b404a5!2s1418+Lakeside+Dr%2C+Oakland%2C+CA+94612!3m2!1d37.8014422!2d-122.2621662!4m5!1s0x808f87419a404d2f%3A0x1f54e559bbe4a5c9!2s3257+Lakeshore+Ave%2C+Oakland%2C+CA+94610!3m2!1d37.8104764!2d-122.2449237!5e0!3m2!1sen!2sus!4v1427336930717" target="_blank" style="color:#0000FF;text-align:left">View Larger Map and/or Get Directions</a>
</small>
                </div>
                <div class="col_12">
                <h1>3.2 Mile Loop Run Course</h1>
                    <iframe width="100%" height="800" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" 
                    src="http://www.mapmyrun.com/routes/fullscreen/300983449/#center"></iframe>
                    <br /><small><a href="http://www.mapmyrun.com/routes/fullscreen/300983449/#center" target="_blank" style="color:#0000FF;text-align:left">
                    More Details</a></small>
                </div>

            </div>

            <div id="tabr3" class="tab-content">
               <h6 >Bay Farm Island<br />Veterans Court, Alameda</h6>
               <div class="col_12 ">
				     <h1>Directions</h1>
                    <div class="col_12">
                    	<h5> I-880 Southbound</h5>
						<ol class="left">
							<li>Take the High St. exit</li>
							<li>Head west on High Street (toward San Francisco Bay) and cross the bridge into Alameda</li>
							<li>Continue on High Street 1.1 miles to the stoplight at Otis</li>
							<li>Turn left on Otis and follow it over the bridge onto Bay Farm Island</li>
							<li>Veer right onto Island Drive, then immediately sharp right onto Veterans Court</li>
						</ol>
					</div>
				</div>
				<p>Meet at the end of Veterans Court next to the bay, just across the Otis Drive bridge from
					the main part of Alameda. Free parking on street.
				</p>
				<div class="col_12">
						<h1>Map</h1>
						<iframe width="100%" height="394" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" 
                src="http://maps.google.com/maps?q=37.747796,-122.236971&amp;hl=en&amp;ie=UTF8&amp;view=map&amp;ftt=289&amp;geocode=FVv5PwIdItG2-A&amp;split=0&amp;sll=37.747030,-122.236676&amp;sspn=0.001632,0.000641&amp;hq=&amp;hnear=Veterans+Ct,+Alameda,+California+94502&amp;t=m&amp;layer=c&amp;cbll=37.747652,-122.236869&amp;cbp=13,304.31,,0,5&amp;source=embed&amp;ll=37.747796,-122.236977&amp;spn=0.000017,0.01502&amp;z=16&amp;panoid=axdp3eQyOuv6JwsNs_t4rw&amp;output=svembed"></iframe>
                <br /><small><a href="http://maps.google.com/maps?q=37.747796,-122.236971&amp;hl=en&amp;ie=UTF8&amp;view=map&amp;ftt=289&amp;geocode=FVv5PwIdItG2-A&amp;split=0&amp;sll=37.747030,-122.236676&amp;sspn=0.001632,0.000641&amp;hq=&amp;hnear=Veterans+Ct,+Alameda,+California+94502&amp;t=m&amp;layer=c&amp;cbll=37.747652,-122.236869&amp;cbp=13,304.31,,0,5&amp;source=embed&amp;ll=37.747796,-122.236977&amp;spn=0.000017,0.01502&amp;z=16&amp;panoid=axdp3eQyOuv6JwsNs_t4rw" target="_blank" style="color:#0000FF;text-align:left">
                View Larger Map and/or Get Directions</a></small>
                </div>
				<div class="col_12">
						<h1>Brunch</h1>  is at La Penca Azul on Bay Farm (formerly La Pinata) 891 B Island, Alameda, 510-814-0560.
						<iframe width="100%" height="394" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" 
                src="http://maps.google.com/maps?f=d&amp;source=s_d&amp;saddr=37.747796,-122.236971&amp;daddr=891+B+Island,+Alameda&amp;geocode=FVT8PwId1c-2-A%3BFVbUPwIdkMK2-Cl3WxLKPYSPgDGEjw7K0f4Qaw&amp;aq=&amp;sll=37.747804,-122.236985&amp;sspn=0.008704,0.018861&amp;hl=en&amp;mra=ls&amp;ie=UTF8&amp;t=m&amp;ll=37.742655,-122.238135&amp;spn=0.013371,0.029998&amp;z=15&amp;output=embed"></iframe><br /><small><a href="http://maps.google.com/maps?f=d&amp;source=embed&amp;saddr=37.747796,-122.236971&amp;daddr=891+B+Island,+Alameda&amp;geocode=FVT8PwId1c-2-A%3BFVbUPwIdkMK2-Cl3WxLKPYSPgDGEjw7K0f4Qaw&amp;aq=&amp;sll=37.747804,-122.236985&amp;sspn=0.008704,0.018861&amp;hl=en&amp;mra=ls&amp;ie=UTF8&amp;t=m&amp;ll=37.742655,-122.238135&amp;spn=0.013371,0.029998&amp;z=15" target="_blank" style="color:#0000FF;text-align:left">View Larger Map and/or Get Directions</a></small>
                </div>
                <div class="col_12">
                <h1>4 Mile Run Course</h1>
                    <iframe width="100%" height="800" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" 
                    src="http://www.mapmyrun.com/routes/fullscreen/300979095/#center"></iframe>
                    <br /><small><a href="http://www.mapmyrun.com/routes/fullscreen/300979095/#center" target="_blank" style="color:#0000FF;text-align:left">
                    More Details</a></small>
                </div>

                <div class="col_12">
                <h1>5.9 Mile Run Course</h1>
                    <iframe width="100%" height="800" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" 
                    src="http://www.mapmyrun.com/routes/fullscreen/300980717/#center"></iframe>
                    <br /><small><a href="http://www.mapmyrun.com/routes/fullscreen/300980717/#center" target="_blank" style="color:#0000FF;text-align:left">
                    More Details</a></small>
                </div>
            </div>
           


            <div id="tabr4" class="tab-content">
               <h6 >Emeryville Marina<br />3310 Powell Street, Emeryville</h6>
                             <div class="col_12 ">
				     <h1>Directions</h1>
                    <div class="col_6">
                    	<h5> I-80 Eastbound</h5>
						<ol class="left">
							<li>Take the Powell Street exit</li>
							<li>Turn left and go under the freeway</li>
							<li>Go straight through the light and follow Powell Street all the way to the end</li>
							<li>Parking will be on your left</li>
						</ol>
					</div>
                    <div class="col_6">
                    	<h5> I-80 Westbound</h5>
						<ol class="left">
							<li>Take the Powell Street exit</li>
							<li>Veer left on to Frontage Road to Powell Street</li>
							<li>Turn right onto Powell Street</li>
                            <li>Follow Powell Street all the way to the end</li>
                            <li>Parking will be on your left</li>
						</ol>
					</div>
				</div>
				<p>Meet at the pier near the turn around
				</p>
				<div class="col_12">
						<h1>Map</h1>
				        <iframe width="100%" height="394" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/maps?ie=UTF8&amp;layer=c&amp;sll=37.841498,-122.313883&amp;cbp=13,27.1,,0,10.48&amp;cbll=37.841508,-122.313898&amp;q=3310+Powell+Street,+Emeryville&amp;hq=&amp;hnear=3310+Powell+St,+Emeryville,+California+94608&amp;ll=37.841498,-122.313883&amp;spn=0.001459,0.00327&amp;t=m&amp;z=14&amp;panoid=9YfusmqhEDyWdbQAddXawQ&amp;source=embed&amp;output=svembed"></iframe><br /><small><a href="https://maps.google.com/maps?ie=UTF8&amp;layer=c&amp;sll=37.841498,-122.313883&amp;cbp=13,27.1,,0,10.48&amp;cbll=37.841508,-122.313898&amp;q=3310+Powell+Street,+Emeryville&amp;hq=&amp;hnear=3310+Powell+St,+Emeryville,+California+94608&amp;ll=37.841498,-122.313883&amp;spn=0.001459,0.00327&amp;t=m&amp;z=14&amp;panoid=9YfusmqhEDyWdbQAddXawQ&amp;source=embed" target="_blank" style="color:#0000FF;text-align:left">View Larger Map</a></small>
                </div>
				<div class="col_12">
						<h1>Brunch</h1>  is at Doyle Street Cafe, 5515 Doyle Street, Emeryville - Phone: 510 547-3552.
						<br />Park for free in the lot across the street from the restaurant, or along Doyle and 55th Streets.
                    <iframe width="100%" height="394" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/maps?f=d&amp;source=s_d&amp;saddr=3310+Powell+St,+Emeryville,+CA&amp;daddr=5515+Doyle+Street,+Emeryville&amp;hl=en&amp;geocode=FTBZQQIdXa21-Cllj0rNrH-FgDF20aE-rFN8og%3BFcRcQQId7Qu2-ClJMnXEaX6FgDH15qtzwdJLXg&amp;aq=0&amp;oq=3310+Powel+St,+Emery&amp;sll=37.839089,-122.29341&amp;sspn=0.011608,0.026157&amp;gl=us&amp;mra=ls&amp;ie=UTF8&amp;ll=37.839089,-122.29341&amp;spn=0.002773,0.024496&amp;t=m&amp;output=embed"></iframe><br /><small><a href="https://maps.google.com/maps?f=d&amp;source=embed&amp;saddr=3310+Powell+St,+Emeryville,+CA&amp;daddr=5515+Doyle+Street,+Emeryville&amp;hl=en&amp;geocode=FTBZQQIdXa21-Cllj0rNrH-FgDF20aE-rFN8og%3BFcRcQQId7Qu2-ClJMnXEaX6FgDH15qtzwdJLXg&amp;aq=0&amp;oq=3310+Powel+St,+Emery&amp;sll=37.839089,-122.29341&amp;sspn=0.011608,0.026157&amp;gl=us&amp;mra=ls&amp;ie=UTF8&amp;ll=37.839089,-122.29341&amp;spn=0.002773,0.024496&amp;t=m" target="_blank" style="color:#0000FF;text-align:left">View Larger Map</a></small>                
                </div>
                <div class="col_12">
                <h1>2.8, 4, and 6.7 Mile Run Course</h1>
                    <iframe width="100%" height="800" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" 
                    src="http://www.mapmyrun.com/routes/fullscreen/300984615/#center"></iframe>
                    <br /><small><a href="http://www.mapmyrun.com/routes/fullscreen/300984615/#center" target="_blank" style="color:#0000FF;text-align:left">
                    More Details</a></small>
                </div>

            </div>

            <div id="tabr5" class="tab-content">
               <h6 >Strawberry Canyon/Berkeley<br />7 Gauss Way, Berkeley	</h6>
               <div class="col_12 ">
				     <h1>Directions</h1>
                    <div class="col_6">
                    	<h5> From Grizzly Peak Boulevard (running above Berkeley along the East Bay hills)</h5>
						<ol class="left">
							<li>Turn west (downhill) on Centennial Drive at the 4-way stop sign</li>
							<li>Proceed about 100 yards, then turn left on Gauss Way into the U.C. Space Science building complex</li>
							<li>Access road through the first parking lot in front of the Space Science Building to the second parking lot, behind the building</li>
						</ol>
					</div>
					<div class="col_6">
                    	<h5> From University and Shattuck Avenues in downtown Berkeley</h5>
						<ol class="left">
							<li>Take Shattuck north 2 blocks to Hearst</li>
							<li>Turn right and proceed uphill on Hearst past the U.C. campus</li>
							<li>Turn right at the stoplight onto Gayley Road</li>
							<li>Turn left (uphill) on Rimway (aka Stadium Rim Way) at the four-way stop sign near the soccer field</li>
							<li>Follow signs toward the U.C. Botanical Garden and the Lawrence Hall of Science</li>
							<li>Above Memorial Stadium, turn left again (uphill) on Centennial Drive, and continue up the canyon past the tennis courts, the Botanical Garden, and the Lawrence Hall of Science</li>
							<li>Near the top of the hill, turn right on Gauss Way into the Space Science Building complex and proceed to the second parking lot. Total distance from Gayley Road to Gauss Way is 1.8 miles</li>
						</ol>
					</div>
				</div>
				<div class="col_12">
						<h1>Map</h1>
<iframe width="100%" height="394" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="http://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=Gauss+Way,+berkeley&amp;aq=&amp;sll=37.838513,-122.290106&amp;sspn=0.012337,0.027788&amp;gl=us&amp;ie=UTF8&amp;hq=&amp;hnear=Gauss+Way,+Berkeley,+Alameda,+California+94705&amp;t=m&amp;ll=37.877936,-122.24453&amp;spn=0.010636,0.029998&amp;z=15&amp;iwloc=A&amp;output=embed"></iframe><br /><small><a href="http://maps.google.com/maps?f=q&amp;source=embed&amp;hl=en&amp;geocode=&amp;q=Gauss+Way,+berkeley&amp;aq=&amp;sll=37.838513,-122.290106&amp;sspn=0.012337,0.027788&amp;gl=us&amp;ie=UTF8&amp;hq=&amp;hnear=Gauss+Way,+Berkeley,+Alameda,+California+94705&amp;t=m&amp;ll=37.877936,-122.24453&amp;spn=0.010636,0.029998&amp;z=15&amp;iwloc=A" target="_blank" style="color:#0000FF;text-align:left">View Larger Map and/or Get Directions</a></small> 
               </div>
				<div class="col_12">
						<h1>Brunch</h1>  is at Bacheeso's, 2650 Telegraph Avenue, Berkeley, CA 94704.
						<br />Park in the Restaurant Parking lot.
<iframe width="100%" height="394" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/maps?f=d&amp;source=s_d&amp;saddr=7+Gauss+Way,+Berkeley&amp;daddr=2650+Telegraph+Avenue,+Berkeley,+CA+94704&amp;hl=en&amp;geocode=FeIBQgIdtbO2-Ckbz6qgP3yFgDFsCBqVc-awJg%3BFcW4QQIdp3i2-CkFbCGHLHyFgDHcxhIJ8BXxwg&amp;aq=&amp;sll=37.880985,-122.255387&amp;sspn=0.024625,0.052314&amp;gl=us&amp;mra=ls&amp;ie=UTF8&amp;ll=37.880985,-122.255387&amp;spn=0.020471,0.02035&amp;t=m&amp;output=embed"></iframe><br /><small><a href="https://maps.google.com/maps?f=d&amp;source=embed&amp;saddr=7+Gauss+Way,+Berkeley&amp;daddr=2650+Telegraph+Avenue,+Berkeley,+CA+94704&amp;hl=en&amp;geocode=FeIBQgIdtbO2-Ckbz6qgP3yFgDFsCBqVc-awJg%3BFcW4QQIdp3i2-CkFbCGHLHyFgDHcxhIJ8BXxwg&amp;aq=&amp;sll=37.880985,-122.255387&amp;sspn=0.024625,0.052314&amp;gl=us&amp;mra=ls&amp;ie=UTF8&amp;ll=37.880985,-122.255387&amp;spn=0.020471,0.02035&amp;t=m" target="_blank" style="color:#0000FF;text-align:left">View Larger Map and/or Get Directions</a></small>        
                </div>
            </div>

            <div id="tabr6" class="tab-content">
               <h6 >San Leandro Marina<br />Monarch Bay Drive, San Leandro</h6>
               <div class="col_12 ">
				     <h1>Directions</h1>
                    <div class="col_12">
                    	<h5>I-880</h5>
						<ol class="left">
							<li>Take I-880 to Marina Blvd exit in San Leandro</li>
							<li>Head west on Marina Blvd. toward San Francisco Bay</li>
							<li>Street curves south and becomes Monarch Bay Dr.</li>
							<li>Continue south one-quarter mile past Fairway Dr. intersection</li>
						</ol>
					</div>
				</div>
				<p>Meet in the parking lot at the south end of Marina Park</p>
				<div class="col_12">
						<h1>Map</h1>
<iframe width="100%" height="394" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="http://maps.google.com/maps?f=d&amp;source=embed&amp;saddr=&amp;daddr=37.692071,-122.184491&amp;hl=en&amp;geocode=&amp;aq=0&amp;oq=1508+Walnut+Street&amp;sll=37.691956,-122.184435&amp;sspn=0.001545,0.003473&amp;gl=us&amp;mra=mift&amp;mrsp=1&amp;sz=19&amp;ie=UTF8&amp;t=m&amp;layer=c&amp;cbll=37.691988,-122.184427&amp;cbp=13,191.19,,0,5&amp;panoid=4iqTdNsbtfA4R8h3AORAjw&amp;z=18&amp;output=svembed"></iframe><br /><small><a href="http://maps.google.com/maps?f=d&amp;source=embed&amp;saddr=&amp;daddr=37.692071,-122.184491&amp;hl=en&amp;geocode=&amp;aq=0&amp;oq=1508+Walnut+Street&amp;sll=37.691956,-122.184435&amp;sspn=0.001545,0.003473&amp;gl=us&amp;mra=mift&amp;mrsp=1&amp;sz=19&amp;ie=UTF8&amp;t=m&amp;layer=c&amp;cbll=37.691988,-122.184427&amp;cbp=13,191.19,,0,5&amp;panoid=4iqTdNsbtfA4R8h3AORAjw&amp;z=18" target="_blank" style="color:#0000FF;text-align:left">View Larger Map and/or Get Directions</a></small>
                </div>
				<div class="col_12">
						<h1>Brunch</h1> is at La Pinata, 2699 Merced Ave. at the corner of Fairway Drive, San Leandro - Phone: 510 352-8901.
<iframe width="100%" height="394" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="http://maps.google.com/maps?f=d&amp;source=s_d&amp;saddr=Monarch+Bay+Dr&amp;daddr=2699+Merced+Ave,+san+leandro&amp;hl=en&amp;geocode=FbAiPwIdDZ23-A%3BFW1QPwIdPNy3-Ck52iIu-o-PgDHqf76imMTSYQ&amp;aq=&amp;sll=37.69208,-122.184435&amp;sspn=0.012361,0.027788&amp;gl=us&amp;mra=ls&amp;ie=UTF8&amp;t=m&amp;ll=37.698423,-122.173719&amp;spn=0.021325,0.059996&amp;z=14&amp;output=embed"></iframe><br /><small><a href="http://maps.google.com/maps?f=d&amp;source=embed&amp;saddr=Monarch+Bay+Dr&amp;daddr=2699+Merced+Ave,+san+leandro&amp;hl=en&amp;geocode=FbAiPwIdDZ23-A%3BFW1QPwIdPNy3-Ck52iIu-o-PgDHqf76imMTSYQ&amp;aq=&amp;sll=37.69208,-122.184435&amp;sspn=0.012361,0.027788&amp;gl=us&amp;mra=ls&amp;ie=UTF8&amp;t=m&amp;ll=37.698423,-122.173719&amp;spn=0.021325,0.059996&amp;z=14" target="_blank" style="color:#0000FF;text-align:left">View Larger Map and/or Get Directions</a></small>        

                </div>
                <div class="col_12">
                <h1>4 and 6.9 Mile Run Course</h1>
             <iframe width="100%" height="800" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" 
    src="http://www.mapmyrun.com/routes/fullscreen/301717281/"></iframe>
    <br /><small><a href="http://www.mapmyrun.com/routes/fullscreen/301717281/" target="_blank" style="color:#0000FF;text-align:left">
    More Details</a></small>        </div>
               </div>
            </div>



         </div> <!-- END OF OUTSIDE COL -->
    </div> <!--END OF GRID -->
</div> <!-- END OF CALL OUT -->

<!-- SAN LEANDRO PLACEHOLDER MAP
<div class="col_12">
<h1>4 and 6.9 Mile Run Course</h1>
    <iframe width="100%" height="800" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" 
    src="http://www.mapmyrun.com/routes/fullscreen/301717281/"></iframe>
    <br /><small><a href="http://www.mapmyrun.com/routes/fullscreen/301717281/" target="_blank" style="color:#0000FF;text-align:left">
    More Details</a></small>
</div> -->


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



















