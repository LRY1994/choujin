/**
 * 
 */
/**
 * @author Administrator
 *
 */
package com.bap.timeglider;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.sql.Array;
import java.sql.ResultSet;



import java.sql.SQLException;
import java.util.ArrayList; 
import java.util.HashMap; 
import java.util.List; 
import java.util.Map; 

import net.sf.json.JSONArray; 
import net.sf.json.JSONObject; 

import com.bap.comn.MySQLHelper;

public class DataHelper{
	private  MySQLHelper mysql;
	public DataHelper(){
		 mysql=new MySQLHelper();
	}
	
	public JSONArray getPlanData() throws SQLException{
		String sql="select A.SCHEDULE_ID,B.ITEM_NAME,A.MONTH, A.START_DATE ,A.END_DATE"
	                +"   FROM JW_FEE_PLAN_SCHEDULE  A,JW_FEE_ITEM_INFO B "
				    +"   WHERE A.ITEM_ID=B.ITEM_ID";
		System.out.println(sql);
		
		List<EventData> li=new ArrayList<EventData>();
	     ResultSet rs=mysql.Query(sql); 
	    
	   while(rs.next()){
		   EventData obj=new EventData();
	    	 obj.setId(rs.getString(1));
	    	 obj.setTitle(rs.getString(2)+" "+rs.getString(3));
	    	 obj.setDescription("项目名称："+rs.getString(2)+"\n结算账期："+rs.getString(3));
	    	 obj.setStartdate(rs.getDate(4).toString());
	    	 obj.setEnddate(rs.getDate(5).toString());
	    	 obj.setIcon("triangle_red.png");
	    	 obj.setImportance("40");
	    	 li.add(obj);
	    	 
	     }
	     JSONArray arr= JSONArray.fromObject(li); 
	    
	     return arr;
	     }
	
	public  JSONArray getFactData() throws SQLException{
		String sql="select A.SCHEDULE_ID, D.USER_NAME, C.ITEM_NAME, B.MONTH,"
				 +"  A.START_DATE ,  A.END_DATE "
				 +"  FROM "
				 +"  JW_FEE_ACTUAL_SCHEDULE  A, JW_FEE_PLAN_SCHEDULE B,"
				 +"  JW_FEE_ITEM_INFO C, JW_USER_INFO D"
				 +"  WHERE A.PLAN_SCHEDULE_ID=B.SCHEDULE_ID"
				 +"  AND A.PARNER_INTERFACE_ID=D.USER_ID"
				 +"  AND B.ITEM_ID=C.ITEM_ID ";
		ResultSet rs=mysql.Query(sql);
		//System.out.println(sql);
		
		List<EventData> li=new ArrayList<EventData>();
	     while(rs.next()){
	    	 if(rs.getDate(5)==null){
	    		 continue;
	    	 }
	    	 EventData obj=new EventData();
	    	 obj.setId(rs.getString(1));
	    	 obj.setTitle(rs.getString(2)+":"+rs.getString(3)+" "+rs.getString(4));
	    	 obj.setDescription("开发商："+rs.getString(2)+"\n酬金名称："+rs.getString(3)+"\n结算账期："+rs.getString(4));
	    	 obj.setStartdate(rs.getDate(5).toString());
	    	 obj.setEnddate(rs.getDate(6).toString());
	    	 obj.setIcon("triangle_green.png");
	    	 obj.setImportance("40");
	    	 li.add(obj);
	     }
	     JSONArray arr= JSONArray.fromObject(li); 
	  
		return arr;
	} 
	
	public  String getJson() throws SQLException{
		
		JSONObject json=new JSONObject();
		json.put("presentation","Timeglider");
		json.put("title","东莞公司酬金出账进度管理");
		json.put("focus_date","2016-02-02 00:00:00");
		String[] arr={"fact", "plan"};
		json.put("initial_timelines",arr);
		
		JSONObject aa=new JSONObject();
		aa.put("id", "fact");
		aa.put("title" , "计划进度");
		aa.put("inverted",true);
		aa.put("bottom",200);
		JSONArray plandata=getPlanData();//
		
		aa.put("events", plandata);
		
		JSONObject bb=new JSONObject();
		bb.put("id", "plan");
		bb.put("title" , "实际进度");
		bb.put("inverted",true);
		bb.put("bottom",255);
		JSONArray factdata=getFactData();
		
		bb.put("events", factdata);
		
		List<JSONObject> list=new ArrayList<JSONObject>();
		list.add(aa);
		list.add(bb);
		json.put("timelines", list);
	
		//System.out.print(json.toString());
		return json.toString();
	
}
		public String createFile() throws SQLException, Exception{					
			String path;
			path=this.getClass().getResource("").getPath();///F:/中国移动实习/apache-tomcat-8.0.36/webapps/HelloWorld/WEB-INF/classes/com/bap/timeglider/
			int a = path.indexOf("WEB-INF");
			path = path.substring(0, a)+"json/";
			
			File dir=new File(path);
			File tmp=File.createTempFile("data", ".json",dir);						
			 tmp.deleteOnExit();
			 FileOutputStream stream;
			 OutputStreamWriter writer;
			 stream = new FileOutputStream(tmp);
			 writer = new OutputStreamWriter(stream,"UTF-8");

			 String json=getJson();	
			 writer.write(json);
			 writer.close();
		

			String returnPath = tmp.getName();
			
			System.out.println("returnPath = "+returnPath);
			return returnPath;
		}
}