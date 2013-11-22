 package controllers;

import java.io.IOException;
import java.sql.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import components.UrlComposer;
import components.UserIdentity;
import config.main;

import models.Tweet;
import models.User;
import models.WebError;

/**
 * Servlet implementation class Controller
 */
@SuppressWarnings("serial")
public class SiteController extends Controller {
	@Override
	protected String getContainer(){
		return "main.jsp";
	}@Override
	protected String getBase(){
		return "site"; 
	}@Override   
	protected String getLayout(){
		return "column2.jsp";
	}@Override
	protected String getBaseurl() {
		return "Site";  
	}
             
	@Override
	protected Map<String, Action> getActions() {
		HashMap<String,Action> actionMap = new HashMap<String,Action>();
		actionMap.put(DEFAULT, new ActionWall());
		actionMap.put("wall", new ActionWall());
		actionMap.put("user", new ActionUser());
		actionMap.put("tweet", new ActionTweet());
		actionMap.put("tweets", new ActionTweets());
		actionMap.put("login", new ActionLogin());
		actionMap.put("logout", new ActionLogout());
		actionMap.put("singup", new ActionSingup());
		actionMap.put("follow", new ActionFollowUser());
		actionMap.put("unfollow", new ActionUnfollowUser());
		actionMap.put("followers", new ActionFollowers());
		actionMap.put("follows", new ActionFollows());
		return actionMap; 
	} 
	@Override 
	public void doError(HttpServletRequest request, HttpServletResponse response, WebError error) throws ServletException, IOException {
		request.setAttribute("appname", main.APPNAME);
		request.setAttribute("title", "Twitty");
		request.setAttribute("error", error);
		renderPage(request, response, "error.jsp","column1.jsp");
	}
	class ActionFollowers implements Action{
		@Override
		public boolean beforeAction(HttpServletRequest request,HttpServletResponse response) {
			if(! new UserIdentity().isAuthenticate(request)){
				try {
					response.sendRedirect(response.encodeRedirectURL(UrlComposer.getSimpleUrl(getBaseurl(),"login")));
				} catch (IOException e) {
					e.printStackTrace();
				}
				return false;
				}
			return true;
		} 
		@Override
		public void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

