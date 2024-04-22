<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Discipline</title>
        <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            color: #333;
            margin: 0;
            padding: 0;
        }
        h1 {
            text-align: center;
            margin-top: 20px;
        }
        p {
            text-align: center;
            margin-bottom: 20px;
        }
        form {
            text-align: center;
        }
        table {
            margin: auto;
        }
    </style>
        <link href="table.css" rel="stylesheet" type="text/css" media="screen" />
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <h1 align="center">Tabela Discipline:</h1>
        <br/>
        <p align="center"><a href="nou_disciplina.jsp"><b>Adauga o noua disciplina.</b></a> <a href="index.html"><b>Home</b></a></p>
        <%
            jb.connect();
            int aux = java.lang.Integer.parseInt(request.getParameter("primarykey"));
            ResultSet rs = jb.intoarceLinieDupaId("disciplines", "iddisciplines", aux);
            rs.first();
            String Disciplina = rs.getString("Disciplina");
            String PuncteCredit = rs.getString("puncte_credit");
            String TipCalificativ = rs.getString("tip_calificativ");
            rs.close();
            jb.disconnect();
        %>
        <form action="m2_disciplina.jsp" method="post">
            <table align="center">
                <tr>
                    <td align="right">IdDisciplina:</td>
                    <td> <input type="text" name="iddisciplines" size="30" value="<%= aux%>" readonly/></td>
                </tr>
                <tr>
                    <td align="right">Disciplina:</td>
                    <td> <input type="text" name="Disciplina" size="30" value="<%= Disciplina%>"/></td>
                </tr>
                <tr>
                    <td align="right">Puncte Credit:</td>
                    <td> <input type="text" name="puncte_credit" size="30" value="<%= PuncteCredit%>"/></td>
                </tr>
                <tr>
                    <td align="right">Tip Calificativ:</td>
                    <td> <input type="text" name="tip_calificativ" size="30" value="<%= TipCalificativ%>"/></td>
                </tr>
            </table><p align="center">
                <input type="submit" value="Modifica linia">
            </p>
        </form>
        <p align="center">
            <a href="index.html"><b>Home</b></a>
            <br/>
    </body>
</html>
