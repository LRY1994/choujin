package com.bap.timeglider;

public class EventData {
	private String id;
	private String title;
	private String startdate;
	private String enddate;
	private String icon;
	private String importance;
	private String description;
	
	public void setId(String id){
		this.id=id;
	}
	public void setTitle(String x){
		this.title=x;
	}
	public void setStartdate(String x){
		this.startdate=x;
	}
	
	public void setEnddate(String x){
		this.enddate=x;
	}
	public void setIcon(String x){
		this.icon=x;
	}
	public void setImportance(String x){
		this.importance=x;
	}
	public void setDescription(String x){
		this.description=x;
	}
	public String getId(){
		return this.id;
	}
	
	public String getTitle(){
		return this.title;
	}
	public String getStartdate(){
		return this.startdate;
	}
	public String getEnddate(){
		return this.enddate;
	}
	public String getIcon(){
		return this.icon;
	}
	
	public String getImportance(){
		return this.importance;
	}
	public String getDescription(){
		return this.description;
	}

}
