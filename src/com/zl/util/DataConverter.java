package com.zl.util;
import org.springframework.core.convert.converter.Converter;



import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;


public class DataConverter implements Converter<String, Date>{

    //定义日期格式
    private String dataPattern = "yyyy-MM-dd";

    @Override
    public Date convert(String source) {
        SimpleDateFormat sdf = new SimpleDateFormat(dataPattern);
        try{
            return sdf.parse(source);
        }catch(ParseException e) {
            throw new  IllegalArgumentException("无效的日期格式，请使用这种格式：" + dataPattern);
        }
    }
}
