<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="java.util.List,models.User;"%>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags" %>
<%  List<User> list = ((List)request.getAttribute("userlist"));%>
<%  String lang = ((String)request.getAttribute("lang"));%>
<% String header = ((String)request.getAttribute("header")); %>
<div class="content-main" id="timeline">
    <div class="content-header">
      <div class="header-inner">
        <h2 class="js-timeline-title"><%= header %>
        </h2>
  
      </div>
    </div>
        <div class="stream-container " data-cursor="1417550205192091162">
        <div class="stream profile-stream">
          <ol class="stream-items" id="stream-items-id">  
          <% for(User u : list){ %>
          		<tag:user user="<%=u%>" lang="<%=lang %>"/>
          <%} %>
          </ol>
        </div>
      </div>
    </div>