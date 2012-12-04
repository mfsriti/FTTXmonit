package sa.edu.ksu.psatri.fttxmonit.beans;

public class GroupBean {
	int groupID; // INTEGER AUTO_INCREMENT
	String groupName; // VARCHAR(30)
	public int getGroupID() {
		return groupID;
	}
	public void setGroupID(int groupID) {
		this.groupID = groupID;
	}
	public String getGroupName() {
		return groupName;
	}
	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}	
}
