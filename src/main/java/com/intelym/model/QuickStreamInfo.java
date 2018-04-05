package com.intelym.model;

import java.io.Serializable;  


public class QuickStreamInfo implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -4995998145666715366L;
	private Integer qxId;
	private String qxName;
	private Boolean recStatus;
	private String description;
	private String urlPath;
	
	
	public Integer getQxId() {
		return qxId;
	}
	public void setQxId(Integer qxId) {
		this.qxId = qxId;
	}
	public String getQxName() {
		return qxName;
	}
	public void setQxName(String qxName) {
		this.qxName = qxName;
	}
	public Boolean getRecStatus() {
		return recStatus;
	}
	public void setRecStatus(Boolean recStatus) {
		this.recStatus = recStatus;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getUrlPath() {
		return urlPath;
	}
	public void setUrlPath(String urlPath) {
		this.urlPath = urlPath;
	}
	
	public QuickStreamInfo(){
		
	}
	public QuickStreamInfo(Integer qxId, String qxName, Boolean recStatus, String description, String urlPath) {
		super();
		this.qxId = qxId;
		this.qxName = qxName;
		this.recStatus = recStatus;
		this.description = description;
		this.urlPath = urlPath;
	}
	@Override
	public String toString() {
		return "QuickStreamInfo [qxId=" + qxId + ", qxName=" + qxName + ", recStatus=" + recStatus + ", description="
				+ description + ", urlPath=" + urlPath + "]";
	}
	
}
