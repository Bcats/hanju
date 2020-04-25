package cn.bcat.hanju.util;

import java.util.regex.Pattern;

public class IString {

    public static String convertToStr(String pinying){
        if (pinying.equals("hj"))return "韩剧";
        if (pinying.equals("zy"))return "综艺";
        if (pinying.equals("dy"))return "电影";
        return "韩剧";
    }

    public static String replace(String keyword,String s) {
        Pattern p = Pattern.compile(keyword);
        return p.matcher(s).replaceAll("<font color=\"red\"><strong>"+keyword+"</strong></font>");
    }

    public static String trueReplace(String keyword,String replaced,String s){
        Pattern p = Pattern.compile(keyword);
        return p.matcher(s).replaceAll(replaced);
    }

    //取前后缀中间内容
    public static String getInsideString(String base,String prefix,String suffix){
        int startIndex;
        int endIndex;

        if (base.indexOf(prefix)==-1){
            return null;
        }
        if (base.indexOf(suffix)==-1){
            return null;
        }

        startIndex = base.indexOf( prefix ) + prefix.length();
        endIndex = base.indexOf( suffix , startIndex );

        return base.substring( startIndex , endIndex );
    }
}
