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
        
        <link href="table.css" rel="stylesheet" type="text/css" media="screen" />
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <h1 align="center"> Tabela Catalog:</h1>
        <br/>
        <p align="center"><a href="nou_catalog.jsp"><b>Adauga un nou catalog.</b></a> <a href="index.html"><b>Home</b></a></p>
        <%
            jb.connect();
            int aux = java.lang.Integer.parseInt(request.getParameter("idcatalog"));
            String idPupils = request.getParameter("idPupils");
           	String iddisciplines = request.getParameter("iddisciplines");
            String Nota = request.getParameter("nota");
            String Data = request.getParameter("data");
            String[] valori ={idPupils, iddisciplines, Nota, Data};
            String[] campuri = {"idPupils", "iddisciplines", "nota", "data"};
            jb.modificaTabela("catalog", "idcatalog", aux, campuri, valori);
            jb.disconnect();
        %>
        <h1 align="center">Modificarile au fost efectuate !</h1>
        <p align="center">
            <a href="index.html"><b>Home</b></a>
            <br/>
    </body>
</html>
