<%@ tag description="Simple menu" %>
<%@ tag import="org.apache.commons.httpclient.util.URIUtil" %>
<%@ attribute name="list" required="true" rtexprvalue="true" type="java.util.List" %>

<div class="module trends">
  <div class="flex-module trends-inner"><div class="flex-module trends-container">
  <div class="flex-module-header">
    
    <h3>
      <span class="js-trend-location">
          Türkiye Gündemi
      </span>
    </h3>
    <small>· <a href="#" data-modal="change-trends" class="change-trends js-trend-toggle">Değiştir</a></small>
  </div>
  <div class="flex-module-inner">
    <ul class="trend-items js-trends">
    	<% for(int i = 0; i < list.size() && i < 5; i++){ %>
			<li class="trend-item js-trend-item  " data-trend-name="<%= list.get(i)%>">
		
      			<a class="js-nav" href="#" data-query-source="trend_click"><%= list.get(i)%></a>
			
			</li>
		<%} %>
        
		
       
    </ul>
  </div>
</div></div>
</div>