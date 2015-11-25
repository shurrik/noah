package com.eden.noah.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;



public class HtmlRegexpUtil {
	private final static String regxpForHtml = "<([^>]*)>"; // 过滤所有以<开头以>结尾的标签
	private final static String regxpFornbsp= "&([^;]*);"; // 过滤所有以&开头以;结尾的标签
	
    public static String filterHtml(String str) {   
        Pattern pattern = Pattern.compile(regxpForHtml);   
        Matcher matcher = pattern.matcher(str);   
        StringBuffer sb = new StringBuffer();   
        boolean result1 = matcher.find();   
        while (result1) {   
            matcher.appendReplacement(sb, "");   
            result1 = matcher.find();   
        }   
        matcher.appendTail(sb);   
        return sb.toString();   
    } 	
    public static String filternbsp(String str) {   
        Pattern pattern = Pattern.compile(regxpFornbsp);   
        Matcher matcher = pattern.matcher(str);   
        StringBuffer sb = new StringBuffer();   
        boolean result1 = matcher.find();   
        while (result1) {   
            matcher.appendReplacement(sb, "");   
            result1 = matcher.find();   
        }   
        matcher.appendTail(sb);   
        return sb.toString();   
    } 	
   

}
