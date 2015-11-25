package com.eden.common.utils.utils;

import java.text.DateFormat;
import java.text.MessageFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Locale;

public class DateUtils {
	
	
	public static String HOUR_FORMAT = "yyyy-MM-dd HH:00:00";
	private static final SimpleDateFormat datetimeFormat = new SimpleDateFormat(
			"yyyy-MM-dd HH:mm:ss");	
	private static final SimpleDateFormat dateFormat = new SimpleDateFormat(
			"yyyy-MM-dd");	

	public static Integer getYear()
	{
	    Calendar cc = Calendar.getInstance();
	    return cc.get(Calendar.YEAR);
	}
	
	public static Integer getMonth()
	{
	    Calendar cc = Calendar.getInstance();
	    return cc.get(Calendar.MONTH)+1;
	}
	
	public static Integer getQuarter()
	{
	    Calendar cc = Calendar.getInstance();
	    Integer month =  cc.get(Calendar.MONTH)+1;
	    if(month<4)
	    {
	    	return 1;
	    }
	    else if(month<7)
	    {
	    	return 2;
	    }
	    else if(month<10)
	    {
	    	return 3;
	    }
	    else
	    {
	    	return 4;
	    }
	}
	
	public static Date getCurHourTime() throws ParseException
	{
		Date dt=new Date();//如果不需要格式,可直接用dt,dt就是当前系统时间
		DateFormat df = new SimpleDateFormat(HOUR_FORMAT);//设置显示格式
		String nowTime="";
		nowTime= df.format(dt);//用DateFormat的format()方法在dt中获取并以yyyy/MM/dd HH:mm:ss格式显示
		
		return df.parse(nowTime);
	}
	
	public static Date incHour(Date date,Integer hour)
	{
		Calendar ca=Calendar.getInstance();
		ca.setTime(date);
		ca.add(Calendar.HOUR_OF_DAY, hour);
		return ca.getTime();
	}
	
	public static Date incCurDateForHour(Integer hour) throws ParseException
	{
		Date curHourTime = getCurHourTime();
	
		return incHour(curHourTime, hour);
	}
	public static String getTimestamp()
	{
//		long cc = new Date().getTime(); 
		String  cc = MessageFormat.format("{0,date,yyyyMMddHHmmss}" ,new Object[]  {new java.sql.Date(System.currentTimeMillis()) });
	    return cc;
	}
	
	


