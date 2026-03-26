package servlets;

import conexion.conexion;
import modelo.Resena;
import java.io.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;

@WebServlet("/ResenaServlet")
public class ResenaServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Resena> lista = new ArrayList<>();
        try {
            Connection cn = new conexion().conectar();
            String sql = "SELECT * FROM reseña";
            PreparedStatement ps = cn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Resena r = new Resena();
                r.setIdResena(rs.getInt("id_resena"));
                r.setIdUsuario(rs.getInt("id_usuario"));
                r.setComentario(rs.getString("comentario"));
                r.setCalificacion(rs.getInt("calificacion"));
                r.setFecha(rs.getString("fecha"));
                lista.add(r);
            }
            request.setAttribute("listaResenas", lista);
            request.getRequestDispatcher("/vistas/resenas/listar.jsp")
                   .forward(request, response);
        } catch (SQLException e) {
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher("/vistas/resenas/listar.jsp")
                   .forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        int idUsuario      = Integer.parseInt(request.getParameter("idUsuario"));
        String comentario  = request.getParameter("comentario");
        int calificacion   = Integer.parseInt(request.getParameter("calificacion"));
        String fecha       = request.getParameter("fecha");

        try {
            Connection cn = new conexion().conectar();
            String sql = "INSERT INTO reseña (id_usuario, comentario, calificacion, fecha) VALUES (?,?,?,?)";
            PreparedStatement ps = cn.prepareStatement(sql);
            ps.setInt(1, idUsuario);
            ps.setString(2, comentario);
            ps.setInt(3, calificacion);
            ps.setString(4, fecha);
            ps.executeUpdate();
            response.sendRedirect("ResenaServlet");
        } catch (SQLException e) {
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher("/vistas/resenas/agregar.jsp")
                   .forward(request, response);
        }
    }
}