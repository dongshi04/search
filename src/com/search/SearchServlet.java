package com.search;

import net.sf.json.JSONArray;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class SearchServlet extends HttpServlet {

    static List<String> testDatas = new ArrayList<>();
    static{
        testDatas.add("ajax");
        testDatas.add("php");
        testDatas.add("java");
        testDatas.add("mysql");
        testDatas.add("ajax1");
        testDatas.add("php1");
        testDatas.add("java1");
        testDatas.add("mysql1");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("utf-8");
        String keyword = request.getParameter("keyword");

        List<String> listData = getDatas(keyword);
//        System.out.println("list:"+listData);
//        System.out.println(JSONArray.fromObject(listData));
//        response.getWriter().write(listData.toString());
        response.getWriter().write(JSONArray.fromObject(listData).toString());

    }

    public List<String> getDatas(String keyword){
        List<String> list = new ArrayList<>();
        for(String data:testDatas){
            if(data.contains(keyword)){
                list.add(data);
            }
        }
        return list;
    }
}
