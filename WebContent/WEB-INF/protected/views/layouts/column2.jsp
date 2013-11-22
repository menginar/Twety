<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<div class="dashboard">
	<jsp:include page='leftbar.jsp' />
</div> 
			
<div class="content-main" id="timeline">
	<jsp:include page='<%=(String)request.getAttribute("content")%>' />
</div>