<!-- This application is built by Rajendra Arora, To know more visit here: http://about.me/rajendraarora16 -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.Statement"%>
    
<%
    if ((session.getAttribute("userEmail") == null) || (session.getAttribute("userEmail") == ""))
    {
%>  

<%
		response.sendRedirect("index.jsp");
	}
    else
    {	
    	String userEmail = (String)session.getAttribute("userEmail");
		String firstName = (String)session.getAttribute("firstName");
		String verify = (String)session.getAttribute("verify");
	
		if(verify.equals("notVerified"))
		{
			out.println("<h1 style='text-align:center;font-size: 17px;color: #0E98CD;'>Your account is not verified, Kindly verify by <a href='verifyByLogin' style='color:red;'>clicking</a> here.</h1>");
		}
		else{}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Sale market | Compare prices with top branded retailers.</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	<style type="text/css">
		img.wp-smiley,img.emoji{display:inline!important;border:none!important;box-shadow:none!important;height:1em!important;width:1em!important;margin:0 .07em!important;vertical-align:-.1em!important;background:none!important;padding:0!important}
	</style>
	<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
	<link rel='stylesheet' href='./styleCss/color-picker.min.css' type='text/css' media='all'/>
	<link rel='stylesheet' href='./styleCss/Mcc.0hHu3gsosg.css.pagespeed.cf.oDrwXy1h1m.css' type='text/css' media='all'/>
	<style id='rs-plugin-settings-inline-css' type='text/css'>
		.btn-slider{color:#fff;text-decoration:none}
		.btn-slider:hover{color:#fff;text-decoration:none}
		.btn-slider-2{color:#ff7302;text-decoration:none}
		.btn-slider-2:hover{color:#ffa902;text-decoration:none}
		.tp-caption a{color:#fff;text-shadow:none;-webkit-transition:all .2s ease-out;-moz-transition:all .2s ease-out;-o-transition:all .2s ease-out;-ms-transition:all .2s ease-out}
		.tp-caption a:hover{color:#ffa902}
		.tp-caption a{color:#fff;text-shadow:none;-webkit-transition:all .2s ease-out;-moz-transition:all .2s ease-out;-o-transition:all .2s ease-out;-ms-transition:all .2s ease-out}
		.tp-caption a:hover{color:#ffa902}
	</style>
	<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" />
	<link rel="stylesheet" href="./styleCss/textBoxSearch.css">
	<link rel='stylesheet' href='./styleCss/Mcc.jYBLpj4kwh.css.pagespeed.cf.YXpgdneZR6.css' type='text/css' media='all'/>
	<style id='main-inline-css' type='text/css'>
		a,.theme-clr,.sidebar-item.widget_nav_menu .nav-pills>li>a:hover,.sidebar-filters .selectable:hover,.sidebar-filters .selectable:focus,.opening-time .week-day.today dt,.table-theme tr.active td,.accordion-inner label.checked,.su-spoiler-style-fancy .su-spoiler-icon{color:#00becc}a:hover{color:#00abb8}.ui-widget-header,.btn.btn-primary:hover,#submitWPComment:hover,.btn.btn-primary:focus,#submitWPComment:focus,.btn.btn-primary:active,#submitWPComment:active,.btn.btn-primary.active,.active#submitWPComment,.btn.btn-primary.disabled,.disabled#submitWPComment,.btn.btn-primary[disabled],[disabled]#submitWPComment,.navbar #magic-line,.topmost-line .dropdown-menu a:hover,.tp-caption.big_theme,.tp-caption.btn_theme,.bg-for-icon,.sidebar-filters .selectable.selected .box,.widget_calendar caption,.pagination>ul>li.highlighted a{background-color:#00becc}.sidebar-filters .selectable.selected .box,.product-preview .thumbs .thumb.active img,.product-preview .thumbs .thumb img:hover,.pagination>ul>li>a:hover,.nav-tabs>.active>a,.nav-tabs>.active>a:hover,.nav-tabs>.active>a:focus{border-color:#00becc}.nav-pills.nav-stacked>li.active>a{border-left-color:#00becc}.nav-tabs-style-2>.active>a,.nav-tabs-style-2>.active>a:hover,.nav-tabs-style-2>.active>a:focus,.su-tabs-style-filled-tabs .su-tabs-nav .su-tabs-current{border-top-color:#00becc}.su-tabs-nav span.su-tabs-current{border-bottom-color:#00becc}.btn.btn-primary,#submitWPComment,.navbar .btn-navbar,div.woocommerce input[type="submit"],div.woocommerce button,div.woocommerce .button{-webkit-box-shadow:0 2px 0 #009ea9;-moz-box-shadow:0 2px 0 #009ea9;box-shadow:0 2px 0 #009ea9;text-shadow:0 -1px 0 rgba(0,0,0,.25);background-color:#00becc;background-image:-moz-linear-gradient(top,#00becc,#00becc);background-image:-webkit-gradient(linear,0 0,0 100%,from(#00becc),to(#00becc));background-image:-webkit-linear-gradient(top,#00becc,#00becc);background-image:-o-linear-gradient(top,#00becc,#00becc);background-image:linear-gradient(to bottom,#00becc,#00becc);background-repeat:repeat-x;filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#FF#00becc', endColorstr='#FF#00becc', GradientType=0);border-color:#00becc #00becc #007780;border-color:rgba(0,0,0,.1) rgba(0,0,0,.1) rgba(0,0,0,.25);*background-color: #00becc}.btn.btn-primary:hover,#submitWPComment:hover,.navbar .btn-navbar:hover,div.woocommerce input[type="submit"]:hover,div.woocommerce button:hover,div.woocommerce .button:hover{background-color:#00b5c2}.btn.btn-danger{-webkit-box-shadow:0 2px 0 #be3e4d;-moz-box-shadow:0 2px 0 #be3e4d;box-shadow:0 2px 0 #be3e4d;text-shadow:0 -1px 0 rgba(0,0,0,.25);background-color:#e54b5d;background-image:-moz-linear-gradient(top,#e54b5d,#e54b5d);background-image:-webkit-gradient(linear,0 0,0 100%,from(#e54b5d),to(#e54b5d));background-image:-webkit-linear-gradient(top,#e54b5d,#e54b5d);background-image:-o-linear-gradient(top,#e54b5d,#e54b5d);background-image:linear-gradient(to bottom,#e54b5d,#e54b5d);background-repeat:repeat-x;filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#FF#e54b5d', endColorstr='#FF#e54b5d', GradientType=0);border-color:#e54b5d #e54b5d #007780;border-color:rgba(0,0,0,.1) rgba(0,0,0,.1) rgba(0,0,0,.25);*background-color: #e54b5d}.btn.btn-danger:hover{background-color:#da4758}.tp-caption>a{color:#fff}
	</style>
	<style type="text/css">
		.recentcomments a{display:inline!important;padding:0!important;margin:0!important}
	</style>
	<script type="text/javascript">
		WebFontConfig={google:{families:['Open+Sans:400,700,400italic,700italic:latin,latin-ext,cyrillic','Pacifico::latin']}};(function(){var wf=document.createElement('script');wf.src=('https:'==document.location.protocol?'https':'http')+'://ajax.googleapis.com/ajax/libs/webfont/1/webfont.js';wf.type='text/javascript';wf.async='true';var s=document.getElementsByTagName('script')[0];s.parentNode.insertBefore(wf,s);})();
	</script>
	<script src="./js/qver==4.6.92.pagespeed.jc.E-D8jZI_Hp.js"></script>
	<script>eval(mod_pagespeed_OhMGz8ExPf);</script>
	<script>eval(mod_pagespeed_m6KLonEhEf);</script>
	<script>eval(mod_pagespeed_hTnCxWV8sF);</script>
	<script type='text/javascript' src='./js/jquery.themepunch.revolution.min.js'></script>
	<script type='text/javascript' src='./js/modernizr.custom.93593.js.pagespeed.jm.gS1yN4FLJ4.js'></script>
	<link rel="shortcut icon" href="./images/sale-market-logo.jpg">
	
	<link rel="stylesheet" href="./dropDown/styles.css">
   	<script src="./dropDown/script.js"></script>
</head>
<body class="home page page-id-109 page-template page-template-front-template page-template-front-template-php">	
	<div class="master-wrapper">
		<header id="header" role="banner">
			<div class="container">
				<!-- Enter you search textbox here.. -->
				<div id="yt-masthead-content" style="padding: 1px 144px 0px;width: 87%; float: right;">
					<form id="masthead-search" class="search-form consolidated-form" action="Search" method="post" onsubmit="if (document.getElementById('masthead-search-term').value == '') return false;" data-clicktracking="CGoQ7VA">
						
						<table>
							<tr>
								<td style="width:28%;">
									<table>
										<tr>
										<td>
											<a href="./home.jsp"><img src="./images/sale-market-logo.jpg" style="height: 40px;" alt="Web sale market" onmousedown="return false;"/></a>
										</td>
										<td style="padding: 27px 0px 0px 5px;">
											<span>Shop by <strong>retailers</strong>.</span>
										</td>
									</tr>
									</table>
								</td>
								<td style="width:60%;">
									<button class="yt-uix-button yt-uix-button-size-default yt-uix-button-default search-btn-component search-button" type="submit" onclick="if (document.getElementById('masthead-search-term').value == '') return false; document.getElementById('masthead-search').submit(); return false;;return true;" dir="ltr" tabindex="2" id="search-btn"><span class="yt-uix-button-content">Search</span></button>
									<div id="masthead-search-terms" class="masthead-search-terms-border" dir="ltr">
										<input id="masthead-search-term" autocomplete="off" autofocus="" onkeydown="if (!this.value&amp&amp (event.keyCode == 40 || event.keyCode == 32 || event.keyCode == 34)) {this.onkeydown = null; this.blur();}" class="search-term masthead-search-renderer-input yt-uix-form-input-bidi" name="query" value="" tabindex="1" placeholder="Search your products here.." title="Search" type="text">
									</div>
								</td>
								<td>
									<div style="width:19px;">&nbsp;</div>
								</td>
								<td>
									<!-- Sign in or sign up -->
									<div id='cssmenu'>
										<ul>
   											<li><a href='logout.jsp'>Logout</a></li>
										</ul>
									</div>								
								</td>
							</tr>
						</table>
					
					</form>
				</div>
			</div>
		</header>
		<div id="rev_slider_2_1_wrapper" class="rev_slider_wrapper fullwidthbanner-container" style="margin:0px auto;background-color:#E9E9E9;padding:0px;margin-top:0px;margin-bottom:0px;max-height:377px;">
		<!-- START REVOLUTION SLIDER 4.6.92 fullwidth mode -->
		<div id="rev_slider_2_1" class="rev_slider fullwidthabanner" style="display:none;max-height:377px;height:377px;">
			<ul>	<!-- SLIDE  -->
				<%
				try{
					Class.forName("com.mysql.jdbc.Driver");
					Connection con=DriverManager.getConnection("Your database connection with username and password");
					
					String sqlQuery="SELECT * FROM slide";
					PreparedStatement stmt = con.prepareStatement(sqlQuery);
					ResultSet rs = stmt.executeQuery();
					
					while(rs.next())
					{
						String linkSlide = rs.getString("link");
				%>
				<li data-transition="random" data-slotamount="7" data-masterspeed="300" data-saveperformance="off">
					<!-- MAIN IMAGE -->
					<img src="<%=linkSlide%>" alt="slide" data-bgposition="center center" data-bgfit="cover" data-bgrepeat="no-repeat" width="1400" height="377">
					<!-- LAYERS -->
				</li>				
				<%
					}
				}catch(Exception e){e.printStackTrace();}
				%>
			</ul>
			<div class="tp-bannertimer"></div>	
		</div>
		<style scoped>.tp-caption.big_theme,.big_theme{color:#fff;text-decoration:none;background-color:rgba(0,190,204,1);text-shadow:0 -1px 0 rgba(0,0,0,.25);font-size:42px;line-height:55px;background:#00becc;font-weight:700;border-radius:3px 3px 3px 3px;border-width:0px;border-color:rgba(0,0,0,0);border-style:none}.tp-caption.small_theme,.small_theme{color:#555;font-size:20px;line-height:26px;background:#fff;border-radius:3px 3px 3px 3px;border-width:0px;border-color:#555;border-style:none}.tp-caption.btn_theme,.btn_theme{font-size:15px;line-height:20px;font-weight:bold;color:#fff;text-decoration:none;padding:10px 20px;-webkit-box-shadow:#006d75 0px 2px 0px;box-shadow:#006d75 0px 2px 0px;text-shadow:rgba(0,0,0,.247059) 0px -1px 0px;background-image:linear-gradient(#00becc,#00becc);background-color:#00becc;background-repeat:repeat-x;border-radius:3px 3px 3px 3px;border-width:0px;border-color:#fff;border-style:none}</style>
		<script type="text/javascript">var setREVStartSize=function(){var tpopt=new Object();tpopt.startwidth=1400;tpopt.startheight=377;tpopt.container=jQuery('#rev_slider_2_1');tpopt.fullScreen="off";tpopt.forceFullWidth="on";tpopt.container.closest(".rev_slider_wrapper").css({height:tpopt.container.height()});tpopt.width=parseInt(tpopt.container.width(),0);tpopt.height=parseInt(tpopt.container.height(),0);tpopt.bw=tpopt.width/tpopt.startwidth;tpopt.bh=tpopt.height/tpopt.startheight;if(tpopt.bh>tpopt.bw)tpopt.bh=tpopt.bw;if(tpopt.bh<tpopt.bw)tpopt.bw=tpopt.bh;if(tpopt.bw<tpopt.bh)tpopt.bh=tpopt.bw;if(tpopt.bh>1){tpopt.bw=1;tpopt.bh=1}if(tpopt.bw>1){tpopt.bw=1;tpopt.bh=1}tpopt.height=Math.round(tpopt.startheight*(tpopt.width/tpopt.startwidth));if(tpopt.height>tpopt.startheight&&tpopt.autoHeight!="on")tpopt.height=tpopt.startheight;if(tpopt.fullScreen=="on"){tpopt.height=tpopt.bw*tpopt.startheight;var cow=tpopt.container.parent().width();var coh=jQuery(window).height();if(tpopt.fullScreenOffsetContainer!=undefined){try{var offcontainers=tpopt.fullScreenOffsetContainer.split(",");jQuery.each(offcontainers,function(e,t){coh=coh-jQuery(t).outerHeight(true);if(coh<tpopt.minFullScreenHeight)coh=tpopt.minFullScreenHeight})}catch(e){}}tpopt.container.parent().height(coh);tpopt.container.height(coh);tpopt.container.closest(".rev_slider_wrapper").height(coh);tpopt.container.closest(".forcefullwidth_wrapper_tp_banner").find(".tp-fullwidth-forcer").height(coh);tpopt.container.css({height:"100%"});tpopt.height=coh;}else{tpopt.container.height(tpopt.height);tpopt.container.closest(".rev_slider_wrapper").height(tpopt.height);tpopt.container.closest(".forcefullwidth_wrapper_tp_banner").find(".tp-fullwidth-forcer").height(tpopt.height);}};setREVStartSize();var tpj=jQuery;tpj.noConflict();var revapi2;tpj(document).ready(function(){if(tpj('#rev_slider_2_1').revolution==undefined){revslider_showDoubleJqueryError('#rev_slider_2_1');}else{revapi2=tpj('#rev_slider_2_1').show().revolution({dottedOverlay:"none",delay:9000,startwidth:1400,startheight:377,hideThumbs:200,thumbWidth:100,thumbHeight:50,thumbAmount:4,simplifyAll:"off",navigationType:"none",navigationArrows:"solo",navigationStyle:"round",touchenabled:"on",onHoverStop:"on",nextSlideOnWindowFocus:"off",swipe_threshold:0.7,swipe_min_touches:1,drag_block_vertical:false,keyboardNavigation:"off",navigationHAlign:"center",navigationVAlign:"bottom",navigationHOffset:0,navigationVOffset:60,soloArrowLeftHalign:"left",soloArrowLeftValign:"center",soloArrowLeftHOffset:20,soloArrowLeftVOffset:0,soloArrowRightHalign:"right",soloArrowRightValign:"center",soloArrowRightHOffset:20,soloArrowRightVOffset:0,shadow:2,fullWidth:"on",fullScreen:"off",spinner:"spinner0",stopLoop:"off",stopAfterLoops:-1,stopAtSlide:-1,shuffle:"off",autoHeight:"off",forceFullWidth:"on",hideThumbsOnMobile:"off",hideNavDelayOnMobile:1500,hideBulletsOnMobile:"off",hideArrowsOnMobile:"off",hideThumbsUnderResolution:0,hideSliderAtLimit:0,hideCaptionAtLimit:0,hideAllCaptionAtLilmit:0,startWithSlide:0});}});</script>
	</div><!-- END REVOLUTION SLIDER -->
	<div class="container">
		<div class="row">
			<div class="span12">
				<div class="push-up over-slider blocks-spacer">
					<div class="row">
						<div class="span4">
							<div id="featured_link_widget-1" class="blocks-spacer widget_featured_link_widget">	
								<a href="./showTagProducts?tag=Laptops" class="btn btn-block banner" style="color: #eeeeee; background: #666666;">
									<span class="title"><span class="light">best</span> Deal</span>
									<em>Get Laptops with good prices</em>
								</a>
							</div>
						</div>
						<div class="span4">
							<div id="featured_link_widget-2" class="blocks-spacer widget_featured_link_widget">	
								<a href="sale-bestdeal.rhcloud.com/showTagProducts?tag=Shoes" class="btn btn-block banner" style="color: #eeeeee; background: #666666;">
									<span class="title"><span class="light">best</span> Deal</span>
									<em>Up to 60% off on all shoes</em>
								</a>
							</div>
						</div>
						<div class="span4">
							<div id="featured_link_widget-3" class="blocks-spacer widget_featured_link_widget">	
								<a href="./showTagProducts?tag=Mobiles" class="btn btn-block banner" style="color: #eeeeee; background: #666666;">
									<span class="title"><span class="light">best</span> Deal</span>
									<em>get Mobiles with good features</em>
								</a>
							</div>
						</div>
					</div>
						
					</div>
				</div><!-- /span12 -->
			</div>
		</div>
	</div>
</div>
<div class="boxed-area blocks-spacer">
	<div class="container">
		<div class="clearfix"></div>
		<div class="row">
			<div class="span12">
				<div class="row">
					<div class="span12">
						<div class="main-titles lined">
							<h2 class="title"><span class="light">Best</span> Handbags items</h2>
						</div>	
					</div>
				</div>
				<div class="row popup-products blocks-spacer">
				<!-- Laptop -->
				<%
					try{
			        	Class.forName("com.mysql.jdbc.Driver");
			        	Connection con=DriverManager.getConnection("Your database connection with username and password");
			        				        	
			        	String sqlQuery = "SELECT * FROM EcommerceTable WHERE tag2=? ORDER BY views DESC, digitPrice ASC, popularity DESC LIMIT 8";
			        	
			        	PreparedStatement stmt = con.prepareStatement(sqlQuery);
			        	stmt.setString(1, "Handbags");
			        	ResultSet rs = stmt.executeQuery();
			        	
			        	while(rs.next())
			        	{
			        		String productName = rs.getString("productName");
			        		String buyLink = rs.getString("buyLink");
			        		String companyName = rs.getString("companyName");
			        		String price = rs.getString("price");
			        		String cashOnDelivery = rs.getString("cashOnDelivery");
			        		String imageURL = rs.getString("imageURL");
			        		int popularity = rs.getInt("popularity");
			        		String tag1 = rs.getString("tag1");
			        		String tag2 = rs.getString("tag2");
			        		String tag3 = rs.getString("tag3");
			        		int views = rs.getInt("views");
			        		String productQuery = rs.getString("productQuery");
				%>
				
					<!--  = Product =  -->
					<div class="span3">
						<div class="product">
							<div class="product-inner">
								<div class="product-img">
									<div class="picture">
									<!-- Here.. -->
									<div class="product-img featured">
										<a href="#"><img width="270" height="190" style="height: 220px;" src="<%=imageURL%>" class="attachment-shop_catalog wp-post-image" alt="featured-2"/></a>
									</div>	
										<div class="img-overlay">
											<a target="_blank" href="./reviews.jsp?productQuery=<%=productQuery%>" rel="nofollow" data-product_id="73" data-product_sku="" class="add_to_cart_button btn buy btn-danger product_type_simple">explore</a>	
										</div>
									</div>
								</div>	
								<div class="main-titles no-margin">
									<h4 class="title">
										<%=productName %>	
									</h4>
									<br />
									<h4 style="font-size: 15px; color: rgb(177, 39, 4) ! important;" class="title">
										Price: <span class="amount">&#8377; <%=price%></span>	
									</h4>
									<p class="desc">by <%=companyName%></p>
									<p class="desc"><%=cashOnDelivery%></p>
								</div>								
								<div class="center-align stars" style="color:#f2c14d;">
									<table>
										<tr style="float:left;">
											<td>
												<a href="showTagProducts?tag=<%=tag1%>" class="post-tag" title="" rel="tag"><%=tag1%></a>
											</td>
											<td>
												<a href="showTagProducts?tag=<%=tag2%>" class="post-tag" title="" rel="tag"><%=tag2%></a>
											</td>
											<td>
												<%
													if(!(tag3 == null || tag3 == ""))
													{
														//do nothing..
													}
													else{
														out.println("<a href='#' class='post-tag' title='' rel='tag'>"+tag3+"</a>");
													}
												%>
											</td>
										</tr>
										<tr style="float:left;">
											<td>
												<span style="color:black;">Popularity: </span>
												<%
													for(int i=0; i<popularity; i++)
													{
														out.println("<i class='fa fa-star'></i>");
													}
												%>
											</td>
										</tr>
										<tr>
											<td style="float:left;">
												<h6>
													Views: <span><%=views%></span>
												</h6>
											</td>
										</tr>
									</table>
								</div>
							</div>
						</div>
					</div> 
					<!-- END product -->
					
			<%
            		}
    			}
    				catch(Exception e){
        				e.printStackTrace();
    			}
			%>				
			
				</div>
				<div class="clearfix"></div>
				<h4 style="text-align:center;color:rgb(177, 39, 4);"><a href="showTagProducts?tag=Handbags">Load more Handbag items</a></h4>
				<br /><br />
				<!-- Laptops items -->
				<div class="row">
					<div class="span12">
						<div class="main-titles lined">
							<h2 class="title"><span class="light">Best</span> Laptops items</h2>
						</div>	
					</div>
				</div>
				<div class="row popup-products blocks-spacer">
				<!-- Laptop -->
				<%
					try{
			        	Class.forName("com.mysql.jdbc.Driver");
			        	Connection con=DriverManager.getConnection("Your database connection with username and password");
			        				        	
			        	String sqlQuery = "SELECT * FROM EcommerceTable WHERE tag2=? ORDER BY views DESC, digitPrice ASC, popularity DESC LIMIT 8";
			        	
			        	PreparedStatement stmt = con.prepareStatement(sqlQuery);
			        	stmt.setString(1, "Laptops");
			        	ResultSet rs = stmt.executeQuery();
			        	
			        	while(rs.next())
			        	{
			        		String productName = rs.getString("productName");
			        		String buyLink = rs.getString("buyLink");
			        		String companyName = rs.getString("companyName");
			        		String price = rs.getString("price");
			        		String cashOnDelivery = rs.getString("cashOnDelivery");
			        		String imageURL = rs.getString("imageURL");
			        		int popularity = rs.getInt("popularity");
			        		String tag1 = rs.getString("tag1");
			        		String tag2 = rs.getString("tag2");
			        		String tag3 = rs.getString("tag3");
			        		int views = rs.getInt("views");
			        		String productQuery = rs.getString("productQuery");
				%>
				
					<!--  = Product =  -->
					<div class="span3">
						<div class="product">
							<div class="product-inner">
								<div class="product-img">
									<div class="picture">
									<!-- Here.. -->
									<div class="product-img featured">
										<a href="#"><img width="270" height="190" style="height: 220px;" src="<%=imageURL%>" class="attachment-shop_catalog wp-post-image" alt="featured-2"/></a>
									</div>	
										<div class="img-overlay">
											<a target="_blank" href="./reviews.jsp?productQuery=<%=productQuery%>" rel="nofollow" data-product_id="73" data-product_sku="" class="add_to_cart_button btn buy btn-danger product_type_simple">explore</a>	
										</div>
									</div>
								</div>	
								<div class="main-titles no-margin">
									<h4 class="title">
										<%=productName %>	
									</h4>
									<br />
									<h4 style="font-size: 15px; color: rgb(177, 39, 4) ! important;" class="title">
										Price: <span class="amount">&#8377; <%=price%></span>	
									</h4>
									<p class="desc">by <%=companyName%></p>
									<p class="desc"><%=cashOnDelivery%></p>
								</div>								
								<div class="center-align stars" style="color:#f2c14d;">
									<table>
										<tr style="float:left;">
											<td>
												<a href="showTagProducts?tag=<%=tag1%>" class="post-tag" title="" rel="tag"><%=tag1%></a>
											</td>
											<td>
												<a href="showTagProducts?tag=<%=tag2%>" class="post-tag" title="" rel="tag"><%=tag2%></a>
											</td>
											<td>
												<%
													if(!(tag3 == null || tag3 == ""))
													{
														//do nothing..
													}
													else{
														out.println("<a href='#' class='post-tag' title='' rel='tag'>"+tag3+"</a>");
													}
												%>
											</td>
										</tr>
										<tr style="float:left;">
											<td>
												<span style="color:black;">Popularity: </span>
												<%
													for(int i=0; i<popularity; i++)
													{
														out.println("<i class='fa fa-star'></i>");
													}
												%>
											</td>
										</tr>
										<tr>
											<td style="float:left;">
												<h6>
													Views: <span><%=views%></span>
												</h6>
											</td>
										</tr>
									</table>
								</div>
							</div>
						</div>
					</div> 
					<!-- END product -->
					
			<%
            		}
    			}
    				catch(Exception e){
        				e.printStackTrace();
    			}
			%>				
			
				</div>
				<div class="clearfix"></div>
				<h4 style="text-align:center;color:rgb(177, 39, 4);"><a href="showTagProducts?tag=Laptops">Load more Laptops items</a></h4>
				<br /><br />
				<!-- Laptops items -->
				<div class="row">
					<div class="span12">
						<div class="main-titles lined">
							<h2 class="title"><span class="light">Best</span> Mobiles items</h2>
						</div>	
					</div>
				</div>
				<div class="row popup-products blocks-spacer">
				<!-- Laptop -->
				<%
					try{
			        	Class.forName("com.mysql.jdbc.Driver");
			        	Connection con=DriverManager.getConnection("Your database connection with username and password");
			        				        	
			        	String sqlQuery = "SELECT * FROM EcommerceTable WHERE tag1=? AND tag2=? LIMIT 8";
			        	
			        	PreparedStatement stmt = con.prepareStatement(sqlQuery);
			        	stmt.setString(1, "Snapdeal");
			        	stmt.setString(2, "Mobiles");
			        	ResultSet rs = stmt.executeQuery();
			        	
			        	while(rs.next())
			        	{
			        		String productName = rs.getString("productName");
			        		String buyLink = rs.getString("buyLink");
			        		String companyName = rs.getString("companyName");
			        		String price = rs.getString("price");
			        		String cashOnDelivery = rs.getString("cashOnDelivery");
			        		String imageURL = rs.getString("imageURL");
			        		int popularity = rs.getInt("popularity");
			        		String tag1 = rs.getString("tag1");
			        		String tag2 = rs.getString("tag2");
			        		String tag3 = rs.getString("tag3");
			        		int views = rs.getInt("views");
			        		String productQuery = rs.getString("productQuery");
				%>
				
					<!--  = Product =  -->
					<div class="span3">
						<div class="product">
							<div class="product-inner">
								<div class="product-img">
									<div class="picture">
									<!-- Here.. -->
									<div class="product-img featured">
										<a href="#"><img width="270" height="190" style="height: 220px;" src="<%=imageURL%>" class="attachment-shop_catalog wp-post-image" alt="featured-2"/></a>
									</div>	
										<div class="img-overlay">
											<a target="_blank" href="./reviews.jsp?productQuery=<%=productQuery%>" rel="nofollow" data-product_id="73" data-product_sku="" class="add_to_cart_button btn buy btn-danger product_type_simple">explore</a>	
										</div>
									</div>
								</div>	
								<div class="main-titles no-margin">
									<h4 class="title">
										<%=productName %>	
									</h4>
									<br />
									<h4 style="font-size: 15px; color: rgb(177, 39, 4) ! important;" class="title">
										Price: <span class="amount">&#8377; <%=price%></span>	
									</h4>
									<p class="desc">by <%=companyName%></p>
									<p class="desc"><%=cashOnDelivery%></p>
								</div>								
								<div class="center-align stars" style="color:#f2c14d;">
									<table>
										<tr style="float:left;">
											<td>
												<a href="showTagProducts?tag=<%=tag1%>" class="post-tag" title="" rel="tag"><%=tag1%></a>
											</td>
											<td>
												<a href="showTagProducts?tag=<%=tag2%>" class="post-tag" title="" rel="tag"><%=tag2%></a>
											</td>
											<td>
												<%
													if(!(tag3 == null || tag3 == ""))
													{
														//do nothing..
													}
													else{
														out.println("<a href='#' class='post-tag' title='' rel='tag'>"+tag3+"</a>");
													}
												%>
											</td>
										</tr>
										<tr style="float:left;">
											<td>
												<span style="color:black;">Popularity: </span>
												<%
													for(int i=0; i<popularity; i++)
													{
														out.println("<i class='fa fa-star'></i>");
													}
												%>
											</td>
										</tr>
										<tr>
											<td style="float:left;">
												<h6>
													Views: <span><%=views%></span>
												</h6>
											</td>
										</tr>
									</table>
								</div>
							</div>
						</div>
					</div> 
					<!-- END product -->
					
			<%
            		}
    			}
    				catch(Exception e){
        				e.printStackTrace();
    			}
			%>				
			
				</div>
				<div class="clearfix"></div>
				<h4 style="text-align:center;color:rgb(177, 39, 4);"><a href="showTagProducts?tag=Mobiles">Load more Mobiles items</a></h4>
				<br /><br />
				<div class="row">
					<div class="span12">
						<div class="main-titles lined">
							<h2 class="title"><span class="light">Best</span> Shoes items</h2>
						</div>	
					</div>
				</div>
				<div class="row popup-products blocks-spacer">
				<!-- Laptop -->
				<%
					try{
			        	Class.forName("com.mysql.jdbc.Driver");
			        	Connection con=DriverManager.getConnection("Your database connection with username and password");
			        				        	
			        	String sqlQuery = "SELECT * FROM EcommerceTable WHERE tag2=? ORDER BY views DESC, digitPrice ASC, popularity DESC LIMIT 8";
			        	
			        	PreparedStatement stmt = con.prepareStatement(sqlQuery);
			        	stmt.setString(1, "Shoes");
			        	ResultSet rs = stmt.executeQuery();
			        	
			        	while(rs.next())
			        	{
			        		String productName = rs.getString("productName");
			        		String buyLink = rs.getString("buyLink");
			        		String companyName = rs.getString("companyName");
			        		String price = rs.getString("price");
			        		String cashOnDelivery = rs.getString("cashOnDelivery");
			        		String imageURL = rs.getString("imageURL");
			        		int popularity = rs.getInt("popularity");
			        		String tag1 = rs.getString("tag1");
			        		String tag2 = rs.getString("tag2");
			        		String tag3 = rs.getString("tag3");
			        		int views = rs.getInt("views");
			        		String productQuery = rs.getString("productQuery");
				%>
				
					<!--  = Product =  -->
					<div class="span3">
						<div class="product">
							<div class="product-inner">
								<div class="product-img">
									<div class="picture">
									<!-- Here.. -->
									<div class="product-img featured">
										<a href="#"><img width="270" height="190" style="height: 220px;" src="<%=imageURL%>" class="attachment-shop_catalog wp-post-image" alt="featured-2"/></a>
									</div>	
										<div class="img-overlay">
											<a target="_blank" href="./reviews.jsp?productQuery=<%=productQuery%>" rel="nofollow" data-product_id="73" data-product_sku="" class="add_to_cart_button btn buy btn-danger product_type_simple">explore</a>	
										</div>
									</div>
								</div>	
								<div class="main-titles no-margin">
									<h4 class="title">
										<%=productName %>	
									</h4>
									<br />
									<h4 style="font-size: 15px; color: rgb(177, 39, 4) ! important;" class="title">
										Price: <span class="amount">&#8377; <%=price%></span>	
									</h4>
									<p class="desc">by <%=companyName%></p>
									<p class="desc"><%=cashOnDelivery%></p>
								</div>								
								<div class="center-align stars" style="color:#f2c14d;">
									<table>
										<tr style="float:left;">
											<td>
												<a href="showTagProducts?tag=<%=tag1%>" class="post-tag" title="" rel="tag"><%=tag1%></a>
											</td>
											<td>
												<a href="showTagProducts?tag=<%=tag2%>" class="post-tag" title="" rel="tag"><%=tag2%></a>
											</td>
											<td>
												<%
													if(!(tag3 == null || tag3 == ""))
													{
														//do nothing..
													}
													else{
														out.println("<a href='#' class='post-tag' title='' rel='tag'>"+tag3+"</a>");
													}
												%>
											</td>
										</tr>
										<tr style="float:left;">
											<td>
												<span style="color:black;">Popularity: </span>
												<%
													for(int i=0; i<popularity; i++)
													{
														out.println("<i class='fa fa-star'></i>");
													}
												%>
											</td>
										</tr>
										<tr>
											<td style="float:left;">
												<h6>
													Views: <span><%=views%></span>
												</h6>
											</td>
										</tr>
									</table>
								</div>
							</div>
						</div>
					</div> 
					<!-- END product -->
					
			<%
            		}
    			}
    				catch(Exception e){
        				e.printStackTrace();
    			}
			%>				
			
				</div>
				<div class="clearfix"></div>
				<h4 style="text-align:center;color:rgb(177, 39, 4);"><a href="showTagProducts?tag=Shoes">Load more Shoes items</a></h4>
				<br /><br />
			</div><!-- /span12 -->
		</div>
	</div>
</div>
<div class="container blocks-spacer-last">
	<div class="row">
		<div class="span12">
			<div id="brands_slider_widget-1" class="blocks-spacer widget_brands_slider_widget">	
				<div class="main-titles lined">
					<h2 class="title"><span class="light">from top</span> Retailers</h2>
				</div>
				<!-- Branded! -->
				<div class="brands carouFredSel" data-nav="brands_slider_widget-1" data-autoplay="true">
					<table>
						<tr>
							<td>
								<img src="./images/amazon-logo.jpg" alt="Amazon" width="203" height="104"/>
							</td>
							<td>
								<img src="./images/flipkart-logo.jpg" alt="Flipkart" width="203" height="104"/>
							</td>
							<td>
								<img src="./images/snapdeal-logo.jpg" alt="Snapdeal" width="203" height="104"/>
							</td>
							<td>
								<img src="./images/ebay-logo.jpg" alt="Ebay" width="203" height="104"/>
							</td>
						</tr>
						<tr style="text-align: center;">
							<td>
								<img src="./images/jabong-logo.png" alt="Jabong" width="203" height="104"/>
							</td>
							<td>
								<img src="./images/yepme-logo.jpg" alt="Yep me" width="203" height="104"/>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
	
	<!--  = Title =  -->
	<div class="row">
		<div class="span12"></div>
	</div> <!-- /logos -->
</div><!-- /container -->

			<script type='text/javascript' src='./js/qver=3.51.0-2014.06.20.pagespeed.jm.RVBOol6lkO.js'></script>
			<script type='text/javascript' src='./js/qver=4.2.1.pagespeed.jm.KFUoiSQRr9.js'></script>
			<script src="./js/qver==2.60.pagespeed.jc.VaYzJDl43g.js"></script><script>eval(mod_pagespeed_SxMKqOiTQ5);</script>
			<script>eval(mod_pagespeed_7oKpud87i_);</script>
			<script src="./js/qver==1.4.1.pagespeed.jc.lmoL4B9W9U.js"></script><script>eval(mod_pagespeed_PwW2bjLKHL);</script>
			<script>eval(mod_pagespeed_PqbeXTumI1);</script>
			<script src="./js/qver==6.2.1.pagespeed.jc.SEPVX_2VGT.js"></script><script>eval(mod_pagespeed_$yDN4y8E66);</script>
			<script>eval(mod_pagespeed_fR7W2L6t$m);</script>
			<script>eval(mod_pagespeed_HlnKcWfHM1);</script>
			<script type='text/javascript'>var WebmarketPriceSlider={"currency_symbol":"$","currency_pos":"left"};</script>
			<script src="./js/_comment-reply.min.js.pagespeed.jc.S61_TilAo0.js"></script><script>eval(mod_pagespeed_gue1Zi$RQ4);</script>
			<script>eval(mod_pagespeed_VWWdYmvvfR);</script>
	</body>
	<footer>
		<a style="float:right;padding-right: 12px;padding-bottom: 12px;color:#9696C5;" href="https://www.rajendraarora.com">Powered by Rajendra Arora.</a>
 	</footer>
</html>

<%
    }
%>