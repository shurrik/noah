package com.eden.install.action;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eden.install.util.DbHelper;
import com.eden.install.util.FileUtil;
import com.eden.install.util.InstallSetting;
import com.eden.install.util.StringUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.support.WebApplicationObjectSupport;

import com.eden.noah.util.PageParam;

@Controller
public class InstallAction extends WebApplicationObjectSupport{

	private String jdbc_host;
	private String jdbc_port;
	private String jdbc_url;
	private String jdbc_username;
	private String jdbc_password;
	private String ip;
	private String port;
	private String domain;
	private   Connection conn ;
    private String dataDic;
/*	@RequestMapping(value = "/install/checkConnect.do")
	public ModelAndView checkConnect(
			                    String  jdbc_host ,
								String	jdbc_port ,
								String	jdbc_username,
								String	jdbc_password,
								HttpServletRequest request,
								HttpServletResponse response) throws ClassNotFoundException  {
		ModelAndView mv = new ModelAndView();
		//先执行脚本
		DbHelper dbHelper = new DbHelper(jdbc_host, jdbc_port, jdbc_username, jdbc_password);
		dbHelper.execSql("sql/oatest001.sql");
		int index = 0 ;
		if(conn==null){
		Class.forName("com.mysql.jdbc.Driver");
		String url="jdbc:mysql://"+jdbc_host+":"+jdbc_port+"/oatest001";
		System.out.println(url);
		try {
			conn=DriverManager.getConnection(url, jdbc_username, jdbc_password);
			index =1;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		}
		mv.addObject("Id", index);	
		System.out.println(index);
		return mv;
	}*/
	
	@RequestMapping(value = "/install/checkConnect.do")
	@ResponseBody
	public String checkConnect(
			                    String  jdbc_host ,
								String	jdbc_port ,
								String	jdbc_username,
								String	jdbc_password,
								HttpServletRequest request,
								HttpServletResponse response)  {
		
		String res = "";
		try {
			DbHelper dbHelper = new DbHelper(jdbc_host, jdbc_port, jdbc_username, jdbc_password);
			dbHelper.execSql("sql/oatest.sql");
			res = "succ";
		} catch (Exception e) {
			// TODO: handle exception
			res = "fail";
		}
		
		return res;
	}    
    
/*	@RequestMapping(value = "/install/checkConnect.do")
	@ResponseBody
	public String checkConnect(
			                    String  jdbc_host ,
								String	jdbc_port ,
								String	jdbc_username,
								String	jdbc_password,
								HttpServletRequest request,
								HttpServletResponse response) throws ClassNotFoundException  {
		//先执行脚本
		DbHelper dbHelper = new DbHelper(jdbc_host, jdbc_port, jdbc_username, jdbc_password);
		dbHelper.execSql("sql/oatest001.sql");
		String str="";
		Class.forName("com.mysql.jdbc.Driver");
		String url="jdbc:mysql://"+jdbc_host+":"+jdbc_port+"/oatest001";
		try {
			if(conn==null){
				conn=DriverManager.getConnection(url, jdbc_username, jdbc_password);
			}
			str="str";
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if("str".equals(str)){
			DbHelper dbHelper2 = new DbHelper(jdbc_host, jdbc_port, jdbc_username, jdbc_password);
			dbHelper2.execSql("sql/oatest002.sql");
		}
		return str;
	}*/	
	
	@RequestMapping(value = "/install/step0.do")
	public String step0( ModelMap model,
			PageParam pageParam, HttpServletRequest request,
			HttpServletResponse response) {

		return "/step0";
	}
	
	@RequestMapping(value = "/install/step1.do")
	public String step1(String ip,String port, ModelMap model,
			PageParam pageParam, HttpServletRequest request,
			HttpServletResponse response) {

		this.setIp(ip);
		this.setPort(port);
		this.setDomain(this.createDomain(this.getIp(), this.getPort()));
		model.addAttribute("domain", this.getDomain());
		return "/step1";
	}
	
	@RequestMapping(value = "/install/step2.do") //等待页
	public String step2(String dataDic,String jdbc_host,String jdbc_port,String jdbc_username,String jdbc_password, ModelMap model,HttpServletRequest request,
			HttpServletResponse response) {
		this.setJdbc_host(jdbc_host);
		this.setJdbc_port(jdbc_port);
		this.createJdbcUrl();
		this.setJdbc_url(this.getJdbc_url());
		this.setJdbc_username(jdbc_username);
		this.setJdbc_password(jdbc_password);
		model.addAttribute("domain", this.getDomain());
			if("on".equals(dataDic)){
			model.addAttribute("dataDic_name", "on");
		}else{
			model.addAttribute("dataDic_name", "noon");
		}
		
			
//		if(dataDic=="on"){
//			return "/step2";
//		}else{
//			FileUtil.write(StringUtil.getRootPath()+"/install.lock", "如果要重新安装，请删除此文件，并重新起动web容器");
//			saveMysqlDBParams();
//			InstallSetting.INSTALL_LOCK =true;
//			return "success";
//		}
		return "/step2";
	}
	
