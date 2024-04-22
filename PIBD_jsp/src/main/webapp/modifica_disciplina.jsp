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
        h1, p, a {
            text-align: center;
            color: #000000; /* font color black */
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.5); /* umbra subtila */
        }
        table {
            border-collapse: collapse;
            width: 80%;
            margin: 0 auto;
        }
        th, td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #007bff; /* albastru */
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2; /* gri deschis pentru randuri pare */
        }
        input[type="submit"] {
            margin: 10px;
            padding: 10px 20px;
            background-color: #007bff; /* albastru */
            border: none;
            color: white;
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
        <h1 align="center"> Tabela Discipline:</h1>
        <br/>
        <p align="center"><a href="nou_disciplina.jsp"><b>Adauga o noua disciplina.</b></a> <a href="index.html"><b>Home</b></a></p>
        <form action="m1_disciplina.jsp" method="post">
            <table border="1" align="center">
                <tr>
                    <td><b>Mark:</b></td>
                    <td><b>IdDisciplina:</b></td>
                    <td><b>Disciplina:</b></td>
                    <td><b>PuncteCredit:</b></td>
                    <td><b>TipCalificativ:</b></td>
                </tr>
                <%
                    jb.connect();
                    ResultSet rs = jb.vedeTabela("disciplines");
                    long x;
                    while (rs.next()) {
                        x = rs.getLong("iddisciplines");
                %>
                <tr>
                    <td><input type="checkbox" name="primarykey" value="<%= x%>" /></td>
                    <td><%= x%></td>
                    <td><%= rs.getString("Disciplina")%></td>
                    <td><%= rs.getString("puncte_credit")%></td>
                    <td><%= rs.getString("tip_calificativ")%></td>
                    <%
                        }
                    %>
                </tr>
            </table><br/>
            <p align="center">
                <input type="submit" value="Modifica linia">
            </p>
        </form>
        <%
    jb.disconnect();%>
        <br/>
        <p align="center">
            <a href="index.html"><b>Home</b></a>
            <br/>
        </p>
    </body>
</html>
