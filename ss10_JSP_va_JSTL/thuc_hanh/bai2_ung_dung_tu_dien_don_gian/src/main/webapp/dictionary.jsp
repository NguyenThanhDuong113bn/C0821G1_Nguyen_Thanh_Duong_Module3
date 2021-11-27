<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %><%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 10/5/2021
  Time: 4:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Simple Dictionary</title>
</head>
<body>
<%!
    Map<String, String> dic = new HashMap<>();
%>

<%
    dic.put("hello", "Xin chào");
    dic.put("how", "Thế nào");
    dic.put("book", "Quyển vở");
    dic.put("computer", "Máy tính");
    String search = request.getParameter("search");
    String result = dic.get(search);
    if (result != null) {
        out.println("Word: " + search + "<br>");
        out.println("Result: " + result);
    } else {
        out.println("Not found");
    }
%>

</body>
</html>