			request.setAttribute("appname", main.APPNAME);
			request.setAttribute("title", "Twitty");
			User user = new UserIdentity().getAuthenticateUser(request);
			request.setAttribute("user", user);
			request.setAttribute("userlist", user.findFollower());
			request.setAttribute("lang", request.getParameter("lang"));
			request.setAttribute("header","Takipçileri");
			renderPage(request, response, "userlist.jsp");
		}
	}
	class ActionFollows implements Action{
		@Override
		public boolean beforeAction(HttpServletRequest request,HttpServletResponse response) {
			if(! new UserIdentity().isAuthenticate(request)){
				try {
					response.sendRedirect(response.encodeRedirectURL(UrlComposer.getSimpleUrl(getBaseurl(),"login")));
				} catch (IOException e) {
					e.printStackTrace();
				}
				return false;
				}
			return true;
		} 
		@Override
		public void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

			request.setAttribute("appname", main.APPNAME);
			request.setAttribute("title", "Twitty");
			User user = new UserIdentity().getAuthenticateUser(request);
			request.setAttribute("user", user);
			request.setAttribute("userlist", user.findFollows());
			request.setAttribute("lang", request.getParameter("lang"));
			request.setAttribute("header","Takip Ettikleri");
			renderPage(request, response, "userlist.jsp");
		}
	}
	class ActionWall implements Action{
		@Override
		public boolean beforeAction(HttpServletRequest request,HttpServletResponse response) {
			if(!new UserIdentity().isAuthenticate(request)){
				try {
					response.sendRedirect(response.encodeRedirectURL(UrlComposer.getSimpleUrl(getBaseurl(),"login")));
				} catch (IOException e) {
					e.printStackTrace();
				}
				return false;
				}
			return true;
		} 
		@Override 
		public void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			request.setAttribute("appname", main.APPNAME);
			request.setAttribute("title", "Twitty");
			User user = new UserIdentity().getAuthenticateUser(request);
			request.setAttribute("user", user);
			request.setAttribute("tweetlist", Tweet.findAllByWallID(user.getUserID()));
			request.setAttribute("lang", request.getParameter("lang"));
			renderPage(request, response, "wall.jsp");
		}
	}
	class ActionUser implements Action{
		@Override
		public boolean beforeAction(HttpServletRequest request,HttpServletResponse response) {
			if(!new UserIdentity().isAuthenticate(request)){
				try {
					response.sendRedirect(response.encodeRedirectURL(UrlComposer.getSimpleUrl(getBaseurl(),"login")));
				} catch (IOException e) {
					e.printStackTrace();
				}
				return false;
				}
			return true;
		} 
		@Override
		public void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

			request.setAttribute("appname", main.APPNAME);
			request.setAttribute("title", "Twitty");
			request.setAttribute("user", new UserIdentity().getAuthenticateUser(request));
			if(request.getParameter("username") != null){
				User user = User.findByUserName(request.getParameter("username"));
				if(user != null){
					request.setAttribute("tweetlist", Tweet.findAllByUserID(user.getUserID()));
					request.setAttribute("lang", request.getParameter("lang"));
				}
			}
			renderPage(request, response, "wall.jsp");
		}
	}
	class ActionTweets implements Action{
		@Override
		public boolean beforeAction(HttpServletRequest request,HttpServletResponse response) {
			if(! new UserIdentity().isAuthenticate(request)){
				try {
					response.sendRedirect(response.encodeRedirectURL(UrlComposer.getSimpleUrl(getBaseurl(),"login")));
				} catch (IOException e) {
					e.printStackTrace();
				}
				return false;
				}
			return true;
		} 
		@Override
		public void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

			request.setAttribute("appname", main.APPNAME);
			request.setAttribute("title", "Twitty");
			User user = new UserIdentity().getAuthenticateUser(request);
			request.setAttribute("user", user);
			System.out.println(user.getUserID());
			request.setAttribute("tweetlist", Tweet.findAllByUserID(user.getUserID()));
			request.setAttribute("lang", request.getParameter("lang"));
			renderPage(request, response, "wall.jsp");
		}
	}
	class ActionTweet implements Action{
		@Override
		public boolean beforeAction(HttpServletRequest request,HttpServletResponse response) {
			if(! new UserIdentity().isAuthenticate(request)){
				try {
					response.sendRedirect(response.encodeRedirectURL(UrlComposer.getSimpleUrl(getBaseurl(),"login")));
				} catch (IOException e) {
					e.printStackTrace();
				}
				return false;
				}
			return true;
		}   
		@Override
		public void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			if(request.getParameter("tweet") != null){
				User user = new UserIdentity().getAuthenticateUser(request);
				java.util.Date utilDate = new java.util.Date();
				java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
				Tweet tweet = new Tweet(user.getUserID(), request.getParameter("tweet"), 0, 0, sqlDate);
				if(tweet.save()){
					response.sendRedirect(response.encodeRedirectURL(SiteController.this.getBaseurl()));
					return;
				}else{ 

					doError(request, response, new WebError(115,"Tweetiniz gerçekleþtirilemedi"));
					return;
				}
			}
		}
	}
	class ActionFollowUser implements Action{
		@Override
		public boolean beforeAction(HttpServletRequest request,HttpServletResponse response) {
			if(! new UserIdentity().isAuthenticate(request)){
				try {
					response.sendRedirect(response.encodeRedirectURL(getBaseurl()));
				} catch (IOException e) {
					e.printStackTrace();
				}
				return false;
				}
			return true;
		}
		@Override
		public void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

			request.setAttribute("appname", main.APPNAME);
			request.setAttribute("title", "Twitty");
			User user = new UserIdentity().getAuthenticateUser(request);
			if(request.getParameter("followid") != null)
				user.followUserByID(Integer.parseInt(request.getParameter("followid")));
			response.sendRedirect(response.encodeRedirectURL(getBaseurl()));
		}
	}
	class ActionUnfollowUser implements Action{
		@Override
		public boolean beforeAction(HttpServletRequest request,HttpServletResponse response) {
			if(! new UserIdentity().isAuthenticate(request)){
				try {
					response.sendRedirect(response.encodeRedirectURL(getBaseurl()));
				} catch (IOException e) {
					e.printStackTrace();
				}
				return false;
				}
			return true;
		}
		@Override
		public void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

			request.setAttribute("appname", main.APPNAME);
			request.setAttribute("title", "Twitty");
			User user = new UserIdentity().getAuthenticateUser(request);
			if(request.getParameter("followid") != null)
				user.unfollowUserByID(Integer.parseInt(request.getParameter("followid")));
			response.sendRedirect(response.encodeRedirectURL(getBaseurl()));
		}
	}
	class ActionRetweet implements Action{
		@Override
		public boolean beforeAction(HttpServletRequest request,HttpServletResponse response) {
			if(! new UserIdentity().isAuthenticate(request)){
				try {
					response.sendRedirect(response.encodeRedirectURL(getBaseurl()));
				} catch (IOException e) {
					e.printStackTrace();
				}
				return false;
				}
			return true;
		}
		@Override
		public void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

			request.setAttribute("appname", main.APPNAME);
			request.setAttribute("title", "Twitty");
			User user = new UserIdentity().getAuthenticateUser(request);
			if(request.getParameter("followid") != null)
				user.unfollowUserByID(Integer.parseInt(request.getParameter("followid")));
		}
	}
	class ActionLogin implements Action{
		@Override
		public void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			if(request.getParameter("username") != null){
				UserIdentity user = new UserIdentity();
				if(user.authenticateUserWithCookie(response,request.getParameter("username"), request.getParameter("password"))){
					try {

						response.sendRedirect(response.encodeRedirectURL(getBaseurl()));
					} catch (IOException e) {
						e.printStackTrace();
					}
					return;
				}else{

					doError(request, response, new WebError(115,"Yanlýþ Kullanýcý adý veya þifre"));
					return;
				}
			}
			request.setAttribute("appname", main.APPNAME);
			request.setAttribute("title", "Twitty");
			renderPage(request, response, "login.jsp", "column1.jsp");
		}

		@Override
		public boolean beforeAction(HttpServletRequest request, HttpServletResponse response) {
			if(new UserIdentity().isAuthenticate(request)){
				try {
					response.sendRedirect(response.encodeRedirectURL(getBaseurl()));
				} catch (IOException e) {
					e.printStackTrace();
				}
				return false;
				}
			return true;
		}
	}
	class ActionLogout implements Action{
		@Override
		public boolean beforeAction(HttpServletRequest request, HttpServletResponse response) {
			if(! new UserIdentity().isAuthenticate(request)){
				try {
					response.sendRedirect(response.encodeRedirectURL(getBaseurl()));
				} catch (IOException e) {
					e.printStackTrace();
				}
				return false;
				}
			return true;
		}
		
		@Override
		public void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				UserIdentity user = new UserIdentity();
				user.logout(response);
				try {
					response.sendRedirect(response.encodeRedirectURL(getBaseurl()));
				} catch (IOException e) {
					e.printStackTrace();
				}
				return;
		}
		  
	}
	class ActionSingup implements Action{
		@Override
		public boolean beforeAction(HttpServletRequest request, HttpServletResponse response) {
			if(new UserIdentity().isAuthenticate(request)){
				try {
					response.sendRedirect(response.encodeRedirectURL(getBaseurl()));
				} catch (IOException e) {
					e.printStackTrace();
				}
				return false;
				}
			return true;
		}
		
		@Override
		public void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
				if(request.getParameter("username") != null){
					User user = new User(request.getParameter("username"),request.getParameter("username"),request.getParameter("name"),
							request.getParameter("lastname"),request.getParameter("password"), 1, new java.util.Date(),request.getParameter("email"));
					user.save();
					
					UserIdentity userIdentity = new UserIdentity();
					userIdentity.authenticateUserWithCookie(response,request.getParameter("username"), request.getParameter("password"));
					response.sendRedirect(response.encodeRedirectURL(getBaseurl()));
					return;
					
				}
				doError(request, response, new WebError(115,"kullanýcý kayýdý olamýyorsunuz lütfen baþka deðerler deneyiniz"));
		}
		  
	}
}
