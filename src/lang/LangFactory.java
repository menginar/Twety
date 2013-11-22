package lang;

public class LangFactory {
	public static final String TURKISH = "tr";
	public static LangPack getLangPack(String lang){
		if(lang == null)
			return new LangPackTr();
		switch (lang){
			case TURKISH:
				return new LangPackTr();
			default:
				return new LangPackTr();
		}
	}
}
