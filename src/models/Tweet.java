package models;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.LinkedList;
import java.util.List;

import components.DatabaseAction;
import components.DatabaseManager;

public class Tweet {
	private int tweetID;
	private int userID;
	private User user;
	private String tweet;
	private int originID;
	private Tweet origin;
	private int responseID;
	private Tweet response;
	private Date date;
	private boolean isNewPost;
	
	private Tweet(int tweetID, int userID, String tweet, int originID, int responseID, Date date) {
		this.tweetID = tweetID;
		this.userID = userID;
		this.tweet = tweet;
		this.originID = originID;
		this.responseID = responseID;
		this.date = date;
		this.isNewPost = false;
	}
	
	public Tweet(int userID,  String tweet, int originID, int responseID, Date date) {
		this.tweetID = -1;
		this.userID = userID;
		this.tweet = tweet;
		this.originID = originID;
		this.responseID = responseID;
		this.date = date;
		this.isNewPost = true;
	}

	public boolean save() {
		if(isNewPost){

			String str = String.format("insert into  ttweet (userID, tweet, originID, responseID) VALUES (%d, '%s',%d,%d)", userID,tweet, originID, responseID);
			return DatabaseManager.execute(str);
		}else{
			String str = String.format("update ttweet set userID = %d, tweet = '%s', originID = %d, date = %s, responseID = %d where tweetID = %d;", userID, tweet, originID , responseID, date.toString(), tweetID);
			return DatabaseManager.execute(str);			
		}  
	}
	public static List<Tweet> findAll() {
		LinkedList<Tweet> list = new LinkedList<Tweet>();
		DatabaseManager.executeQuery(new SelectTweet(list), "select * from ttweet");
		return list;
	}

	public static List<Tweet> findAllByUserID(int userId){
		LinkedList<Tweet> list = new LinkedList<Tweet>();
		DatabaseManager.executeQuery(new SelectTweet(list), String.format("SELECT * FROM `ttweet` WHERE userID = %d",userId));
		sortTweetList(list);
		return list;
		
	}
	public static List<Tweet> findAllByWallID(int userId){
		LinkedList<Tweet> list = new LinkedList<Tweet>();
		DatabaseManager.executeQuery(new SelectTweet(list), String.format("SELECT * FROM `ttweet` WHERE userID in (select followerID from tfollow where userID =%d)",userId));
		System.out.println(list.size());
		list.addAll(findAllByUserID(userId));
		sortTweetList(list);
		return list;
		
	}

	private static Tweet findById(int tweetID) {
		LinkedList<Tweet> list = new LinkedList<Tweet>();
		DatabaseManager.executeQuery(new SelectTweet(list), String.format("select * from ttweet where tweetID = %d", tweetID));
		if(list.size() > 0)
			return list.get(0);
		else
			return null;
	}
	
	public static LinkedList<Tweet> findAllByUserId(int userID) {
		LinkedList<Tweet> list = new LinkedList<Tweet>();
		DatabaseManager.executeQuery(new SelectTweet(list), String.format("select * from ttweet where userID = %d", userID));
		return list;
	}
	public static class SelectTweet implements DatabaseAction{
		List<Tweet> list;
		public SelectTweet(List<Tweet> list){
			this.list = list;
		}
		@Override
		public void doAction(ResultSet rs) throws SQLException {
			System.out.printf("%d %s %s \n", rs.getInt(1),rs.getString(2),rs.getString(3));
			list.add(new Tweet(rs.getInt(1),rs.getInt(6),rs.getString(2),rs.getInt(3), rs.getInt(4), rs.getDate(5)));
		}
		
	}
	
	public int getUserID() {
		
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	public User getUser() {
		if(user == null)
			this.user = User.findById(userID);
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getTweet() {
		return tweet;
	}
	public void setTweet(String tweet) {
		this.tweet = tweet;
	}
	public int getOriginID() {
		return originID;
	}
	public void setOriginID(int originID) {
		this.originID = originID;
	}
	public Tweet getOrigin() {
		if(origin == null)
			this.origin = Tweet.findById(originID);;
		return origin;
	}
	public void setOrigin(Tweet origin) {
		this.origin = origin;
	}
	public int getResponseID() {
		return responseID;
	}
	public void setResponseID(int responseID) {
		this.responseID = responseID;
	}
	public Tweet getResponse() {
		if(response == null)
			this.response = Tweet.findById(responseID);
		return response;
	}
	public void setResponse(Tweet response) {
		this.response = response;
	}
	public int getTweetID() {
		return tweetID;
	}

	public void setDate(Date date) {
		this.date = date;
	}
	public Date getDate() {
		return date;
	}
	public static void sortTweetList(List<Tweet> list){
		for(int i=0; i < list.size(); i++){
			for(int j=i; j < list.size(); j++){
				if(list.get(i).getTweetID() < list.get(j).getTweetID()){
					Tweet temp = list.get(i);
					list.set(i, list.get(j));
					list.set(j, temp);
					
				}
			}
			
		}		
	}

}
