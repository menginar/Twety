<%@ tag language="java" pageEncoding="ISO-8859-1"%>
<%@ tag description="Simple menu" %>
<%@ tag import="org.apache.commons.httpclient.util.URIUtil" %>
<%@ tag import="models.Tweet" %>
<%@ tag import="models.User" %>
<%@ tag import="lang.*" %>
<%@ tag import="components.*" %>
<%@ attribute name="lang" required="true" rtexprvalue="true" type="java.lang.String" %>
<%@ attribute name="user" required="true" rtexprvalue="true" type="models.User" %>


<% LangPack l = LangFactory.getLangPack(lang); %>
<% String connect = l.getConnect(); %>
<% String search =  l.getSearch(); %>
<% String homePage = l.getHomePage(); %>
<% String userNick = user.getUserAlias(); %>
<% String confirmedAccount = l.getConfirmedAccount(); %>
<% String regulateProfile = l.getRegulateProfile(); %>
<% String exit = l.getExit(); %>
<% String closeAllOpenTweets = l.getCloseAllOpenTweets(); %>
<% String createNewTweet = l.getCreateNewTweet(); %>
<% String UserImageUrl = ""; %>
<% String me = l.getMe(); %>
<% String settingAndHelping = l.getSettingAndHelping(); %>

<!-- searchQuery -->
<!-- connect -->
<!-- search -->
<!-- me -->
<!-- homePage -->
<!-- userNick -->
<!-- confirmedAccount -->
<!-- settingAndHelping -->
<!-- keyboardShortPath -->
<!-- regulateProfile -->
<!-- directMessages -->
<!-- lists -->
<!-- helping -->
<!-- setting -->
<!-- exit -->
<!-- closeAllOpenTweets -->
<!--createNewTweet-->
<!--UserImageUrl -->
<div class="topbar js-topbar">
  <div id="banners" class="js-banners">
  </div>
  <div class="global-nav" data-section-term="top_nav">
    <div class="global-nav-inner">
      <div class="container">
        <h1 class="icon bird-topbar-etched">
          <span class="visuallyhidden">Twitter</span>
        </h1><div class="pushstate-spinner"></div>
        
        <ul class="nav js-global-actions" id="global-actions" style="display: inline-block;"><li id="global-nav-home" class="home active" data-global-action="home">
		<a class="js-nav" href="<%=UrlComposer.getSimpleUrl("Site", "wall")%>" data-component-term="home_nav" data-nav="home" title="<%=homePage%>"><span class="new-wrapper"><i class="nav-home">
		</i><i class="nav-new"></i></span> <span class="text"><%=homePage%></span></a></li><li class="topics" data-global-action="discover">
		</li><li class="profile" data-global-action="profile"><a class="js-nav" href="<%=UrlComposer.getSimpleUrl("Site", "tweets")%>" data-component-term="profile_nav" data-nav="profile" title="Ben"><span class="new-wrapper"><i class="nav-me"></i><i class="nav-new"></i></span> <span class="text"><%=me%></span></a></li></ul>
        
        <div class="pull-right" style="display: inline-block;">
          <i class="topbar-divider"></i>
           <div class="well topbar-tweet-btn">
          <a href="<%=UrlComposer.getSimpleUrl("Site", "logout")%>"><%=exit %></a>
          </div>
          <div class="well topbar-tweet-btn">
          <form action="<%=UrlComposer.getSimpleUrl("Site", "newtweet") %>">
          <button id="global-new-tweet-button" type="submit" class="btn btn-tweet js-global-new-tweet js-tooltip" data-placement="bottom" data-component-term="new_tweet_button" data-original-title="<%=createNewTweet%>"><i class="nav-tweet"><span class="visuallyhidden"><%=createNewTweet%></span></i></button>
          
		</form>
          </div>
       </div>


        
        <a id="close-all-button" class="close-all-tweets js-close-all-tweets" href="#" title="<%=closeAllOpenTweets%>">
          <i class="nav-breaker"></i>
        </a>
      </div>
    </div>
  </div>

</div>