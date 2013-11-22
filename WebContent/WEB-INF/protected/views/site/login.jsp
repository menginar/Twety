<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	import="lang.*,components.UrlComposer"%>
	
<% LangPack l = LangFactory.getLangPack((String)request.getAttribute("lang")); %>
<% String username = l.getUsername(); %>
<% String userNameOrEmail = l.getUserNameOrEmail(); %>
<% String password = l.getPassword(); %>
<% String login = l.getLogin(); %>
<% String forgotPassword = l.getForgotPassword(); %>
<% String areYouNewAtTwitty = l.getAreYouNewAtTwitty(); %>
<% String singup = l.getSingup(); %>
<% String name = l.getName(); %>
<% String lastname = l.getLastName(); %> 
<% String email = l.getEmail(); %>
<% String singupAtTwitty = l.getSingupAtTwitty(); %>
          
		<center>
			<form action="<%=UrlComposer.getSimpleUrl("Site", "login") %>" method="post" accept-charset="utf-8" class="form-signin form-horizontal">
				<hr width="100%" size="5" noshade="NOSHADE">
				
				<h4><%=userNameOrEmail %></h4>
				<input type="text" class="input-block-level" placeholder="<%=userNameOrEmail %>" name="username">
				<h4><%=password %></h4>
				<input type="password" class="input-block-level" placeholder="<%=password %>" name="password"><br>
				<Button type="submit" value="<%= login%>" class="btn btn-large btn-primary"><%= login%></button><br>
				<a href=""><%= forgotPassword%></a><br><br><br>
			</form>

	</center>
		<center>
		<h2> <%=areYouNewAtTwitty %></h2>
	<form  action="<%=UrlComposer.getSimpleUrl("Site", "singup") %>"method="post" style="width:300px">
			<br><h3><%=singup %></h3>
			<br><h4><%=username %></h4><input type="text"  placeholder="<%=username %>" class="input-block-level" name="username">
			<br><h4><%=name %></h4><input type="text"  placeholder="<%=name %>" class="input-block-level" name="name">
			<br><h4><%=lastname %></h4><input type="text"  placeholder="<%=lastname %>" class="input-block-level" name="lastname">
			<br><h4><%=email %></h4><input type="text"  placeholder="<%=email %>" class="input-block-level" name="email">
			<br><h4><%=password %></h4><input type="password"  placeholder="<%=password %>" class="input-block-level" name="password"><br>
			<Button type="submit" value="<%=singupAtTwitty %>" class="btn btn-large btn-primary"><%=singupAtTwitty %></button><br><br>
	</form>
	</center>