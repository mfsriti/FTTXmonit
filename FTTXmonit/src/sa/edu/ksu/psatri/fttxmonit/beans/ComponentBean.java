package sa.edu.ksu.psatri.fttxmonit.beans;

import java.util.List;

public class ComponentBean {
	String componentID;
	String componentTypeName; // get it from ComponentTypes table using FK ComponentTypeID 
	int componentSignature;
	String areaID; //An Area is merged with the FDT, so this attribute define the related FDT 
	String parentID;
	String address;
	String quarterNames;
	float latitude;
	float longitude;
	int coordX;
	int coordY;
	int size;
	float distanceFromOLT;
	int[][] sLDPoints; 
	float[][] gPSPoints; 
	int sldPosition; // this attribute indicates the angle of the rotation of the component when it will be drawn in the SLD, 
	                 // it should be computed from the predecessor sldpoints
	ComponentBean parent;
	List<ComponentBean> predecessors = null;
	
	public String getComponentID() {
		return componentID;
	}
	public void setComponentID(String componentID) {
		this.componentID = componentID;
	}
	public String getComponentTypeName() {
		return componentTypeName;
	}
	public void setComponentTypeName(String componentTypeName) {
		this.componentTypeName = componentTypeName;
	}
	public int getComponentSignature() {
		return componentSignature;
	}
	public void setComponentSignature(int componentSignature) {
		this.componentSignature = componentSignature;
	}
	public String getAreaID() {
		return areaID;
	}
	public void setAreaID(String areaID) {
		this.areaID = areaID;
	}
	public String getParentID() {
		return parentID;
	}
	public void setParentID(String parentID) {
		this.parentID = parentID;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getQuarterNames() {
		return quarterNames;
	}
	public void setQuarterNames(String quarterNames) {
		this.quarterNames = quarterNames;
	}
	public float getLatitude() {
		return latitude;
	}
	public void setLatitude(float latitude) {
		this.latitude = latitude;
	}
	public float getLongitude() {
		return longitude;
	}
	public void setLongitude(float longitude) {
		this.longitude = longitude;
	}
	public int getCoordX() {
		return coordX;
	}
	public void setCoordX(int coordX) {
		this.coordX = coordX;
	}
	public int getCoordY() {
		return coordY;
	}
	public void setCoordY(int coordY) {
		this.coordY = coordY;
	}
	public int getSize() {
		return size;
	}
	public void setSize(int size) {
		this.size = size;
	}
	public float getDistanceFromOLT() {
		return distanceFromOLT;
	}
	public void setDistanceFromOLT(float distanceFromOLT) {
		this.distanceFromOLT = distanceFromOLT;
	}
	public int[][] getSLDPoints() {
		return sLDPoints;
	}
	public void setSLDPoints(int[][] sLDPoints) {
		this.sLDPoints = sLDPoints;
	}
	public float[][] getGPSPoints() {
		return gPSPoints;
	}
	public void setGPSPoints(float[][] gPSPoints) {
		this.gPSPoints = gPSPoints;
	}
	public int getSldPosition() {
		return sldPosition;
	}
	public void setSldPosition(int sldPosition) {
		this.sldPosition = sldPosition;
	}
	public ComponentBean getParent() {
		return parent;
	}
	public void setParent(ComponentBean parent) {
		this.parent = parent;
	}
	public List<ComponentBean> getPredecessors() {
		return predecessors;
	}
	public void setPredecessors(List<ComponentBean> predecessors) {
		this.predecessors = predecessors;
	}
	
}
