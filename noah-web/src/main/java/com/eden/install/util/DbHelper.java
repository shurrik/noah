package com.eden.install.util;

import java.io.File;

import org.apache.tools.ant.Project;
import org.apache.tools.ant.taskdefs.SQLExec;
import org.apache.tools.ant.types.EnumeratedAttribute;

public class DbHelper {

/*	private String driver = "com.mysql.jdbc.Driver";
	private String url = "jdbc:mysql://127.0.0.1:3306/oa";
	private String user = "root";
	private String password = "102030";
	private Connection con;*/
	
	private String driver = "com.mysql.jdbc.Driver";
	private String dbHost;
	private String dbPort;
	private String dbUsername;
	private String dbPassword;
	
//	@Override
//	public void afterPropertiesSet() throws ClassNotFoundException,
//			SQLException {
////		Class.forName(driver);
////		con = DriverManager.getConnection(url, user, password);
////		List<String> tablename = new ArrayList<String>();
////		DatabaseMetaData meta = con.getMetaData();
////		ResultSet rs = null;
////		rs = meta.getTables(null, null, null, new String[] { "TABLE" });
////		while (rs.next()) {
////			if (rs.getString(3).equals("t_oa_user")) {
////				System.out.println("有呢");
////				return;
////			} else {
////				antinput();
////				return;
////			}
////		}
//	}
	
	public DbHelper(String dbHost,String dbPort,String dbUsername,String dbPassword) {

		this.setDbHost(dbHost);
		this.setDbPort(dbPort);
		this.setDbUsername(dbUsername);
		this.setDbPassword(dbPassword);
	}	

	private String getDbUrl()
	{
//		String url = "jdbc:mysql://"+this.getDbHost()+":"+this.getDbPort()+"?useUnicode=true&characterEncoding=utf-8";
		String url = "jdbc:mysql://"+this.getDbHost()+":"+this.getDbPort()+"?characterEncoding=UTF-8&amp;autoReconnect=true";
		return url;
	}
	
	public void execSql(String sqlFile) {
		SQLExec sqlExec = new SQLExec();
		sqlExec.setDriver(driver);
		sqlExec.setUrl(getDbUrl());
		sqlExec.setUserid(this.getDbUsername());
		sqlExec.setPassword(this.getDbPassword());
		
		sqlExec.setEncoding("utf8");
		
//		String path = StringUtil.getRootPath("sql/oa_init20150423.sql");
		String path = StringUtil.getRootPath(sqlFile);
		sqlExec.setSrc(new File(path));// 要执行的脚本
		// 有出错的语句该如何处理
		sqlExec.setOnerror((SQLExec.OnError) (EnumeratedAttribute.getInstance(
				SQLExec.OnError.class, "abort")));
		sqlExec.setPrint(true); // 设置是否输出
		// 输出到文件 sql.out 中；不设置该属性，默认输出到控制台
//		sqlExec.setOutput(new File(StringUtil.getRootPath("sql/sql.out")));
		sqlExec.setProject(new Project()); // 要指定这个属性，不然会出错
		sqlExec.setAutocommit(true);
		sqlExec.setCaching(false);
		sqlExec.execute();
		System.out.println("OK");
	}	
	
/*	public void execSql() {
		SQLExec sqlExec = new SQLExec();
		sqlExec.setDriver(driver);
		sqlExec.setUrl(getDbUrl());
		sqlExec.setUserid(this.getDbUsername());
		sqlExec.setPassword(this.getDbPassword());
		
		sqlExec.setEncoding("utf8");
		
		String path = StringUtil.getRootPath("sql/oa_init20150423.sql");
		sqlExec.setSrc(new File(path));// 要执行的脚本
		// 有出错的语句该如何处理
		sqlExec.setOnerror((SQLExec.OnError) (EnumeratedAttribute.getInstance(
				SQLExec.OnError.class, "abort")));
		sqlExec.setPrint(true); // 设置是否输出
		// 输出到文件 sql.out 中；不设置该属性，默认输出到控制台
//		sqlExec.setOutput(new File(StringUtil.getRootPath("sql/sql.out")));
		sqlExec.setProject(new Project()); // 要指定这个属性，不然会出错
		sqlExec.setAutocommit(true);
		sqlExec.setCaching(false);
		sqlExec.execute();
		System.out.println("OK");
	}*/

	public String getDriver() {
		return driver;
	}

	public void setDriver(String driver) {
		this.driver = driver;
	}

	public String getDbHost() {
		return dbHost;
	}

	public void setDbHost(String dbHost) {
		this.dbHost = dbHost;
	}

	public String getDbPort() {
		return dbPort;
	}

	public void setDbPort(String dbPort) {
		this.dbPort = dbPort;
	}

	public String getDbUsername() {
		return dbUsername;
	}

	public void setDbUsername(String dbUsername) {
		this.dbUsername = dbUsername;
	}

	public String getDbPassword() {
		return dbPassword;
	}

	public void setDbPassword(String dbPassword) {
		this.dbPassword = dbPassword;
	}
	
}
