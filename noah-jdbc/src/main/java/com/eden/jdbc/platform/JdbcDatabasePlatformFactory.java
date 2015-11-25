package com.eden.jdbc.platform;

import java.lang.reflect.Constructor;
import java.util.HashMap;
import java.util.Map;

import javax.sql.DataSource;

import com.eden.jdbc.platform.mssql.MssqlDatabasePlatform;
import com.eden.jdbc.platform.mysql.MysqlDatabasePlatform;
import com.eden.jdbc.platform.oracle.OracleDatabasePlatform;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.eden.jdbc.util.DataSourceConstants;

/**
 * @author shurrik 创建于 2015年6月11日
 */
public class JdbcDatabasePlatformFactory {

	private static final Logger log = LoggerFactory.getLogger(JdbcDatabasePlatformFactory.class);
	
	private static Map<String, Class<? extends IDatabasePlatform>> platforms = new HashMap<String, Class<? extends IDatabasePlatform>>();
	
	static {
		addPlatform(platforms, DataSourceConstants.MYSQL, MysqlDatabasePlatform.class);
		addPlatform(platforms, DataSourceConstants.ORACLE, OracleDatabasePlatform.class);
		addPlatform(platforms, DataSourceConstants.MSSQL, MssqlDatabasePlatform.class);
		
	}
	
    public static synchronized IDatabasePlatform createNewPlatformInstance(String platformName,DataSource dataSource)
            throws Exception {

        Class<? extends IDatabasePlatform> clazz =  findPlatformClass(platformName);

        try {
            Constructor<? extends IDatabasePlatform> construtor = clazz.getConstructor(DataSource.class);
            IDatabasePlatform platform = construtor.newInstance(dataSource);
            log.info("The IDatabasePlatform being used is " + platform.getClass().getCanonicalName());
            return platform;
        } catch (Exception e) {
            throw new Exception("Could not create a platform of type " , e);
        }
    }


    protected static synchronized Class<? extends IDatabasePlatform> findPlatformClass(
            String platformName) throws Exception {
        Class<? extends IDatabasePlatform> platformClass = platforms.get(platformName.toLowerCase());

        if (platformClass == null) {
            throw new Exception("Could not find platform for database " + platformName);
        } else {
            return platformClass;
        }

    }	
	
    private static synchronized void addPlatform(
            Map<String, Class<? extends IDatabasePlatform>> platformMap, String platformName,
            Class<? extends IDatabasePlatform> platformClass) {
        if (!IDatabasePlatform.class.isAssignableFrom(platformClass)) {
            throw new IllegalArgumentException("Cannot register class " + platformClass.getName()
                    + " because it does not implement the " + IDatabasePlatform.class.getName()
                    + " interface");
        }
        platformMap.put(platformName.toLowerCase(), platformClass);
    }
}
