<%@page import="components.UserIdentity"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
    import="lang.*,models.User;"%>    
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    
    
    
    
    
    
    
    <meta charset="utf-8">
      <title>Twitter</title>
    


<meta name="msapplication-TileImage" content="//abs.twimg.com/favicons/win8-tile-144.png">
<meta name="msapplication-TileColor" content="#00aced">

  <link href="//abs.twimg.com/favicons/favicon.ico" rel="shortcut icon" type="image/x-icon">


 <link rel="stylesheet" href="https://abs.twimg.com/a/1370544606/t1/css/t1_more.bundle.css" type="text/css">
  <meta name="swift-page-name" id="swift-page-name" content="home">

    <link rel="canonical" href="https://twitter.com/">



<link rel="search" type="application/opensearchdescription+xml" href="/opensearch.xml" title="Twitter">

      <link rel="stylesheet" href="https://abs.twimg.com/a/1370544606/t1/css/t1_core.bundle.css" type="text/css">


      
<style id="user-style-talhakkas" class="js-user-style">









a,



.btn-link,
.btn-link:focus,




.pretty-link b,
.pretty-link:hover s,
.pretty-link:hover b,
.pretty-link:focus s,
.pretty-link:focus b,
/* Account Group */
.metadata a:hover,
.metadata a:focus,

.account-group:hover .fullname,
.account-group:focus .fullname,
.account-summary:focus .fullname,

.stats a:hover,
.stats a:hover strong,
.stats a:focus,
.stats a:focus strong,

.profile-modal-header .fullname a:hover,
.profile-modal-header .username a:hover,
.profile-modal-header .fullname a:focus,
.profile-modal-header .username a:focus,

.story-article:hover .metadata,
.story-article .metadata a:focus,

.find-friends-sources li:hover .source,





.stream-item a:hover .fullname,
.stream-item a:focus .fullname,

.stream-item .view-all-supplements:hover,
.stream-item .view-all-supplements:focus,

.tweet .time a:hover,
.tweet .time a:focus,
.tweet-actions a,
.tweet .details.with-icn b,

.stream-item:hover .original-tweet .expand-action-wrapper,
.stream-item .original-tweet.focus .expand-action-wrapper,
.opened-tweet.original-tweet  .expand-action-wrapper,

.stream-item:hover .original-tweet .details b,
.stream-item .original-tweet.focus .details b,
.stream-item.open .original-tweet .details b,

.simple-tweet:hover .details b,
.simple-tweet.focus .details b,
.simple-tweet.open .details b,
.simple-tweet:hover .details .expand-action-wrapper,
.simple-tweet.focus .details .expand-action-wrapper,
.simple-tweet.open .details .collapse-action-wrapper,
.simple-tweet:hover .details .simple-details-link,
.simple-tweet.focus .details .simple-details-link,

.client-and-actions a:hover,
.client-and-actions a:focus,

.dismiss-promoted:hover b,

.tweet .context .pretty-link:hover s,
.tweet .context .pretty-link:hover b,
.tweet .context .pretty-link:focus s,
.tweet .context .pretty-link:focus b,

.list .username a:hover,
.list .username a:focus,
.list-membership-container .create-a-list,
.list-membership-container .create-a-list:hover,



.story-header:hover .view-tweets,
.card .list-details a:hover,
.card .list-details a:focus,
.card .card-body:hover .attribution,
.card .card-body .attribution:focus,
.events-card .card-body:hover .attribution,
.events-card .card-body .attribution:focus,
.new-tweets-bar,
.onebox .soccer ul.ticker a:hover,
.onebox .soccer ul.ticker a:focus,



.discover-item-actions a,



.remove-background-btn,



.stream-item-activity-me .latest-tweet .tweet-row a:hover,
.stream-item-activity-me .latest-tweet .tweet-row a:focus,
.stream-item-activity-me .latest-tweet .tweet-row a:hover b,
.stream-item-activity-me .latest-tweet .tweet-row a:focus b {
    color: #038543;
}






s,
.pretty-link:hover s,
.pretty-link:focus s,
.stream-item-activity-me .latest-tweet .tweet-row a:hover s,
.stream-item-activity-me .latest-tweet .tweet-row a:focus s {
    color: #67B58E;
}





.tweet .sm-reply,
.tweet .sm-rt,
.tweet .sm-fav,
.tweet .sm-image,
.tweet .sm-video,
.tweet .sm-audio,
.tweet .sm-geo,
.tweet .sm-in,
.tweet .sm-trash,
.tweet .sm-more,
.tweet .sm-page,
.tweet .sm-embed,
.tweet .sm-summary,
.tweet .sm-chat,

.timelines-navigation .active .profile-nav-icon,
.timelines-navigation .profile-nav-icon:hover,
.timelines-navigation .profile-nav-link:focus .profile-nav-icon,

.sm-top-tweet,

.metadata a.tweet-geo-text:hover .sm-geo,


.discover-item .js-action-card-search:hover .sm-search,
.discover-item .js-action-card-search:focus .sm-search {
    background-color: #038543;
}

.wrapper.black {
  background: url(https://abs.twimg.com/a/1370544606/t1/img/wash-black-30.png);
}

.wrapper.white {
  background: url(https://abs.twimg.com/a/1370544606/t1/img/wash-white-30.png);
}


body {
    background-position: left 40px;
    background-attachment: fixed;
    background-repeat: repeat;
      background-repeat: no-repeat;
    background-color: #ACDED6;
}
</style>

      
<style id="user-style-talhakkas-bg-img" class="js-user-style-bg-img">
  body.user-style-talhakkas {
        background-image: url(https://twimg0-a.akamaihd.net/images/themes/theme18/bg.gif);
  }
</style>


    
  

  <link rel="stylesheet" href="https://abs.twimg.com/a/1370544606/t1/css/t1_more.bundle.css" charset="utf-8"></head>
<!--  t1 logged-in user-style-talhakkas ms-windows western tr supports-drag-and-drop-->
<body class="t1 logged-out ms-windows western tr front-random-image-city-balcony front-page" dir="ltr" data-twttr-rendered="true">
	<div id="doc" class="route-home">
		<% if(new UserIdentity().isAuthenticate(request)){ %>
	
		<div id="banners" class="js-banners">
		<% User u = new UserIdentity().getAuthenticateUser(request);%>
			<tags:topbar user="<%=u%>" lang="<%=LangFactory.TURKISH%>"/>
		</div>
		<%} %>
	<div id="page-outer">
		<div id="page-container" class="wrapper wrapper-home white">
			<jsp:include page='<%=(String)request.getAttribute("layout")%>' />
            
        </div>
	</div>
	
	</div>
<script src="https://abs.twimg.com/c/swift/tr/init.9e77c52cc69d15983a23e2eae0aa05885921256a.js" async=""></script>

</body>
</html>