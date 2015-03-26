<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="EBFRW_Web.index" %>

<!DOCTYPE html>
<html><head>
<title>EBFRW - East Bay Front Runners and Walkers</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<meta name="description" content="" />
<!-- STYLES -->
<link rel="stylesheet" type="text/css" href="css/kickstart.css" media="all" />
<link rel="stylesheet" type="text/css" href="style.css" media="all" />
<link rel="stylesheet" type="text/css" href="to_top_styles.css" media="all" />
<!--<link rel="stylesheet" type="text/css" href="css/contact-form_1.css" media="all" />-->

<!-- GOOGLE FONTS -->
<link href='http://fonts.googleapis.com/css?family=Audiowide' rel='stylesheet' type='text/css'/>
<link href='http://fonts.googleapis.com/css?family=Stalinist+One' rel='stylesheet' type='text/css'/>
<link href='http://fonts.googleapis.com/css?family=Shojumaru' rel='stylesheet' type='text/css'/>

<!-- SCRIPTS -->
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="js/kickstart.js"></script>

</head>
<body>

<!-- START: LOGO, AND ICONS (MENU) -->
<div class="callout clearfix">
	<div class="grid">
		<div class="col_12">
			<img src="img/ebfrw_logo.png"/>
			<h5 id="ebfrwheader">
				...Come run/walk with us<br />and have fun...
			</h5>
		</div>
		<div class="col_2">
			<a class="white" href="calendar.aspx"><i class="icon-calendar icon-3x fade"></i><br />
				Saturday runs, races, and social events
			</i></a>
		</div>
		<div class="col_2">
			<a class="white" href="http://www.eastbayfrontrunners.org/blog"><i class="icon-comments-alt icon-3x fade"></i><br />
				Our blog and News Letter
			</i></a>
		</div>
		<div class="col_2">
			<a class="white" href="PrideRun.aspx"><i class="icon-flag icon-3x fade"></i><br />
				Pride Run
			</i></a>
		</div>
		<div class="col_2">
			<a class="white" href="Membership.aspx"><i class="icon-shopping-cart icon-3x fade"></i><br />
				Membership
			</i></a>
		</div>
		<div class="col_2">
            <a class="white" href="MembersOnly.aspx">
			<i class="icon-group icon-3x fade"></i><br />
				Members Only
			</i></a>
		</div>
		<div class="col_2">
         <a class="white" href="pictures.aspx">
			<i class="icon-picture icon-3x fade"></i><br />
				Pictures<br /></a>
		</div>
       <div class="col_2">
            <a class="white" href="ContactUs.aspx">
			    <i class=" icon-envelope icon-3x fade"  ></i><br />
				    Contact Us
            </a>
		</div> 
        <form id="master" runat="server" style="color:White;">
        <div class="col_2">
              <asp:LoginView ID="LoginView" runat="server" EnableViewState="false">
                    <AnonymousTemplate>
                        <a href="~/Account/Login.aspx" ID="HeadLoginStatus" runat="server"  style="text-decoration: none;color:White;">
                            <i class="white icon-signin icon-3x fade"></i><br />
                            Log In
                         </a>
                    </AnonymousTemplate>
                    <LoggedInTemplate>
                        <asp:LoginStatus ID="LoginStatus2" runat="server" CssClass="white icon-signout icon-3x fade"  EnableTheming="true"  LogoutAction="Redirect" style="text-decoration: none;" LogoutText="" LogoutPageUrl="~/Default.aspx" />
                        <asp:LoginStatus ID="HeadLoginStatus" runat="server" class="white" EnableTheming="true"  LogoutAction="Redirect" style="text-decoration: none;" LogoutText="<br />Log Out" LogoutPageUrl="~/Default.aspx" />
                     </LoggedInTemplate> 
                     <RoleGroups>
                        <asp:RoleGroup Roles="admin">
                            <ContentTemplate>
                                <asp:LoginStatus  ID="LoginStatus1" CssClass="white icon-signout icon-3x fade" runat="server" LogoutText="" LogoutAction="Redirect"  LogoutPageUrl="~/Default.aspx"/>
                                <asp:LoginStatus  ID="HeadLoginStatus" CssClass="white" runat="server" LogoutAction="Redirect" LogoutText="<br />Log Out" LogoutPageUrl="~/Default.aspx"/>
                                <asp:LinkButton CssClass="white" ID="adminToolLinkButton" Text="</br>Admin Tool" runat="server" OnCommand="onAdminToolsSelected"></asp:LinkButton>
                            </ContentTemplate>
                        </asp:RoleGroup>
                     </RoleGroups>
                </asp:LoginView>
                <br /><asp:LinkButton ID="LinkButton2" Text="Admin Tools" runat="server" OnCommand="onAdminToolsSelected" Visible="false"></asp:LinkButton>
        </div>
        </form>
	</div> <!-- END GRID -->
