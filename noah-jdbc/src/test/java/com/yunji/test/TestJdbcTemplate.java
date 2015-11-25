package com.yunji.test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.SingleConnectionDataSource;

import com.eden.jdbc.platform.IDatabasePlatform;
import com.eden.jdbc.platform.JdbcDatabasePlatformFactory;
import com.eden.jdbc.util.DataSourceConstants;

/**
 * @author lp 创建于 2015年6月11日
 */
public class TestJdbcTemplate{

/*    @Test
    public void testSimpleSqlScript() throws Exception {
        SingleConnectionDataSource ds = getDataSource();
        
        IDatabasePlatform mysqlDatabasePlatform = JdbcDatabasePlatformFactory.createNewPlatformInstance(DataSourceConstants.MYSQL, ds);
        String sql = "select * from t_oa_roleresource";
        JdbcTemplate jdbcTemplate = mysqlDatabasePlatform.getJdbcTemplate();
        List<Map<String,Object>> list = jdbcTemplate.queryForList(sql);
        for(Map item:list)
        {
        	System.out.println(item.get("role_name"));
        }
        ds.destroy();
    }*/
	
//    @Test
//    public void testSimpleSqlScript() throws Exception {
//
//    	for(int i=0;i<10000;i++)
//    	{
//    		testScript();
//    	}
//    }
    
    private void testScript() throws Exception
    {
        SingleConnectionDataSource ds = getDataSource();
        
        IDatabasePlatform mysqlDatabasePlatform = JdbcDatabasePlatformFactory.createNewPlatformInstance(DataSourceConstants.MYSQL, ds);
        String sql = "select * from t_oa_roleresource";
        JdbcTemplate jdbcTemplate = mysqlDatabasePlatform.getJdbcTemplate();
        List<Map<String,Object>> list = jdbcTemplate.queryForList(sql);
        for(Map item:list)
        {
        	System.out.println(item.get("role_name"));
        }
//        jdbcTemplate.getDataSource().getConnection().close();
        ds.destroy();
    }
    
    private SingleConnectionDataSource getDataSource() throws Exception {
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://127.0.0.1:3306/oa";
        String user= "root";
        String password = "root";
        Connection c = DriverManager.getConnection(url, user, password);
        
        return new SingleConnectionDataSource(c, true);
    }
}
