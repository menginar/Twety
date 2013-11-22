<%@ tag description="Simple menu" %>
<%@ tag import="lang.*" %>
<%@ attribute name="lang" required="true" rtexprvalue="true" type="java.lang.String" %>
<% LangPack l = LangFactory.getLangPack(lang); %>


<!-- aboutUs-->
<!-- helping-->
<!-- conditions -->
<!-- privicay -->
<!-- blog -->
<!-- state-->
<!-- applications-->
<!-- sources -->
<!-- advertisers-->
<!-- businesses -->
<!-- advertisers -->
<!-- copyright-->
<!-- developers -->

<div class="module site-footer ">
  <div class="flex-module">
    <div class="flex-module-inner js-items-container">
      <ul class="clearfix">
        <li class="copyright"><%=l.getAbout()%></li>
        <li><a href="#"><%=l.getCopyright() %></a></li>
        <li><a href="#"><%=l.getHelping()%></a></li>
        <li><a href="#"><%=l.getConditions()%></a></li>
        <li><a href="#"><%=l.getPrivacy()%></a></li>
        <li><a href="#"><%=l.getBlog()%></a></li>
        <li><a href="#"><%=l.getState()%></a></li>
        <li><a href="#"><%=l.getApplications()%></a></li>
        <li><a href="#"><%=l.getSources()%></a></li>
        <li><a href="#"><%=l.getCareer()%></a></li>
        <li><a href="#"><%=l.getAdvertisers()%></a></li>
        <li><a href="#"><%=l.getBusinesses()%></a></li>
        <li><a href="#"><%=l.getMedia()%></a></li>
        <li><a href="#"><%=l.getDevelopers()%></a></li>
      </ul>
    </div>
  </div>
</div>