</div> <!-- end of callout -->
<!-- START: LOGO, AND ICONS (MENU) -->

<div class="grid"><!-- START BODY GRID-->

<!-- START: 2 COLUMNS 8 X 4 -->
<div class="col_12">

<!-- START: FIRST LEFT COLUMN -->
<div class="col_8">
	<div id="slideShowDiv" class="col_12">
		<!-- Slideshow-->
		<ul class="slideshow">
		<!--<li>
            <div class="callout calloutext1 clearfix">
            <div class="grid">
                <h1  id="header" style="color:purple">2013 <br />
                EBFRW Pride Run</h1>
                <h1 id="header" style="color:Orange">Oct, 12 2013</h1>
			    <button class="pink large">Read More</button>
            </div>
            </div>
        </li>-->
        <li><img src="http://eastbayfrontrunners.org/img/EBFRW_2014_05_17.png" width="550" height="150" /></li>
		<li><img src="img/finisher_ribbons.jpg" width="550" /></li>
        <li><img src="http://eastbayfrontrunners.org/img/priderun/2012/DSC_4991.JPG" width="550" height="150" /></li>
        <li><img src="http://eastbayfrontrunners.org/img/priderun/2012/DSC_5015.JPG" width="550" height="150" /></li>
        <li><img src="http://eastbayfrontrunners.org/img/priderun/2012/DSC_5039.JPG" width="550" height="150" /></li>
		</ul>
        


	</div>
	<hr class="alt1" />
	<div class="col_12">
		<h4>About Us</h4>
		<p><i class="icon-bullhorn icon-4x align-left">&nbsp;</i><!--<img class="align-left caption" title="" src="http://eastbayfrontrunners.org/img/EBFRW2011ALarge.jpg" width="50" height="50"/>-->
		East Bay Front Runners is a group of lesbians, gay men, bisexuals, transgenders and friends who get together to run and walk in scenic locations on the east side of San Francisco Bay every Saturday morning at 9:00.</p>
		<p>We follow our exercise with brunch at one of several great local restaurants. Runners generally complete 3-7 miles and walkers complete 2-4 miles.</p>
		<p>While the Saturday morning run/walk is our club’s staple, we also enjoy pot lucks, movie nights, museum tours, ballgames, wine tastings, and occasional weekend getaways.</p>
		<p>We welcome people of all athletic abilities, from casual walker to competitive runner, and everyone in between. We take pride in being friendly and inviting, and we encourage you to come out and see for yourself.</p>
		<p>Our running and walking events are non-competitive, self-paced, range from three to seven miles, and last 45 minutes to one hour. All paths and trails are easily accessible to runners and walkers alike.</p>
	</div>
	<hr class="alt1" />
	<div class="col_12">
		<h4>Membership</h4>
		<p><i class="icon-credit-card icon-4x align-left">&nbsp;</i>Membership in East Bay Front Runners
         and Walkers is open to everyone. EBFRW members have access to our Members Only Yahoo Group, members directory,
          and discounts at local partner businesses.</p>
		<div class="col-12 right">
			<a class="button orange align-right" href="Membership.aspx"><i class="icon-ok"></i>  Read More</a>
		</div>
	</div>
	<hr class="alt1" />
	<div class="col_12">
		<h4>Front Runner's History</h4>
		<p><i class="icon-time icon-4x align-left">&nbsp;</i>The Front Runner phenomenon started right here in our own back yard, when a small group of gay friends gathered for a run near Golden Gate Park's south windmill in January 1974. What was to become San Francisco Frontrunners was born.</p>
		<p>In 1980, Front Runners New York was launched, adopting the Front Runner name only after receiving permission from SFFR. More clubs formed thereafter in rapid succession.</p>
		<p>Today there are about 100 Front Runner clubs around the world representing the diversity of the LGBT community.</p>
	</div>
