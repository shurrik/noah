package com.eden.jdbc.platform;

import org.springframework.jdbc.core.JdbcTemplate;

/**
 * @author shurrik 创建于 2015年6月11日
 */
public interface IDatabasePlatform {
	
//	public JdbcTemplate getJdbcTemplate(DataSource ds);
	public JdbcTemplate getJdbcTemplate();

}
