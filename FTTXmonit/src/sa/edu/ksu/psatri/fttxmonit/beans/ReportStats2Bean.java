package sa.edu.ksu.psatri.fttxmonit.beans;


public class ReportStats2Bean {
	int statID;
	String componentID;
	int failureCounter;
	int spareCapacity;
	public int getStatID() {
		return statID;
	}
	public void setStatID(int statID) {
		this.statID = statID;
	}
	public String getComponentID() {
		return componentID;
	}
	public void setComponentID(String componentID) {
		this.componentID = componentID;
	}
	public int getFailureCounter() {
		return failureCounter;
	}
	public void setFailureCounter(int failureCounter) {
		this.failureCounter = failureCounter;
	}
	public int getSpareCapacity() {
		return spareCapacity;
	}
	public void setSpareCapacity(int spareCapacity) {
		this.spareCapacity = spareCapacity;
	}
}
