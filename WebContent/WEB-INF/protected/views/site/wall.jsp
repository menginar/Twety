<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="java.util.List,models.Tweet;"%>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags" %>
<%  List<Tweet> list = ((List)request.getAttribute("tweetlist"));%> 
<%  String lang = ((String)request.getAttribute("lang"));%>
 
<tag:tweetslist lang="<%=lang%>"  tlist="<%=list%>" />