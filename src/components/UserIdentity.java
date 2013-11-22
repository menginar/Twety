package components;

import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.interfaces.RSAPrivateKey;
import java.security.interfaces.RSAPublicKey;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.RSAPrivateKeySpec;
import java.security.spec.RSAPublicKeySpec;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.User;


public class UserIdentity {
	public static final String Password = "1029384756";
	public static final char[] SALTSTR = "ABCÇDEFGĞHIİJKLMNOÖPRSŞTUÜXWQVYZabcçdefgğhıijklmnoöprsştuüxwqvyz1234567890".toCharArray();
	public static final String ACCESTOKEN = "accestoken";
	
	
	private String createSalt(int i){
		StringBuilder str = new StringBuilder();
		Random gen = new Random();
		gen.nextInt();
		for(;i>0;i--){			
			str.append(SALTSTR[gen.nextInt(SALTSTR.length)]);
		}
		return str.toString();
	}
	private String createAccesTokenByUser(User user){
		StringBuilder str = new StringBuilder();
		str.append(createSalt(35));
		str.append("<");
		str.append(user.getUserID());
		str.append("↑");
		str.append(user.getPassword());
		str.append(">");
		str.append(createSalt(35));

		try {
			/*
			KeyFactory keyFactory = KeyFactory.getInstance("RSA");
			RSAPublicKey pubKey = (RSAPublicKey) keyFactory.generatePublic(pubKeySpec);
		    Cipher cipher = Cipher.getInstance("RSA/None/NoPadding");
		    cipher.init(Cipher.ENCRYPT_MODE, pubKey);
		    */
			return new String(str.toString());
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	private User createUserByAccesToken(String accestoken){
		String str = null;
		try{
			/*
		    KeyFactory keyFactory = KeyFactory.getInstance("RSA");
		    RSAPrivateKey privKey = (RSAPrivateKey) keyFactory.generatePrivate(privKeySpec);
		    Cipher cipher = Cipher.getInstance("RSA/None/NoPadding");
		    cipher.init(Cipher.DECRYPT_MODE, privKey);
			 */
		    str = new String(accestoken);
		} catch (Exception e) {
			
			e.printStackTrace();
			return null;
		}
			
	    str = str.substring(str.indexOf('<')+1, str.indexOf('>'));
	    String[] couple = str.split("↑");
	    int userId = Integer.parseInt(couple[0]);
	    String password = couple[1];
	    return  authenticateUserId(userId, password);
	    
	}
	
	private User  authenticateUserId(int userid, String password){
		User user = User.findById(userid);
		if(user != null && user.getPassword().compareTo(password)==0) {
			return user;	
		}
		return null;	
	}
	private User  authenticateUserName(String username, String password){
		User user = User.findByUserName(username);
		if(user != null && user.getPassword().compareTo(password)==0) {
			return user;	
		}
		return null;
	}
	
	public boolean authenticateUserWithCookie(HttpServletResponse response, String username, String password){
		User user = authenticateUserName(username, password);
		if(user != null) {
			try {
				setCookie(response, UserIdentity.ACCESTOKEN, URLEncoder.encode(createAccesTokenByUser(user), "UTF-8") );
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return true;
		}
		return false;		
	}
	public void logout(HttpServletResponse response){
		killCookie(response, UserIdentity.ACCESTOKEN, "false");
	}
	
	public boolean isAuthenticate(HttpServletRequest request){
		return getAuthenticateUser(request) != null;
	}
	public User getAuthenticateUser(HttpServletRequest request){
		Cookie[] cookies = request.getCookies();     
		if(cookies != null){
			for(int i = 0; i < cookies.length; i++){ 
				Cookie c = cookies[i];
				if (c.getName().equals(ACCESTOKEN)){
					try {
						return createUserByAccesToken(URLDecoder.decode(c.getValue(), "UTF-8"));
					} catch (UnsupportedEncodingException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
		}
		return null;
	}
	
	private void setCookie(HttpServletResponse response, String cookieName, String value){
		Cookie c = new Cookie(cookieName, value);
		c.setMaxAge(24*60*60);
		response.addCookie(c); 
	}
	private void killCookie(HttpServletResponse response, String cookieName, String value){
		Cookie c = new Cookie(cookieName, value);
		c.setMaxAge(0);
		response.addCookie(c); 
	};
}
