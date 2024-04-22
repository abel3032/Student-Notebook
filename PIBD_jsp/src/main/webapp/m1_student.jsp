<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Studenti</title>
        <style>
        <style>
        body {
            margin: 0;
            padding: 0;
            background-color: #add8e6; /* baby blue */
            font-family: Arial, sans-serif;
            color: #000000; /* font color black */
        }
        h1, p, form, table, td, input, a {
            text-align: center;
            color: #000000; /* font color black */
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.5); /* umbra subtila */
        }
        input[type="text"], input[type="submit"] {
            margin: 5px;
            padding: 5px;
            border-radius: 5px;
            border: 1px solid #000000; /* border color black */
        }
        input[type="submit"] {
            background-color: #add8e6; /* baby blue */
            color: #000000; /* font color black */
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #87ceeb; /* light sky blue */
        }
    </style>
        </head>
        <link href="table.css" rel="stylesheet" type="text/css" media="screen" />
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <h1 align="center">Tabela Studenti:</h1>
        <br/>
        <p align="center"><a href="nou_pupil.jsp"><b>Adauga un nou student.</b></a> <a href="index.html"><b>Home</b></a></p>
        <%
            jb.connect();
            int aux = java.lang.Integer.parseInt(request.getParameter("primarykey"));
            ResultSet rs = jb.intoarceLinieDupaId("pupils", "idPupils", aux);
            rs.first();
            String Nume = rs.getString("Nume");
            String Prenume = rs.getString("Prenume");
            String NumeTata = rs.getString("nume_tata");
            String NumarTelefon = rs.getString("numar_telefon");
            rs.close();
            jb.disconnect();
        %>
        <form action="m2_student.jsp" method="post">
            <table align="center">
                <tr>
                    <td align="right">IdStudent:</td>
                    <td> <input type="text" name="idPupils" size="30" value="<%= aux%>" readonly/></td>
                </tr>
                <tr>
                    <td align="right">Nume:</td>
                    <td> <input type="text" name="Nume" size="30" value="<%= Nume%>"/></td>
                </tr>
                <tr>
                    <td align="right">Prenume:</td>
                    <td> <input type="text" name="Prenume" size="30" value="<%= Prenume%>"/></td>
                </tr>
                <tr>
                    <td align="right">NumeTata:</td>
                    <td> <input type="text" name="nume_tata" size="30" value="<%= NumeTata%>"/></td>
                </tr>
                <tr>
                    <td align="right">NumarTelefon:</td>
                    <td> <input type="text" name="numar_telefon" size="30" value="<%= NumarTelefon%>"/></td>
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
