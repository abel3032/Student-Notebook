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
        <h1 align="center">Tabela Catalog:</h1>
        <br/>
        <p align="center"><a href="nou_catalog.jsp"><b>Adauga un nou catalog.</b></a> <a href="index.html"><b>Home</b></a></p>
        <%
            jb.connect();
            String NumeStudent, PrenumeStudent, NumeTata, NumarTelefon, NumeDisciplina, PuncteCredit, TipCalificativ, Nota, Date;

            int aux = java.lang.Integer.parseInt(request.getParameter("primarykey"));
            ResultSet rs = jb.intoarceCatalogId(aux);
            rs.first();
            int id1 = rs.getInt("idPupils");
            int id2 = rs.getInt("idDisciplines");

            NumeStudent = rs.getString("Nume");
            PrenumeStudent = rs.getString("Prenume");
            NumeTata = rs.getString("nume_tata");
            NumarTelefon = rs.getString("numar_telefon");
            NumeDisciplina = rs.getString("Disciplina");
            PuncteCredit = rs.getString("puncte_credit");
            TipCalificativ = rs.getString("tip_calificativ");
            Nota = rs.getString("nota");
            Date= rs.getString("data");

            ResultSet rs1 = jb.vedeTabela("pupils");
            ResultSet rs2 = jb.vedeTabela("disciplines");
            int idstudent, iddisciplina;


        %>
        <form action="m2_catalog.jsp" method="post">
            <table align="center">
                <tr>
                    <td align="right">IdCatalog:</td>
                    <td> <input type="text" name="idcatalog" size="30" value="<%= aux%>" readonly/></td>
                </tr>
                <tr>
                    <td align="right">Student:</td>
                    <td> 
                        <SELECT NAME="idPupils">
                            <%
                                while (rs1.next()) {
                                    idstudent = rs1.getInt("idPupils");
                                    NumeStudent = rs1.getString("Nume");
                                    PrenumeStudent = rs1.getString("Prenume");
                                    NumeTata = rs1.getString("nume_tata");
                                    NumarTelefon = rs1.getString("numar_telefon");
                                    if (idstudent != id1) {
                            %>
                            <OPTION VALUE="<%= idstudent%>"><%= idstudent%>, <%= NumeStudent%>, <%= PrenumeStudent%>, <%= NumeTata%>, <%= NumarTelefon%></OPTION>
                                <%
                                        } else {
                                %>                
                            <OPTION selected="yes" VALUE="<%= idstudent%>"><%= idstudent%>, <%= NumeStudent%>, <%= PrenumeStudent%>, <%= NumeTata%>, <%= NumarTelefon%></OPTION>
                                <%
                                        }
                                    }
                                %>
                        </SELECT>

                    </td>
                </tr>
                <tr>
                    <td align="right">Disciplina:</td>
                    <td> 
                        <SELECT NAME="iddisciplines">
                            <%
                                while (rs2.next()) {
                                    iddisciplina = rs2.getInt("iddisciplines");
                                    NumeDisciplina = rs2.getString("Disciplina");
                                    PuncteCredit = rs2.getString("puncte_credit");
                                    TipCalificativ = rs2.getString("tip_calificativ");
                            if (iddisciplina != id2) {
                            %>
                            <OPTION VALUE="<%= iddisciplina%>"><%= iddisciplina%>, <%= NumeDisciplina%>, <%= PuncteCredit%>, <%= TipCalificativ%></OPTION>
                                <%
                                        } else {
                                %>                
                            <OPTION selected="yes" VALUE="<%= iddisciplina%>"><%= iddisciplina%>, <%= NumeDisciplina%>, <%= PuncteCredit%>, <%= TipCalificativ%></OPTION>
                                <%
                                        }
                                    }
                                %>
                        </SELECT>

                    </td>
                </tr>
                <tr>
                    <td align="right">Nota:</td>
                    <td> <input type="text" name="nota" size="30" value="<%= Nota%>"/></td>
                </tr>
                <tr>
                    <td align="right">Data:</td>
                    <td> <input type="text" name="data" size="30" value="<%= Date%>"/></td>
                </tr>
            </table><p align="center">
                <input type="submit" value="Modifica linia">
            </p>
        </form>
        <p align="center">
            <a href="index.html"><b>Home</b></a>
            <br/>
    </body>
    <%
        rs.close();
        rs1.close();
        rs2.close();
        jb.disconnect();
    %>
</html>
