package sa.edu.ksu.psatri.fttxmonit.beans;

import java.util.Date;

public class ReportStatsBean {
	int statID;
	Date statMounth;
	String statComponentTypeName;
	int statNumber;
	public int getStatID() {
		return statID;
	}
	public void setStatID(int statID) {
		this.statID = statID;
	}
	public Date getStatMounth() {
		return statMounth;
	}
	public void setStatMounth(Date statMounth) {
		this.statMounth = statMounth;
	}
	public String getStatComponentTypeName() {
		return statComponentTypeName;
	}
	public void setStatComponentTypeName(String statComponentTypeName) {
		this.statComponentTypeName = statComponentTypeName;
	}
	public int getStatNumber() {
		return statNumber;
	}
	public void setStatNumber(int statNumber) {
		this.statNumber = statNumber;
	}
}
