package components;

public class UrlComposer {
	public static String getSimpleUrl(String baseUrl, String action){
		return getSimpleUrl(baseUrl, action, null);
	}
	public static String getSimpleUrl(String baseUrl, String action, String[][] args){
		StringBuilder str = new StringBuilder();
		str.append(baseUrl).append("?");
		str.append("action=").append(action);
		if(args != null){
			for(String[] s : args){
				str.append("&");
				str.append(s[0]);
				str.append("=");
				str.append(s[1]);
			}
		}
		return str.toString();
	}
}
