package sa.edu.ksu.psatri.fttxmonit.beans;

import java.util.List;
import java.util.Map;

public class UserBean {
	String username; // int
	String password;
	String title;
	String fullname;
	String mobile;
	String office;
	int groupid;
	
	String groupname; 
	Map<String, List<String>> actionList;
	public boolean valid;
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getGroupname() {
		return groupname;
	}
	public void setGroupname(String groupname) {
		this.groupname = groupname;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getOffice() {
		return office;
	}
	public void setOffice(String office) {
		this.office = office;
	}
	public boolean isValid() {
		return valid;
	}
	public void setValid(boolean valid) {
		this.valid = valid;
	}
	
	public int getGroupid() {
		return groupid;
	}
	public void setGroupid(int groupid) {
		this.groupid = groupid;
	}
	public Map<String, List<String>> getActionList() {
		return actionList;
	}
	public void setActionList(Map<String, List<String>> actionList) {
		this.actionList = actionList;
	}
	
}
