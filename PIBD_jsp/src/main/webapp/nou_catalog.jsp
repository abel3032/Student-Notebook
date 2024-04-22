<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Adauga catalog</title>
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
        form {
            text-align: center;
            margin: 20px auto;
            width: 50%;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        table {
            margin: 0 auto;
            border-collapse: collapse;
            width: 100%;
        }
        td, th {
            padding: 10px;
            border: 1px solid #ddd;
        }
        input[type="text"] {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
            margin-top: 5px;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 12px 20px;
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
            margin-top: 10px;
            text-decoration: none;
            color: #333;
        }
    </style>
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <%
            int idstudent, iddisciplina;
            String id1, id2, NumeStudent, PrenumeStudent, NumeTata, NumarTelefon, NumeDisciplina, PuncteCredit, TipCalificativ, Nota, Data;
            id1 = request.getParameter("iddisciplines");
            id2 = request.getParameter("idPupils");
            
            Nota = request.getParameter("nota");
            Data = request.getParameter("data");
            if (id1 != null) {
                jb.connect();
                jb.adaugaCatalog(java.lang.Integer.parseInt(id1), java.lang.Integer.parseInt(id2), Nota, Data);
                jb.disconnect();
        %>
        <p>Datele au fost adaugate.</p><%
        } else {
        jb.connect();
        ResultSet rs1 = jb.vedeTabela("pupils");
        ResultSet rs2 = jb.vedeTabela("disciplines");
        %>
        <h1> Suntem in tabela catalog.</h1>
        <form action="nou_catalog.jsp" method="post">
            <table>
                <tr>
                    <td align="right">Student:</td>
                    <td> 
                        Selectati studentul:
			<SELECT NAME="idPupils">
                                <%
                                    while(rs1.next()){
                                        idstudent = rs1.getInt("idPupils");
                                        NumeStudent = rs1.getString("Nume");
                                        PrenumeStudent = rs1.getString("Prenume");
                                        NumeTata = rs1.getString("nume_tata");
                                        NumarTelefon = rs1.getString("numar_telefon");
                                %>
                                    <OPTION VALUE="<%= idstudent%>"><%= idstudent%>,<%= NumeStudent%>,<%= PrenumeStudent%>,<%= NumeTata%>, <%= NumarTelefon%></OPTION>
                                <%
                                    }
                                %>
			</SELECT>
                    
                    </td>
                </tr>
                <tr>
                    <td align="right">Disciplina:</td>
                    <td> 
                        Selectati disciplina:
			<SELECT NAME="iddisciplines">
				<!-- OPTION selected="yes" VALUE="iris1">Iris 1</OPTION -->
                                <%
                                    while(rs2.next()){
                                        iddisciplina = rs2.getInt("iddisciplines");
                                        NumeDisciplina = rs2.getString("Disciplina");
                                        PuncteCredit = rs2.getString("puncte_credit");
                                        TipCalificativ = rs2.getString("tip_calificativ");
                                %>
                                    <OPTION VALUE="<%= iddisciplina%>"><%= iddisciplina%>,<%= NumeDisciplina%>,<%= PuncteCredit%>,<%= TipCalificativ%></OPTION>
                                <%
                                    }
                                %>
			</SELECT>
                     </td>
                </tr>
                <tr>
                    <td align="right">Nota catalog:</td>
                    <td> <input type="text" name="nota" size="30" /></td>
                </tr>
                <tr>
                    <td align="right">Data:</td>
                    <td> <input type="text" name="data" size="30" /></td>
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
