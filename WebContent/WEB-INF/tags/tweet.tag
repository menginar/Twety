<%@ tag import="org.apache.commons.httpclient.util.URIUtil" %>
<%@ tag import="models.Tweet" %>
<%@ tag import="lang.*" %>
<%@ tag import="components.UrlComposer" %>
<%@ attribute name="lang" required="true" rtexprvalue="true" type="java.lang.String" %>
<%@ attribute name="tweet" required="true" rtexprvalue="true" type="models.Tweet" %>
<% LangPack l = LangFactory.getLangPack(lang); %>


<% String ownerName = tweet.getUser().getUserName();%>
<% String ownerID = String.valueOf(tweet.getUser().getUserID());%>
<% String tweetId = String.valueOf(tweet.getTweetID()); %>
<% String userImage = ""; %>
<% String ownerNick = tweet.getUser().getUserAlias();  %>
<% String tweetText = tweet.getTweet(); %>
<% String tweetType = ""; %>
<% String tweetDate = tweet.getDate().toString(); %>
<% String tweetStamp = String.valueOf(tweet.getDate().getTime()); %>
<% String tweetDateText = tweet.getDate().toString(); %>
<% String open = l.getOpen(); %>
<% String close = l.getClose(); %>
<% String respns = l.getResponse(); %>
<% String hadretweet =l.getHadretweet();%>
<% String delete = l.getDelete(); %>
<% String addFavourite = l.getAddFavourite(); %>
<% String addedFavourite = l.getAddedFavourite(); %>
<% String takeBackretweet = l.getTakeBackretweet(); %>
<% String takeBackFavourite = l.getTakeBackFavourite(); %>
<% String retweet =  l.getRetweet();%>
<% String adretweett = " "; // TODO%>

<!-- ownerName : 36-->
<!-- tweetId -->
<!-- userImage -->
<!-- ownerNick -->
<!-- ownerID -->
<!-- tweetText -->
<!-- tweetType -->
<!-- tweetDate -->
<!-- tweetStamp -->
<!-- tweetDateText -->
<!-- open -->
<!-- close -->
<!-- respoense -->
<!-- retweett -->
<!-- hadretweett -->
<!-- delete  -->
<!-- addFavourite -->
<!-- addedFavourite -->
<!-- takeBackretweet -->
<!-- takeBackFavourite -->


<li class="js-stream-item stream-item stream-item expanding-stream-item" data-item-id="<%=tweetId%>" id="stream-item-tweet-<%=tweetId%>" data-item-type="tweet">

  <div class="tweet original-tweet js-stream-tweet js-actionable-tweet js-profile-popup-actionable js-original-tweet  

" data-feedback-key="stream_status_<%=tweetId%>" data-tweet-id="<%=tweetId%>" data-item-id="<%=tweetId%>" data-screen-name="<%=ownerNick%>" data-name="<%=ownerName%>" data-user-id="<%=ownerID%>" data-protected="true" data-expanded-footer="&lt;div class=&quot;js-tweet-details-fixer tweet-details-fixer&quot;&gt;

  &lt;div class=&quot;js-tweet-media-container &quot;&gt;&lt;/div&gt;
    &lt;div class=&quot;entities-media-container &quot; style=&quot;min-height:0px&quot;&gt;
    &lt;/div&gt;

  &lt;div class=&quot;js-machine-translated-tweet-container&quot;&gt;&lt;/div&gt;
  &lt;div class=&quot;js-tweet-stats-container tweet-stats-container &quot;&gt;
  &lt;/div&gt;
  &lt;div class=&quot;client-and-actions&quot;&gt;
    &lt;span class=&quot;metadata&quot;&gt;
      &lt;span title=&quot;<%=tweetDate%>&quot;&gt;<%=tweetDate%>&lt;/span&gt;

           &amp;middot; &lt;a class=&quot;permalink-link js-permalink js-nav&quot; href=&quot;/<%=ownerNick%>/status/<%=tweetId%>&quot; &gt;Detaylar&lt;/a&gt;

    &lt;/span&gt;
  &lt;/div&gt;
&lt;/div&gt;
">
    <i class="dogear"></i>
    <div class="content">
      <div class="stream-item-header">
			<a class="account-group js-account-group js-action-profile js-user-profile-link js-nav" href="<%=UrlComposer.getSimpleUrl("Site", "user", new String[][]{new String[]{"username", tweet.getUser().getUserName()}}) %>" data-user-id="<%=ownerID%>">
				<img class="avatar js-action-profile-avatar" src="<%= userImage %>" alt="<%=ownerName%>">
				<strong class="fullname js-action-profile-name show-popup-with-id"><%=ownerName%></strong>
				<span class="username js-action-profile-name">@<b><%=ownerNick%></b></span>
				<span class="icon sm-lock"><span class="visuallyhidden"><%=tweetType%></span></span>
			</a>
        <small class="time">
    <a href="#" class="tweet-timestamp js-permalink js-nav" title="<%=tweetDate%>"><span class="_timestamp js-short-timestamp js-relative-timestamp" data-time="<%=tweetStamp%>" data-long-form="true"><%=tweetDateText%></span></a>
</small>
      </div>
      <p class="js-tweet-text"><%=tweetText%></p>

      
      <div class="stream-item-footer">
        
        

<div class="context">
</div>


          
          <a class="details with-icn js-details" href="#">
            <span class="details-icon js-icon-container">
              
            </span>
            <b>
              <span class="expand-stream-item js-view-details">
                
                  <span class="expand-action-wrapper">
                    <%=open%>
                  </span>
              </span>
              <span class="collapse-stream-item js-hide-details">
                <%=close%>
              </span>
            </b>
          </a>

        
        

<ul class="tweet-actions js-actions">
  <li class="action-reply-container">
    <a class="with-icn js-action-reply" data-modal="tweet-reply" href="#">
      <span class="icon sm-reply"></span>
      <b><%=respns%></b>
    </a>
  </li>
  <li class="action-rt-container js-toggle-state js-toggle-rt">
    <a class="with-icn retweet cannot-retweet" data-modal="tweet-retweet" href="#">
      <span class="icon sm-rt"></span>
      <b> <%= retweet%> </b>
    </a>
    <a class="with-icn undo-retweet" data-modal="tweet-retweet" href="#" title="<%=takeBackretweet%>">
      <span class="icon sm-rt"></span>
      <b><%=adretweett%></b>
    </a>
  </li>
  <li class="action-del-container">
    <a class="with-icn js-action-del" href="#">
      <span class="icon sm-trash"></span>
      <b><%=delete%> </b>
    </a>
  </li>
  <li class="action-fav-container js-toggle-state js-toggle-fav">
      <a class="with-icn favorite" href="#">
        <span class="icon sm-fav"></span>
        <b><%=addFavourite%></b>
      </a>
      <a class="with-icn unfavorite" href="#" title="<%=takeBackFavourite%>">
        <span class="icon sm-fav"></span>
        <b><%=addedFavourite %></b>
      </a>
  </li>

  


  
</ul>

      </div>

      
      <div class="expanded-content js-tweet-details-dropdown">
    
    
    
</div>


    </div>
  </div>


</li>