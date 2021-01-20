package statics;

import java.sql.Date;

public class CommonConfigurator {
	public static Date getSysdate() {
		Date sysdate = new Date(new java.util.Date().getTime());
		System.out.println(sysdate);
		return sysdate;
	}
}
