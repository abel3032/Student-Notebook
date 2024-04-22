<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Discipline</title>
        <style>
        body {
            margin: 0;
            padding: 0;
            background-color: #add8e6; /* baby blue */
            font-family: Arial, sans-serif;
            color: #000000; /* font color black */
        }
        p, a {
            text-align: center;
            color: #000000; /* font color black */
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.5); /* umbra subtila */
        }
        input[type="submit"] {
            background-color: #007bff; /* albastru */
            border: none;
            color: white;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            cursor: pointer;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }
        input[type="submit"]:hover {
            background-color: #0056b3; /* albastru mai inchis la hover */
        }
    </style>
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <%
            String[] s = request.getParameterValues("primarykey");
            jb.connect();
            jb.stergeDateTabela(s, "disciplines", "iddisciplines");
            jb.disconnect();
        %>
        <p align="center">
            <a href="index.html"><b>Home</b></a>
            <br/>
        </p>
    </body>
</html>
