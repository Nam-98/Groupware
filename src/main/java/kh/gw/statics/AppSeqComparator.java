package kh.gw.statics;

import java.util.Comparator;

import kh.gw.dto.ApprovalDTO;

public class AppSeqComparator implements Comparator<ApprovalDTO>{
	@Override
	public int compare(ApprovalDTO app1, ApprovalDTO app2) {
		return app1.getApp_seq() < app1.getApp_seq() ? -1 : app1.getApp_seq() > app2.getApp_seq() ? 1:0;
	}
}