</div>
<!-- END: FIRST LEFT COLUMN -->

<!-- START: RIGHT COLUMN -->
<div class="col_4">
	<div class="col_12 addborder center">
    
        <h4>&nbsp;<i class="icon-info-sign icon-2x">&nbsp;</i></h4>
		<h4>Saturday Run</h4>
		<p class="center"><h2 style="font-family:'Shojumaru', cursive;font-size:40px;color:purple;">
            <asp:Label ID="nextRun" runat="server" Text=""></asp:Label></h2></p>
        <asp:HyperLink ID="nextRunLink" runat="server" Text="Test"><button class="orange"><i class="icon-leaf"></i>&nbsp;Directions</button></asp:HyperLink>
        <!--
        <p>This weekend is our Pride Run.</p>
        <p>We will <span style="color:red;font-weight:bold;">NOT</span> be meeting for our regular weekly run.</p>
        <p>More information (location/time) about our pride run can be found <a href="PrideRun.aspx">here</a></p>
        -->
	</div>
	<hr class="alt1" />
    <!--
    <div class="col_12 addborder center">
    	<p class="center">
            <img src="img/flyer.jpg" />
        </p>
        <a href="PrideRun.aspx">
            <button class="pink"><i class="icon-flag">&nbsp;Details</i></button>
        </a>
	</div>
	<hr class="alt1" />
    -->
	<div class="col_12 addborder">
		<h4 class="center">News&nbsp;<i class="icon-rss icon-2x"></i></h4>
<script language="JavaScript" src="http://www.feedroll.com/rssviewer/feed2js.php?src=http%3A%2F%2Feastbayfrontrunners.org%2Fblog%2F%3Ffeed%3Drss&num=5&desc=300&tz=3&utf=y"  charset="UTF-8" type="text/javascript"></script>

<noscript>
<a href="http://www.feedroll.com/rssviewer/feed2js.php?src=http%3A%2F%2Feastbayfrontrunners.org%2Fblog%2F%3Ffeed%3Drss&num=5&desc=100&tz=3&utf=y&html=y">View RSS feed</a>
</noscript>

	</div>
</div>
<!-- END: RIGHT COLUMN -->

</div>
<!-- START: 2 COLUMNS 8 X 4 -->

	<hr class="alt1" />
	<div class="col_4">
		<h4>Contact Us</h4>
		<a href="ContactUs.aspx"><button class="medium green"><i class="icon-envelope-alt icon-2x"></i></button></a>
    </div>
	<div class="col_4">
		<h4>Social Media</h4>
		<a href="https://www.facebook.com/EBFRW" target="_blank"><i class="icon-facebook-sign icon-4x"></i></a>
	</div>
    <div class="col_4">
        <h4>P.O. Box 71722 <br /> Oakland, CA  94612</h4>
    </div>

<hr class="alt1" />

<h4 class="center">Mission and Goal</h4>
	<blockquote id="blockquotenoborder" class="small center">
		Our mission is to promote the sports of running, walking and related athletic events for lesbians, gays, bisexuals, transgenders and their supporters.</br>
		Our goal is to have fun, promote healthy activity and to create community
	</blockquote>

</div><!-- END GRID-->

<!-- ===================================== START FOOTER ===================================== -->
<div class="clear"></div>
<div id="footer">@ Copyright EBFRW 2014 All Rights Reserved.</div>

<a href="#" class="go-top">Go Top</a>

<!-- JavaScript -->
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

        <script type="text/javascript">
            $(document).ready(function () {

                $("#login").click(function () {
                    $("#inputs").toggle("slow");

                });


                $(".signin").click(function (e) {
                    e.preventDefault();
                    $("fieldset#signin_menu").toggle();
                    $(".signin").toggleClass("menu-open");
                });

                $("fieldset#signin_menu").mouseup(function () {
                    return false
                });
                $(document).mouseup(function (e) {
                    if ($(e.target).parent("a.signin").length == 0) {
                        $(".signin").removeClass("menu-open");
                        $("fieldset#signin_menu").hide();
                    }
                });



            });

            function closeForm() {
                $("#messageSent").show("slow");
                setTimeout('$("#messageSent").hide();$("#contactForm").slideUp("slow")', 2000);
            }
        </script>

</body>
</html>
