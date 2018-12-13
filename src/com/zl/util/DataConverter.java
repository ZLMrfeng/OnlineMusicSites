package com.zl.util;
import org.springframework.core.convert.converter.Converter;



import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;


public class DataConverter implements Converter<String, Date>{

    //�������ڸ�ʽ
    private String dataPattern = "yyyy-MM-dd";

    @Override
    public Date convert(String source) {
        SimpleDateFormat sdf = new SimpleDateFormat(dataPattern);
        try{
            return sdf.parse(source);
        }catch(ParseException e) {
            throw new  IllegalArgumentException("��Ч�����ڸ�ʽ����ʹ�����ָ�ʽ��" + dataPattern);
        }
    }
}
