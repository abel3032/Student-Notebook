<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Adauga Discipline</title>
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
        input[type="text"], input[type="submit"] {
            margin: 5px;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            background-color: #007bff; /* albastru */
            border: none;
            color: white;
            cursor: pointer;
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
            String Disciplina = request.getParameter("Disciplina");
            String PuncteCredit = request.getParameter("puncte_credit");
            String TipCalificativ = request.getParameter("tip_calificativ");
            if (Disciplina != null) {
                jb.connect();
                jb.adaugaDisciplina(Disciplina, PuncteCredit, TipCalificativ);
                jb.disconnect();
        %>
        <p>Datele au fost adaugate.</p><%
        } else {
        %>
        <h1> Suntem in tabela Discipline.</h1>
        <form action="nou_disciplina.jsp" method="post">
            <table>
                <tr>
                    <td align="right">Nume Disciplina:</td>
                    <td> <input type="text" name="Disciplina" size="40" /></td>
                </tr>
                <tr>
                    <td align="right">Puncte de credit:</td>
                    <td> <input type="text" name="puncte_credit" size="30" /></td>
                </tr>
                <tr>
                    <td align="right">Tip Calificativ:</td>
                    <td> <input type="text" name="tip_calificativ" size="30" /></td>
                </tr>
            </table>
            <input type="submit" value="Adauga disciplina" />
        </form>
        <%
            }
        %>
        <br/>
        <a href="index.html"><b>Home</b></a>
        <br/>
    </body>
</html>
