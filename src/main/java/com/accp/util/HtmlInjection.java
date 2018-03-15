package com.accp.util;

public class HtmlInjection {
    /**
     * 防html注入
     * @param html
     * @return
     */
    public static String htmlToString(String html){
        String ms=html;

        ms=ms.replaceAll("&","＆");
        ms=ms.replaceAll("<","&lt;");
        ms=ms.replaceAll(">","&gt;");
        return ms;
    }
}
