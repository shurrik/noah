package com.eden.jdbc.platform.mysql;

import javax.sql.DataSource;

import com.eden.jdbc.platform.AbstractDatabasePlatform;

/**
 * @author shurrik 创建于 2015年6月11日
 */
public class MysqlDatabasePlatform extends AbstractDatabasePlatform{

	public MysqlDatabasePlatform(DataSource dataSource) {
		super(dataSource);
	}

}
