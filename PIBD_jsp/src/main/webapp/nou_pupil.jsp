<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Adauga student</title>
        <style>
        body {
            margin: 0;
            padding: 0;
            background-color: #add8e6; /* baby blue */
            font-family: Arial, sans-serif;
            color: #000000; /* font color black */
        }
        p, h1, form, table, td, input, a {
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
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <%
            String Nume = request.getParameter("Nume");
            String Prenume = request.getParameter("Prenume");
            String NumeTata = request.getParameter("nume_tata");
            String NumarTelefon = request.getParameter("numar_telefon");
            if (Nume != null) {
                jb.connect();
                jb.adaugaStudent(Nume, Prenume, NumeTata, NumarTelefon);
                jb.disconnect();
        %>
        <p>Datele au fost adaugate.</p><%
        } else {
        %>
        <h1> Suntem in tabela Student.</h1>
        <form action="nou_pupil.jsp" method="post">
            <table>
                <tr>
                    <td align="right">Nume Student:</td>
                    <td> <input type="text" name="Nume" size="40" /></td>
                </tr>
                <tr>
                    <td align="right">Prenume Student:</td>
                    <td> <input type="text" name="Prenume" size="30" /></td>
                </tr>
                <tr>
                    <td align="right">Numele Tatalui:</td>
                    <td> <input type="text" name="nume_tata" size="30" /></td>
                </tr>
                <tr>
                    <td align="right">Numar de Telefon:</td>
                    <td> <input type="text" name="numar_telefon" size="30" /></td>
                </tr>
            </table>
            <input type="submit" value="Adauga studentul" />
        </form>
        <%
            }
        %>
        <br/>
        <a href="index.html"><b>Home</b></a>
        <br/>
    </body>
</html>

