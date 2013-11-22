<%@ tag description="Simple menu" %>
<%@ tag import="org.apache.commons.httpclient.util.URIUtil" %>
<%@ tag import="models.User" %>
<%@ tag import="lang.*" %>
<%@ tag import="components.UrlComposer" %>
<%@ attribute name="lang" required="true" rtexprvalue="true" type="java.lang.String" %>
<%@ attribute name="user" required="true" rtexprvalue="true" type="models.User" %>
<% LangPack l = LangFactory.getLangPack(lang); %>

<% String userName = user.getUserName(); %>
<% String userPictureUrl = ""; %> 
<% String showMyProfilePage = l.getShowMyProfilePage();%> 
<% String dataUserID = String.valueOf(user.getUserID()); %> 
<% String createNewTweet = l.getCreateNewTweet();%> 
<% String dragPhotoHere = ""; %> 
<% String orDragPhotoHere = ""; %> 
<% String TweetText = l.getTweetText(); %> 
<% String addPhoto = "";%> 
<% String addLocation = "";%> 
<% String confirmedAccount = l.getConfirmedAccount(); %> 
<% String imageWillAppearAsLink = "";%>  
<% String Following = l.getFollowing();%>  
<% String FollowingCount = String.valueOf(user.getFollowingConut());%>  
<% String followers = l.getFolllowers();%>  
<% String followersCount = String.valueOf(user.getFollowerConut());%>  
<% String tweetButton = l.getTweet(); %>  
<% String tweetCount = String.valueOf(user.getTweetConut()); %>  
<% String tweetCounter = String.valueOf(user.getTweetConut());%>  

<!-- userName  -->
<!-- userPictureUrl  -->
<!-- showMyProfilePage -->
<!-- dataUserID -->
<!-- createNewTweet-->
<!-- dragPhotoHere-->
<!-- orDragPhotoHere-->
<!-- TweetText-->
<!-- addPhoto-->
<!-- addLocation-->
<!-- confirmedAccount -->
<!-- imageWillAppearAsLink -->
<!-- Following -->
<!-- folllowers-->
<!-- tweetButton -->
<!-- tweetCounter -->
<!--  -->





<div class="module mini-profile">
  <div class="flex-module profile-summary js-profile-summary">
      

  <div class="content">
    <div class="account-group js-mini-current-user" data-user-id="<%=dataUserID%>" data-screen-name="<%=userName%>">
      <img class="avatar size32" src="<%=userPictureUrl%>" alt="<%=userName%>" data-user-id="<%=dataUserID%>">
      <b class="fullname"><%=userName%></b>
      <small class="metadata">
          
          <%=showMyProfilePage%>
      </small>
    </div>
  </div>
  </div>

    <div class="js-mini-profile-stats-container">
        <ul class="stats js-mini-profile-stats" data-user-id="<%=dataUserID%>">
  <li><a class="js-nav" href="<%=UrlComposer.getSimpleUrl("Site", "tweets")%>" data-element-term="tweet_stats" data-nav="profile"><strong><%=tweetCount%></strong> <%=tweetButton%></a></li>
  <li><a class="js-nav" href="<%=UrlComposer.getSimpleUrl("Site", "follows")%>" data-element-term="following_stats" data-nav="following"><strong><%=FollowingCount%></strong> <%=Following%></a></li>
  <li><a class="js-nav" href="<%=UrlComposer.getSimpleUrl("Site", "followers")%>" data-element-term="follower_stats" data-nav="followers"><strong><%=followersCount%></strong> <%=followers%></a></li>
</ul>

    </div>


    <div class="home-tweet-box tweet-box component tweet-user">
    
      <form class="tweet-form " method="get" target="tweet-post-iframe" action="Site" enctype="multipart/form-data">
    	<textarea class="" name="tweet"></textarea>
    	<input type="hidden" name="action" value="tweet" /> 
    	<div class="tweet-button">,
      <button class="btn primary-btn" type="submit"><%=l.getTweet()%></button>
  

    	</div>
		</form>

    </div>
</div>