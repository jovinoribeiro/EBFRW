<%@ Page Title="Log In" Language="C#"  AutoEventWireup="true"
    CodeBehind="Login.aspx.cs" Inherits="EBFRW_Web.Account.Login" %>

<!DOCTYPE html>
<html><head>
<title>EBFRW - Log In</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<meta name="description" content="" />
<!-- STYLES -->
<link rel="stylesheet" type="text/css" href="../css/kickstart.css" media="all" />
<link rel="stylesheet" type="text/css" href="../style.css" media="all" />
<link rel="stylesheet" type="text/css" href="../to_top_styles.css" media="all" />
<link rel="stylesheet" type="text/css" href="../tabsty-membership.css" media="screen" />

<!-- GOOGLE FONTS -->
<link href='http://fonts.googleapis.com/css?family=Audiowide' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Stalinist+One' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Shojumaru' rel='stylesheet' type='text/css'>


<!-- SCRIPTS -->
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="../js/kickstart.js"></script>

</head>
<body>

   <form id="Form1" runat="server">

    
<!-- START : MENU -->
<ul class="menu">
<li><a href="../Default.aspx"><i class="icon-home"></i>&nbsp;Home</a></li>
<li><a href="../calendar.aspx"><i class="icon-calendar"></i>&nbsp;Calendar</a></li>
<li><a href="../WeeklyRun.aspx"><i class="icon-heart"></i>&nbsp;Weekly Run</a></li>
<li><a href="http://www.eastbayfrontrunners.org/blog"><i class="icon-comments-alt"></i>&nbsp;Blog</a></li>
<li><a href="../PrideRun.aspx"><i class="icon-flag"></i>&nbsp;Pride Run</a></li>
<li><a href="../Membership.aspx"><i class="icon-shopping-cart"></i>&nbsp;Membership</a></li>
<li><a href="../pictures.aspx"><i class="icon-picture"></i>&nbsp;Pictures</a></li>
<li><a href="../MembersOnly.aspx"><i class="icon-group"></i>&nbsp;Members Only</a></li>
<li><a href="../ContactUs.aspx"><i class="icon-envelope"></i>&nbsp;Contact Us</a></li>
</ul>
<!-- END : MENU -->

<div class="clear"></div>

<!-- START: LOGO, AND ICONS (MENU) -->
<div class="callout clearfix">
	<div class="grid">
		<div class="col_12" />
			<img src="../img/ebfrw_logo.png"/>
			<h5 id="ebfrwheader">
				...You are about to enter a highly restricted area...
			</h5>
		</div>
	</div> <!-- END GRID -->
</div> <!-- end of callout -->
<div class="clear"></div>



<div class="callout calloutext1 clearfix">
	<div class="grid"  >
            <asp:Login ID="LoginUser" runat="server" EnableViewState="false" RenderOuterTable="false">
            <LayoutTemplate>
            <div class="col_3">
			<h4><i class="icon-cogs large icon-4x align-left" style="color:black;"></i></h4>
			</div>
			
            <div class="col_6 center">
				<div class="col_6 center">
                       <asp:Label ID="UserNameLabel" class="center" runat="server" AssociatedControlID="UserName">
                            <h5>USER NAME</h5>
                        </asp:Label>
                        <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" 
                             CssClass="failureNotification" ErrorMessage="User Name is required." ToolTip="User Name is required." 
                             ValidationGroup="LoginUserValidationGroup">*</asp:RequiredFieldValidator>
				</div>
				<div class="col_6 center">
                        <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password"><h5>PASSWORD</h5></asp:Label>
                        <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" 
                             CssClass="failureNotification" ErrorMessage="Password is required." ToolTip="Password is required." 
                             ValidationGroup="LoginUserValidationGroup">*</asp:RequiredFieldValidator>
  				</div>
                <div class="clear"></div>
				<div class="col_12">
							<asp:Button ID="Button1" CssClass="green large icon-signin"  runat="server" CommandName="Login" Text="Enter" 
                                ValidationGroup="LoginUserValidationGroup" />
			    </div>
                <div class="clear"></div>
                <!--<div class="col_12">
                        <asp:CheckBox ID="RememberMe" runat="server"/>
                        <asp:Label ID="RememberMeLabel" runat="server" AssociatedControlID="RememberMe" CssClass="inline">Keep me logged in</asp:Label>
                </div>-->
            </div>
			<div class="col_3"></div>

            <div class="col_12 center">
                 <span class="failureNotification" style="font-size:20px; color :red;">
                    <asp:Literal ID="FailureText" runat="server"></asp:Literal>
                </span> 
                <asp:ValidationSummary  CssClass="center" style="font-size:20px; color :red;"
                     ID="LoginUserValidationSummary" runat="server"  
                    ValidationGroup="LoginUserValidationGroup"/>
                       
            </div>

        </LayoutTemplate>
    </asp:Login>
    </form>
	</div>
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






















   