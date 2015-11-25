package com.eden.jdbc.platform.oracle;

import javax.sql.DataSource;

import com.eden.jdbc.platform.AbstractDatabasePlatform;

/**
 * @author shurrik 创建于 2015年6月15日
 */
public class OracleDatabasePlatform extends AbstractDatabasePlatform{

	public OracleDatabasePlatform(DataSource dataSource) {
		super(dataSource);
	}

}
