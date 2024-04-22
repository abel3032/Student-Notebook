<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Studenti</title>
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
        <link href="table.css" rel="stylesheet" type="text/css" media="screen" />
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <h1 align="center"> Tabela Studenti:</h1>
        <br/>
        <p align="center"><a href="nou_pupil.jsp"><b>Adauga un nou student.</b></a> <a href="index.html"><b>Home</b></a></p>
        <%
            jb.connect();
            int aux = java.lang.Integer.parseInt(request.getParameter("idPupils"));
            String Nume = request.getParameter("Nume");
            String Prenume = request.getParameter("Prenume");
            String NumeTata = request.getParameter("nume_tata");
            String NumarTelefon = request.getParameter("numar_telefon");

            String[] valori = {Nume, Prenume, NumeTata, NumarTelefon};
            String[] campuri = {"Nume", "Prenume", "nume_tata", "numar_telefon"};
            jb.modificaTabela("pupils", "idPupils", aux, campuri, valori);
            jb.disconnect();
        %>
        <h1 align="center">Modificarile au fost efectuate !</h1>
        <p align="center">
            <a href="index.html"><b>Home</b></a>
            <br/>
    </body>
</html>
