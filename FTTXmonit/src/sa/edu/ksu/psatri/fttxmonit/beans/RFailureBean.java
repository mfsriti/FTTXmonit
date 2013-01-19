package sa.edu.ksu.psatri.fttxmonit.beans;

import java.util.Date;

public class RFailureBean {
	int failureID;
	Date failureDate;
	String failureType;
	String componentID;
	int resolverID;
	Date autoRepairDate;
	Date techRepairDate;
	public int getFailureID() {
		return failureID;
	}
	public void setFailureID(int failureID) {
		this.failureID = failureID;
	}
	public Date getFailureDate() {
		return failureDate;
	}
	public void setFailureDate(Date failureDate) {
		this.failureDate = failureDate;
	}
	public String getFailureType() {
		return failureType;
	}
	public void setFailureType(String failureType) {
		this.failureType = failureType;
	}
	public String getComponentID() {
		return componentID;
	}
	public void setComponentID(String componentID) {
		this.componentID = componentID;
	}
	public int getResolverID() {
		return resolverID;
	}
	public void setResolverID(int resolverID) {
		this.resolverID = resolverID;
	}
	public Date getAutoRepairDate() {
		return autoRepairDate;
	}
	public void setAutoRepairDate(Date autoRepairDate) {
		this.autoRepairDate = autoRepairDate;
	}
	public Date getTechRepairDate() {
		return techRepairDate;
	}
	public void setTechRepairDate(Date techRepairDate) {
		this.techRepairDate = techRepairDate;
	}
}
