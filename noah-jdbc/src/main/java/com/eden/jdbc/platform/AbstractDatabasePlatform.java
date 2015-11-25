package com.eden.jdbc.platform;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;

/**
 * @author shurrik 创建于 2015年6月11日
 */
public class AbstractDatabasePlatform implements IDatabasePlatform{
	
    protected DataSource dataSource;

    protected JdbcTemplate jdbcTemplate;


    public AbstractDatabasePlatform(DataSource dataSource) {
        this.dataSource = dataSource;
        this.jdbcTemplate = createJdbcTemplate();
    }
    
    protected JdbcTemplate createJdbcTemplate() {
        return new JdbcTemplate(dataSource); 
    }

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}
}
