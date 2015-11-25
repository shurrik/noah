package com.eden.noah.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class MD5Util {
//	  @SuppressWarnings("restriction")
//	 public static String MD5(String str) throws NoSuchAlgorithmException, UnsupportedEncodingException{
//		//确定计算方法
//		        MessageDigest md5=MessageDigest.getInstance("MD5");
//				sun.misc.BASE64Encoder base64en = new BASE64Encoder();
//		//加密后的字符串
//				String newstr=base64en.encode(md5.digest(str.getBytes("utf-8")));
//		return newstr;
//		    }
	  
	 public static String MD5(String plainText) {
	        String re_md5 = new String();
	        try {
	            MessageDigest md = MessageDigest.getInstance("MD5");
	            md.update(plainText.getBytes());
	            byte b[] = md.digest();
	 
	            int i;
	 
	            StringBuffer buf = new StringBuffer("");
	            for (int offset = 0; offset < b.length; offset++) {
	                i = b[offset];
	                if (i < 0)
	                    i += 256;
	                if (i < 16)
	                    buf.append("0");
	                buf.append(Integer.toHexString(i));
	            }
	 
	            re_md5 = buf.toString();
	 
	        } catch (NoSuchAlgorithmException e) {
	            e.printStackTrace();
	        }
	        return re_md5;
	    }
	  
	 
//	 public static void main(String[] args) throws NoSuchAlgorithmException, UnsupportedEncodingException {  
//		    Md5PasswordEncoder md5 = new Md5PasswordEncoder();  
//		    System.out.println( md5.encodePassword("123", "lwl"));  //40d5a21e3e504368fcde4043179ed2c9
//	        System.out.println(MD5("123"));
//	        System.out.println(checkpassword("123","ICy5YqxZB1uWSwcVLSNLcA=="));
//		 try {
//			   if (!(new File("D:/newdata/nxy/").isDirectory())) {
//			    new File("D:/newdata/nxy/").mkdir();
//			   }
//			  } catch (SecurityException e) {
//			   e.printStackTrace();
//			  }
//	    } 
}
