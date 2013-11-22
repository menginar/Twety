package models;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import javax.swing.table.TableModel;
import javax.swing.tree.DefaultMutableTreeNode;

import org.apache.commons.httpclient.util.DateParseException;
import org.apache.commons.httpclient.util.DateParser;

import sun.misc.GC.LatencyRequest;
import components.DatabaseAction;
import components.DatabaseManager;

public class User {
	private int userID;
	private String UserName;
	public String UserAlias;
	private String firstName;
	private String lastName;
	private String password;
	private int sex;
	private Date birth;
	private String email;
	private List<Tweet> tweets;
	private boolean isNewPost;
	
	private User (int userID, String UserName, String UserAlias, String firstName,
			String lastName, String password, int sex, Date birth, String email) {
		
		this.userID = userID;
		this.UserName = UserName;
		this.UserAlias = UserAlias;
		this.firstName = firstName;
		this.lastName = lastName;
		this.password = password;
		this.sex = sex;
		this.birth = birth;
		this.email = email;
		this.isNewPost = false;
	}
	
	public User(String UserName, String UserAlias, String firstName, String lastName, 
			String password, int sex, Date birth, String email) {
		super();
		this.userID = -1;
		this.UserName = UserName;
		this.UserAlias = UserAlias;
		this.firstName = firstName;
		this.lastName = lastName;
		this.password = password;
		this.sex = sex;
		this.birth = birth;
		this.email = email;
		this.isNewPost = true;
	}
	
	public boolean save() {
		DateFormat df = new SimpleDateFormat("yyyy-mm-dd");
		System.out.println(df.format(birth));
		if(isNewPost){
			String str = String.format("insert into  tuser (UserName, UserAlias, firstName, lastName, password, sex, birth, email) " +
					"VALUES ('%s', '%s', '%s', '%s', '%s', %d, '%s', '%s');", UserName, UserAlias, firstName, lastName, password, sex, df.format(birth), email);
			return DatabaseManager.execute(str);
		}else{
			String str = String.format("update tuser set UserName = '%s', UserAlias = '%s', firstName = '%s', " +
					"lastName = '%s', sex = %d  where userID = %d;", UserName, UserAlias, firstName, lastName, sex, userID);
			return DatabaseManager.execute(str);			
		}
	}
	public void followUserByID(int following_id){
		String str = String.format("insert into  tfollow (userID, followerID) VALUES (%d, %d);", userID, following_id);
		DatabaseManager.execute(str);
	}
	
	public void unfollowUserByID(int following_id){
		String str = String.format("delete from tfollow where followerID = %d and userID = %d",following_id,userID);
		DatabaseManager.execute(str);
	}
	
	public static List<User> findAll() {
		LinkedList<User> list = new LinkedList<User>();
		DatabaseManager.executeQuery(new SelectUser(list), "select * from tuser");
		return list;
	}
	public static List<User> findRecommends() {
		List<User> list = findAll();
		int a = (int) Math.floor(Math.random()*(list.size()-5) + 5 );
		return list.subList(a-5, a);
	}
	
	public static User findByUserName(String username){
		LinkedList<User> list = new LinkedList<User>();
		DatabaseManager.executeQuery(new SelectUser(list), String.format("select * from tuser where UserName = '%s'", username));
		if(list.size() > 0)
			return list.get(0);
		else
			return null;
	}
	public LinkedList<User> findFollower(){
		LinkedList<User> list = new LinkedList<User>();
		DatabaseManager.executeQuery(new SelectUser(list), String.format("select * from tuser where userID in (select userID from tfollow where followerID = %d)", userID));
		return list;
	}
	public LinkedList<User> findFollows(){
		LinkedList<User> list = new LinkedList<User>();
		DatabaseManager.executeQuery(new SelectUser(list), String.format("select * from tuser where userID in (select followerID from tfollow where userID  = %d)", userID));
		return list;
	}
	
	
	//User Delete  Ýþlemi //
	public void deleteUser(){
		String str = String.format("delete from tuser where userID = %d", userID);
		DatabaseManager.execute(str);
	}
	

	public static User findById(int userID) {
		LinkedList<User> list = new LinkedList<User>();
		DatabaseManager.executeQuery(new SelectUser(list), String.format("select * from tuser where userID = %d", userID));
		if(list.size() > 0)
			return list.get(0);
		else
			return null;
	}

	public List<User> findFollowers() {
		LinkedList<User> list = new LinkedList<User>();
		DatabaseManager.executeQuery(new SelectUser(list), String.format("Select * from tuser where userID in (select userID from tfollow where  followerID = %d)",userID));
		return list;
		
	}
	
	public List<User> findFollowings() {
		LinkedList<User> list = new LinkedList<User>();
		DatabaseManager.executeQuery(new SelectUser(list), String.format("Select * from tuser where userID in (select followerID from tfollow where userID = %d)",userID));
		return list;
	}
	
	public String fullName(){
		return getfirstName() + " " +  getlastName(); 
	}
	
	public List<Tweet> findTweets() {
		return Tweet.findAllByUserId(userID);
	}
	
	
	public static class SelectUser implements DatabaseAction{
		List<User> list;
		public SelectUser(List<User> list){
			this.list = list;
		}
		@Override
		public void doAction(ResultSet rs) throws SQLException {
			//System.out.printf("%d %s %s %s %s\n", rs.getInt(1),rs.getString(2),rs.getString(3),java.sql.Date.valueOf(rs.getString(8)), rs.getString(9));
			list.add(new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
				rs.getString(6), rs.getInt(7), java.sql.Date.valueOf(rs.getString(8)), rs.getString(9)));
			
		}
	}
	
	//user
	public String getUserName()
	{
		return this.UserName;
	}
	public void setUserName(String UserName)
	{
		this.UserName = UserName;
	}
	//useralias
	public void setUserAlias(String UserAlias)
	{
		this.UserName = UserAlias;
	}
	public String getUserAlias()
	{
		return this.UserAlias;
	}
	//firstname
	public String getfirstName()
	{
		return this.firstName;
	}
	public void setfirstName(String firstName)
	{
		this.firstName = firstName;
	}
	//lastname
	public String getlastName(){
		return this.lastName;
	}
	public void setlastName(String lastName)
	{
		this.lastName = lastName;
	}
	//pass
	public String getPassword()
	{
		return this.password;
	}
	public void setPassword(String password)
	{
		this.password = password;
	}
	//sex
	public int getsex()
	{
		return this.sex;
	}
	public void setsex(int sex)
	{
		this.sex = sex;
	}
	//email
	public String getEmail()
	{
		
		return this.email;
	}
	public void setemail(String email)
	{
		this.email = email;
	}
	//dogumtarihi
	public Date getbirth()
	{
		return this.birth;
	}
	public void setbirth()
	{
		this.birth = birth;
	}

	public int getUserID()
	{
		return this.userID;
	}
	public List<Tweet> getTweets(){
		if(tweets == null){
			tweets = Tweet.findAllByUserId(userID);
		}
		return tweets;
	}

	public int getTweetConut(){
		if(tweets == null){
			tweets = Tweet.findAllByUserId(userID);
		}
		return tweets.size();
	}
	public int getFollowerConut(){
		
		return findFollowers().size();
	}
	public int getFollowingConut(){
		
		return findFollowings().size();
	}
	
	

}
