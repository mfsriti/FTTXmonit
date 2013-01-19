package sa.edu.ksu.psatri.fttxmonit.beans;

import java.util.Date;

public class CFailureBean {
	boolean valid;
	int failureID;
	Date failureDate;
	String failureType;
	String componentID;
	ComponentBean component = null;
	public boolean isValid() {
		return valid;
	}
	public void setValid(boolean valid) {
		this.valid = valid;
	}
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
	public ComponentBean getComponent() {
		return component;
	}
	public void setComponent(ComponentBean component) {
		this.component = component;
	}
	
}
