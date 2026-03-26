<%@ page import="java.sql.*" %>
<%@ page import="conexion.conexion" %>
<%
    try {
        conexion con = new conexion();
        Connection cn = con.conectar();
        if (cn != null) {
            out.println("<h2 style='color:green'>? Conexión exitosa a venus_nails</h2>");
            cn.close();
        } else {
            out.println("<h2 style='color:red'>? Conexión fallida</h2>");
        }
    } catch (Exception e) {
        out.println("<h2 style='color:red'>? Error: " + e.getMessage() + "</h2>");
    }
%>
