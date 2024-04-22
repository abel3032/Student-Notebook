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
    </style>
        <link href="table.css" rel="stylesheet" type="text/css" media="screen" />
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <h1 align="center"> Tabela Discipline:</h1>
        <br/>
        <p align="center"><a href="nou_disciplina.jsp"><b>Adauga o noua disciplina.</b></a> <a href="index.html"><b>Home</b></a></p>
        <%
            jb.connect();
            int aux = java.lang.Integer.parseInt(request.getParameter("iddisciplines"));
            String Disciplina = request.getParameter("Disciplina");
            String PuncteCredit = request.getParameter("puncte_credit");
            String TipCalificativ = request.getParameter("tip_calificativ");

            String[] valori = {Disciplina, PuncteCredit, TipCalificativ};
            String[] campuri = {"Disciplina", "puncte_credit", "tip_calificativ"};
            jb.modificaTabela("disciplines", "iddisciplines", aux, campuri, valori);
            jb.disconnect();
        %>
        <h1 align="center">Modificarile au fost efectuate !</h1>
        <p align="center">
            <a href="index.html"><b>Home</b></a>
            <br/>
    </body>
</html>
