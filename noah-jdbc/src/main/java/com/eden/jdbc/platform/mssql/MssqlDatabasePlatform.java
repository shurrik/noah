package com.eden.jdbc.platform.mssql;

import javax.sql.DataSource;

import com.eden.jdbc.platform.AbstractDatabasePlatform;

/**
 * @author shurrik 创建于 2015年6月15日
 */
public class MssqlDatabasePlatform extends AbstractDatabasePlatform{

	public MssqlDatabasePlatform(DataSource dataSource) {
		super(dataSource);
	}

}