	@RequestMapping(value = "/install/test.do") //链接测试
	@ResponseBody
	public String test(HttpServletRequest request,
			HttpServletResponse response) {
		return "true";
	}
	
	@RequestMapping(value = "/install/setup.do") //安装
	@ResponseBody
	public String setup(String dataDic_name, ModelMap model,
			PageParam pageParam, HttpServletRequest request,
			HttpServletResponse response) {
		if("on".equals(dataDic_name)){
			initDb();
		}else{
//			System.out.println("不执行数据字典");
		}
		FileUtil.write(StringUtil.getRootPath() + "/install.lock", "如果要重新安装，请删除此文件，并重新起动web容器");
		saveMysqlDBParams();
		InstallSetting.INSTALL_LOCK =true;
		return "succ";
	}	
	
	@RequestMapping(value = "/install/success.do")
	public String installSucc(ModelMap model,
			PageParam pageParam, HttpServletRequest request,
			HttpServletResponse response) {
		model.addAttribute("domain", this.getDomain());
		return "/success";
	}	
	
	@RequestMapping(value = "/install.do")
	public String install(ModelMap model,
			PageParam pageParam, HttpServletRequest request,
			HttpServletResponse response) {

		if(!InstallSetting.INSTALL_LOCK)
		{
			return "redirect:/install/step0.do";
		}
		else
		{
			return "redirect:/index.html";
		}
	}

	private void saveMysqlDBParams(){
		Properties jdbcProps = new Properties();
		jdbcProps.setProperty("jdbc.url", this.getJdbc_url());
		jdbcProps.setProperty("jdbc.username", this.getJdbc_username());
		jdbcProps.setProperty("jdbc.password", this.getJdbc_password());		
		saveJdbcProperties(jdbcProps);
		
		Properties sysProps = new Properties();
		sysProps.setProperty("system.wwwroot",this.getDomain());
		saveSysProperties(sysProps);		
	}
	public  Connection getConn(String url,String user,String password){
		if(conn==null){
		try {
		Class.forName("com.mysql.jdbc.Driver");
		conn=DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		}
		}
		return conn;
		}
	private String createDomain(String ip,String port)
	{
		String domain = "";
		if(port.equals("80"))
		{
			domain = "http://"+this.getIp()+"/civiloa";
		}
		else
		{
			domain = "http://"+this.getIp()+":"+this.getPort()+"/civiloa";
		}
		return domain;
	}
	
	private void initDb()
	{
		DbHelper dbHelper = new DbHelper(this.getJdbc_host(), this.getJdbc_port(), this.getJdbc_username(), this.getJdbc_password());
		dbHelper.execSql("sql/oa_init20150423.sql");
/*		DbHelper dbHelper = new DbHelper(this.getJdbc_host(), this.getJdbc_port(), this.getJdbc_username(), this.getJdbc_password());
		dbHelper.execSql("sql/1.sql");
		dbHelper = new DbHelper(this.getJdbc_host(), this.getJdbc_port(), this.getJdbc_username(), this.getJdbc_password());
		dbHelper.execSql("sql/2.sql");*/		
	}
	
	private void saveJdbcProperties(Properties props){
		try {
			String path = StringUtil.getRootPath("jdbc.properties");
			File file  = new File(path);
    		props.store(new FileOutputStream(file), "jdbc.properties");
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	private void saveSysProperties(Properties props){
		try {
			String path = StringUtil.getRootPath("system.properties");
			File file  = new File(path);
    		props.store(new FileOutputStream(file), "system.properties");
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private String createJdbcUrl()
	{
		String jdbc_url = "jdbc:mysql://"+this.getJdbc_host()+":"+this.getJdbc_port()+"/oa?characterEncoding=UTF-8&amp;autoReconnect=true";
		this.setJdbc_url(jdbc_url);
		return jdbc_url;
	}
	
	public String getJdbc_host() {
		return jdbc_host;
	}

	public void setJdbc_host(String jdbc_host) {
		this.jdbc_host = jdbc_host;
	}

	public String getJdbc_port() {
		return jdbc_port;
	}

	public void setJdbc_port(String jdbc_port) {
		this.jdbc_port = jdbc_port;
	}

	public String getJdbc_url() {
		return jdbc_url;
	}

	public void setJdbc_url(String jdbc_url) {
		this.jdbc_url = jdbc_url;
	}

	public String getJdbc_username() {
		return jdbc_username;
	}

	public void setJdbc_username(String jdbc_username) {
		this.jdbc_username = jdbc_username;
	}

	public String getJdbc_password() {
		return jdbc_password;
	}

	public void setJdbc_password(String jdbc_password) {
		this.jdbc_password = jdbc_password;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public String getPort() {
		return port;
	}

	public void setPort(String port) {
		this.port = port;
	}

	public String getDomain() {
		return domain;
	}

	public void setDomain(String domain) {
		this.domain = domain;
	}
	public Connection getConn() {
		return conn;
	}
	public void setConn(Connection conn) {
		this.conn = conn;
	}

	public String getDataDic() {
		return dataDic;
	}

	public void setDataDic(String dataDic) {
		this.dataDic = dataDic;
	}	

}
