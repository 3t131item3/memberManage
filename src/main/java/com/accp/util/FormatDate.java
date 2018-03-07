package com.accp.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * String和Date转换的工具类
 */
public class FormatDate {
    /**
     * String转Date
     * @return
     */
    public static Date formatDate(String date){
        try {
          return   new SimpleDateFormat("yyyy-MM-dd").parse(date);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return null;
    }
}
