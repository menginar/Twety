<%@ tag import="org.apache.commons.httpclient.util.URIUtil" %>
<%@ tag import="models.User" %>
<%@ tag import="lang.*" %>
<%@ tag import="components.UrlComposer" %>
<%@ attribute name="lang" required="true" rtexprvalue="true" type="java.lang.String" %>
<%@ attribute name="user" required="true" rtexprvalue="true" type="models.User" %>
<% LangPack l = LangFactory.getLangPack(lang); %>
<% String follow = "Takip et"; %>
<% String following = "Takip ediliyor"; %>
<% String unfollow = "Takibi bırak"; %>

<li class="js-stream-item stream-item stream-item" data-item-id="355397950" id="stream-item-user-355397950" data-item-type="user">
      
    <div class="account  js-actionable-user js-profile-popup-actionable " data-screen-name="" data-user-id="">
        
    
         <div class="user-actions btn-group following can-dm including  " data-user-id="" data-screen-name="" data-name="" data-protected="false">
     
     
     

        
     
           
      
      <a class="js-follow-btn follow-button btn" type="button" href="<%=UrlComposer.getSimpleUrl("Site", "unfollow", new String[][]{new String[]{"followid", String.valueOf(user.getUserID())}}) %>">
        <span class="button-text follow-text">
             <i class="follow"></i> <%=follow %> 
          
        </span>
        <span class="button-text following-text">
           <%=following %>  
          
        </span>
        <span class="button-text unfollow-text">
           <%=unfollow %>   
          
        </span>
      </a>

     
     
     </div>

  <div class="content">
        <div class="stream-item-header">
          <a class="account-group js-user-profile-link" href="<%=UrlComposer.getSimpleUrl("Site", "user", new String[][]{new String[]{"username", user.getUserName()}}) %>">
            <strong class="fullname js-action-profile-name"><%= user.getUserAlias() %></strong>
           
              <span class="username js-action-profile-name">@<%= user.getUserName() %></span>
                    </a>
        </div>
          <p class="bio "> <%= user.getfirstName() + " " + user.getlastName() %></p>
    
    
        
      </div>
    </div>
    
    </li>