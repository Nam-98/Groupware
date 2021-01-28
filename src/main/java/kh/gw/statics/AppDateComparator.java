package kh.gw.statics;

import java.sql.Date;
import java.util.Comparator;

import kh.gw.dto.ApprovalDTO;

public class AppDateComparator implements Comparator<ApprovalDTO>{
	@Override
	public int compare(ApprovalDTO app1, ApprovalDTO app2) {
		Date d1 = app1.getApp_reg_date();
		Date d2 = app2.getApp_reg_date();
		return d1.compareTo(d2);
	}
}
