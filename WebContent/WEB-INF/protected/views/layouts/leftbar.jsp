<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="ISO-8859-1"
    import="lang.*,models.User,java.util.*;"%>
    
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<% User u = (User)request.getAttribute("user");%>
<% List<User> recommends = User.findRecommends();%>

<tags:profile user="<%=u%>" lang="<%=LangFactory.TURKISH%>" />
<tags:recommend userlist="<%=recommends%>" lang="<%=LangFactory.TURKISH%>"/>
<tags:footer lang="<%=LangFactory.TURKISH%>" />