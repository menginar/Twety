<%@ tag language="java" pageEncoding="ISO-8859-1"%>
<%@ tag description="Simple menu" %>
<%@ tag import="org.apache.commons.httpclient.util.URIUtil" %>
<%@ tag import="models.Tweet" %>
<%@ tag import="models.User" %>
<%@ tag import="components.UrlComposer" %>
<%@ tag import="lang.*" %>
<%@ attribute name="lang" required="true" rtexprvalue="true" type="java.lang.String" %>
<%@ attribute name="userlist" required="true" rtexprvalue="true" type="java.util.List" %>

<% LangPack l = LangFactory.getLangPack(lang); %>
<% String WhoShouldFollow = l.getWhoShouldFollow(); %>
<% String Refresh = l.getRefresh(); %>
<% String Showall = l.getShowAll(); %>
<% String Follow = l.getFollow(); %>
<% String LeaveFollow = l.getLeaveFollow(); %>
<% String Cancel = l.getCancel() ; %>
<% String Confirmed = l.getConfirmedAccount();%>
<% String GlanceCategories = l.getGlanceCategories(); %>
<% String And = l.getAnd(); %>
<% String Anothers = l.getAnothers(); %>
<% String FollowingByThem = l.getFollowingByThem();  %>
<% String RecommendImageUrl= "";%>
<% String RecommendToken = ""; %>
<% String  RecommendDataElementTerm1 = ""; %>

<!-- WhoShouldFollow -->
<!-- Refresh  -->
<!-- ShowAll  -->
<!-- Follow  -->
<!-- Cancel  -->
<!-- LeaveFollow -->
<!-- ConfirmedAccount  -->
<!-- GlanceCategories -->
<!-- FindYourFriends -->
<!-- RecommendImageUrl-->
<!-- RecommendPerson1Name-->
<!-- RecommendPerson1Nick -->
<!-- RecommendUserId  -->
<!-- RecommendDataElementTerm1-->
<!-- And -->
<!-- RecommendImage -->
<!-- RecommendToken -->
<!-- RecommendUserId2 ->
<!-- RecommendPerson2Name -->
<!-- RecommendPerson2Nick -->
<!-- RecommendToken2 -->
<!-- RecommendUserId3 -->
<!--RecommendUserId4 -->
<!--RecommendPerson3Name-->
<!--RecommendElementTerm-->
<!--RecommendElementTerm2-->
<!-- RecommendImage2Url -->
<!-- Anothers  -->
<!--FollowingByThem -->


<div class="module wtf-module js-wtf-module  has-content">

  <div class="flex-module">

    <div class="flex-module-header">
      <h3><%=WhoShouldFollow%></h3>
        <small class="view-all"><a class="js-view-all-link" href="#" data-element-term="<%=RecommendDataElementTerm1%>"><%=l.getShowAll()%></a></small>
    </div>

    <div class="js-recommended-followers dashboard-user-recommendations flex-module-inner" data-section-id="wtf" style="opacity: 1;">
	<% for(int i = 0; i < userlist.size() && i < 5; i++){ 
	 User u = (User) userlist.get(i);%>
	<div class="js-account-summary account-summary js-actionable-user " data-user-id="<%=u.getUserID()%>" data-feedback-token=RecommendToken>
	  <div class="dismiss js-action-dismiss"><i class="close"></i></div>
	  <div class="content">
	    <a class="account-group js-recommend-link js-user-profile-link user-thumb" href="<%=UrlComposer.getSimpleUrl("Site", "user", new String[][]{new String[]{"username",u.getUserName()}}) %>" data-user-id="<%=u.getUserID()%>">
	      
	      
	      <span class="account-group-inner js-action-profile-name" data-user-id="<%=u.getUserID()%>">
	        <b class="fullname"><%=u.fullName()%></b>
	               
	        <span class="username">@<span class="js-username"><%=u.getUserName()%></span></span>
	      </span>
	    </a>
	
	
	    
	      <span class="user-actions not-following" data-user-id="<%=u.getUserID()%>">
	  <a href="<%=UrlComposer.getSimpleUrl("Site", "follow", new String[][]{new String[]{"followid",String.valueOf(u.getUserID())}}) %>" class="follow-link">
	    <span class="link-text follow-text"><%=l.getFollow() %></span>
	  </a>
	</span>
	
	</div>
	</div>
	
	<%}%>
	</div>

      <div class="flex-module-footer">
        <a href="#" class="js-interests-link" data-element-term="interests_link"><%=l.getGlanceCategories()%></a>  <a href="/who_to_follow/import" class="js-find-friends-link" data-element-term="import_link"><%=l.getFindYourFriends()%></a>
      </div>

  </div>
</div>