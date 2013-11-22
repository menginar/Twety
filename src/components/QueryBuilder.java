package components;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class QueryBuilder {
	StringBuilder str;
	List<String> types = Arrays.asList(new String[] {"select","insert", "update", "delete"});
	int type;
	String tableName;
	public QueryBuilder(String typeStr, String table){
		type = types.indexOf(typeStr);
		tableName = table;
	}

}