	/**
	 * 获得指定日期的前一天
	 * 
	 * @param specifiedDay
	 * @return
	 * @throws Exception
	 */
	public static String getSpecifiedDayBefore(String specifiedDay) {
		Calendar c = Calendar.getInstance();
		Date date = null;
		try {
			date = new SimpleDateFormat("yy-MM-dd").parse(specifiedDay);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		c.setTime(date);
		int day = c.get(Calendar.DATE);
		c.set(Calendar.DATE, day - 1);

		String dayBefore = new SimpleDateFormat("yyyy-MM-dd").format(c
			.getTime());
		return dayBefore;
	}
	/**
	 * 获得指定日期的前n天
	 * 
	 * @param specifiedDay
	 * @return
	 * @throws Exception
	 */
	public static String getSpecifiedDayBefore(String specifiedDay,int differ) {
		Calendar c = Calendar.getInstance();
		Date date = null;
		try {
			date = new SimpleDateFormat("yy-MM-dd").parse(specifiedDay);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		c.setTime(date);
		int day = c.get(Calendar.DATE);
		c.set(Calendar.DATE, day - differ);

		String dayBefore = new SimpleDateFormat("yyyy-MM-dd").format(c
			.getTime());
		return dayBefore;
	}
	
	/**
	 * 获得指定日期的前n天
	 * 
	 * @param specifiedDay
	 * @return
	 * @throws Exception
	 */
	public static String getSpecifiedDayStrBefore(Date specifiedDay,int differ) {
		String dayBefore = new SimpleDateFormat("yyyy-MM-dd").format(getSpecifiedDayBefore(specifiedDay,differ));
		return dayBefore;
	}
	/**
	 * 获得指定日期的前n天
	 * 
	 * @param specifiedDay
	 * @return
	 * @throws Exception
	 */
	public static Date getSpecifiedDayBefore(Date specifiedDay,int differ) {
		Calendar c = Calendar.getInstance();
		Date date = specifiedDay;
		c.setTime(date);
		int day = c.get(Calendar.DATE);
		c.set(Calendar.DATE, day - differ);
		return c.getTime();
	}
	/**
	 * 获得指定日期的后一天
	 * 
	 * @param specifiedDay
	 * @return
	 */
	public static Date getSpecifiedDayAfter(Date specifiedDay) {
		Calendar c = Calendar.getInstance();

		c.setTime(specifiedDay);
		int day = c.get(Calendar.DATE);
		c.set(Calendar.DATE, day + 1);

		return c.getTime();
	}
	/**
	 * 获得指定日期的后n天
	 * 
	 * @param specifiedDay
	 * @return
	 */
	public static Date getSpecifiedDayAfter(Date specifiedDay,int differ) {
		Calendar c = Calendar.getInstance();

		c.setTime(specifiedDay);
		int day = c.get(Calendar.DATE);
		c.set(Calendar.DATE, day + differ);

		return c.getTime();
	}
	
	/** 取23点59分59秒
	 * @param specifiedDay
	 * @param differ
	 * @return
	 */
	public static Date getSpecifiedDayEndAfter(Date specifiedDay,int differ) {
		Calendar c = Calendar.getInstance();

		c.setTime(specifiedDay);
		int day = c.get(Calendar.DATE);
		c.set(Calendar.DATE, day + differ);
        c.set(Calendar.HOUR_OF_DAY, 23);  
        c.set(Calendar.MINUTE, 59);  
        c.set(Calendar.SECOND, 59);  
        c.set(Calendar.MILLISECOND, 0);

		return c.getTime();
	}	
	
	/**
	 * 得到今天的起始和结束实现
	 * @return
	 */
	public static Date[] getStartAndEndDateForToday() {
		Date[] dates = new Date[2];
		Calendar startCal = calendar();
		setCalendar(startCal, null, null, null, 0, 0, 0, 0);
		Calendar endCal = calendar();
		setCalendar(endCal, null, null, endCal.get(Calendar.DAY_OF_MONTH) + 1, 0 , 0, 0, -1);
		dates[0] = startCal.getTime();
		dates[1] = endCal.getTime();
		return dates;
	}
	
	public static Date[] getStartAndEndDateForSpecialDate(Date specialDate) {
		Date[] dates = new Date[2];
		Calendar startCal = calendar(specialDate);
		setCalendar(startCal, null, null, null, 0, 0, 0, 0);
		Calendar endCal = calendar(specialDate);
		setCalendar(endCal, null, null, endCal.get(Calendar.DAY_OF_MONTH) + 1, 0 , 0, 0, -1);
		dates[0] = startCal.getTime();
		dates[1] = endCal.getTime();
		return dates;
	}	
	
	
	public static Calendar calendar() {
		return calendar(null);
	}
	
	public static Calendar calendar(Date date) {
		Calendar cal = GregorianCalendar.getInstance(Locale.CHINESE);
		if(date!=null)
		{
			cal.setTime(date);
		}
		cal.setFirstDayOfWeek(Calendar.MONDAY);
		return cal;
	}
	
	public static void setCalendar(Calendar cal, Integer year, Integer month, Integer dayOfMonth, Integer hourOfDay, Integer minute, Integer second, Integer millisecond) {
		if(cal == null) {
			throw new IllegalArgumentException("参数 cal[Calendar] 不能为空");
		}
		
		if (year != null) {
	        cal.set(Calendar.YEAR, year);
        }
		if (month != null) {
	        cal.set(Calendar.MONTH, month);
        }
		if (dayOfMonth != null) {
	        cal.set(Calendar.DAY_OF_MONTH, dayOfMonth);
        }
		if (hourOfDay != null) {
	        cal.set(Calendar.HOUR_OF_DAY, hourOfDay);
        }
		if (minute != null) {
	        cal.set(Calendar.MINUTE, minute);
        }
		if (second != null) {
	        cal.set(Calendar.SECOND, second);
        }
		if (millisecond != null) {
	        cal.set(Calendar.MILLISECOND, millisecond);
        }
	}	
	
	public static Date getNowDate(){
		Date nowDate = null;
		String curDate = DateUtils.currentDate();
		try {
			nowDate = DateUtils.parseDate(curDate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return nowDate;
	}	
	
	/**
	 * 获得当前日期
	 * <p>
	 * 日期格式yyyy-MM-dd
	 * 
	 * @return
	 */
	public static String currentDate() {
		return dateFormat.format(now());
	}
	
	
	public static String currentDatetime() {
		return datetimeFormat.format(now());
	}
	
	/**
	 * 获得当前时间的<code>java.util.Date</code>对象
	 * 
	 * @return
	 */
	public static Date now() {
		return new Date();
	}	
	
	
	/**
	 * 将字符串日期转换成java.util.Date类型
	 * <p>
	 * 日期时间格式yyyy-MM-dd
	 * 
	 * @param date
	 * @return
	 * @throws ParseException
	 */
	public static Date parseDate(String date) throws ParseException {
		SimpleDateFormat df = new SimpleDateFormat(
				"yyyy-MM-dd");
		return df.parse(date);
	}	
	
	/**
	 * 得到当前周的开始日期和结束日期，以周一为起始，0是起始日期，1结束日期
	 * @return
	 * @author <p>Innate Solitary 于 2012-3-8 下午12:16:09</p>
	 */
/*	public static Date[] getStartAndEndDateForWeek() {
		Date[] dates = new Date[2];
		Calendar startCalendar = calendar();
		setCalendar(startCalendar, null, null, null, 0, 0, 0, 0);
		startCalendar.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
		Calendar endCalendar = calendar();
		endCalendar.add(endCalendar.get(Calendar.WEEK_OF_MONTH), 1);
		setCalendar(endCalendar, null, endCalendar.get(Calendar.MONDAY), null, 0, 0, 0, -1);
		dates[0] = startCalendar.getTime();
		dates[1] = endCalendar.getTime();
		return dates;
	}	*/
	
	public static Date firstDayOfCurrWeek() {
		Calendar cal = new GregorianCalendar();
		cal.setFirstDayOfWeek(Calendar.MONDAY);
		cal.setTime(Calendar.getInstance().getTime());
		cal.set(Calendar.DAY_OF_WEEK, cal.getFirstDayOfWeek()); // Monday
		cal.set(Calendar.HOUR_OF_DAY, 0);// H置零
		cal.set(Calendar.MINUTE, 0);// m置零
		cal.set(Calendar.SECOND, 0);// s置零
		cal.set(Calendar.MILLISECOND, 0);// S置零
		return cal.getTime();
	}
	

	/**
	 * 获得当前周的最后一天(按照中国习惯，周一为一周的第一天)
	 * <p>
	 * HH:mm:ss SS为零
	 * @return
	 */
	public static Date lastDayOfCurrWeek() {
		Calendar cal = new GregorianCalendar();
		cal.setFirstDayOfWeek(Calendar.MONDAY);
		cal.setTime(Calendar.getInstance().getTime());
		cal.set(Calendar.DAY_OF_WEEK, Calendar.SUNDAY); // sunday
		cal.set(Calendar.HOUR_OF_DAY, 23);// H置零
		cal.set(Calendar.MINUTE, 59);// m置零
		cal.set(Calendar.SECOND, 59);// s置零
		cal.set(Calendar.MILLISECOND, 0);// S置零
		return cal.getTime();
	}	
	
	public static void main(String[] args) throws ParseException {
		
		//获取昨天起始日期
		System.out.println();
	}
}
