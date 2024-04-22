<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Catalog</title>
        <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f2f2f2;
        }
        h1 {
            text-align: center;
        }
        table {
            border-collapse: collapse;
            width: 80%;
            margin: 20px auto;
        }
        th, td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }
        th {
            background-color: #f2f2f2;
        }
        form {
            text-align: center;
        }
        input[type="submit"] {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        a {
            display: inline-block;
            margin: 10px;
            text-decoration: none;
            color: #333;
        }
    </style>
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <h1 align="center"> Tabela Catalog:</h1>
        <br/>
        <p align="center"><a href="nou_catalog.jsp"><b>Adauga un nou catalog.</b></a> <a href="index.html"><b>Home</b></a></p>
        <form action="m1_catalog.jsp" method="post">
            <table border="1" align="center">
                <tr>
                    <td><b>Mark:</b></td>
                    <td><b>IdCatalog:</b></td>
                    <td><b>IdStudent:</b></td>
                    <td><b>NumeStudent:</b></td>
                    <td><b>PrenumeStudent:</b></td>
                    <td><b>Numele Tatalui:</b></td>
                    <td><b>Numar de Telefon:</b></td>
                    <td><b>IdDisciplina:</b></td>
                    <td><b>NumeDisciplina:</b></td>
                    <td><b>Puncte de Credit:</b></td>
                    <td><b>TipCalificativ:</b></td>
                    <td><b>Nota:</b></td>
                    <td><b>Data:</b></td>
                </tr>
                <%
                    jb.connect();
                    ResultSet rs = jb.vedeCatalog();
                    long x;
                    while (rs.next()) {
                        x = rs.getInt("idcatalog");
                %>
                <tr>
                    <td><input type="checkbox" name="primarykey" value="<%= x%>" /></td><td><%= x%></td>
                    <td><%= rs.getInt("idPupils")%></td>
                    <td><%= rs.getString("Nume")%></td>
                    <td><%= rs.getString("Prenume")%></td>
                    <td><%= rs.getString("nume_tata")%></td>
                    <td><%= rs.getString("numar_telefon")%></td>
                    <td><%= rs.getInt("iddisciplines")%></td>
                    <td><%= rs.getString("Disciplina")%></td>
                    <td><%= rs.getString("puncte_credit")%></td>
                    <td><%= rs.getString("tip_calificativ")%></td>
                    <td><%= rs.getString("nota")%></td>
                    <td><%= rs.getString("data")%></td>
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
