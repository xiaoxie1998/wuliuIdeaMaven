package com.wuliu.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

/*
 * 日期格式yyyy-MM-dd HH:mm:ss 转换器
 */
@Component
public class DateFormat implements Converter<String, Date>{

	@Override
	public Date convert(String time) {
		try {
			if (time=="") //日期为空
				return null;
			Date date;
			if(time.indexOf(":")>-1)
				date=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(time);
			else
				date=new SimpleDateFormat("yyyy-MM-dd").parse(time);
			System.out.println("日期正确");
			return date;
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("如期错误");
		}
		return null;
	}

}
