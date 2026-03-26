package servlets;

import conexion.conexion;
import java.io.*;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;

@WebServlet("/CancelarCitaServlet")
public class CancelarCitaServlet extends HttpServlet {

    // GET → mostrar formulario cancelar
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/vistas/citas/cancelar.jsp")
               .forward(request, response);
    }

    // POST → cancelar cita
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        int idCita = Integer.parseInt(request.getParameter("idCita"));

        try {
            Connection cn = new conexion().conectar();
            String sql = "UPDATE citas SET estado = 'Cancelada' WHERE id_cita = ?";
            PreparedStatement ps = cn.prepareStatement(sql);
            ps.setInt(1, idCita);
            ps.executeUpdate();
            response.sendRedirect("CitaServlet");
        } catch (SQLException e) {
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher("/vistas/citas/cancelar.jsp")
                   .forward(request, response);
        }
    }
}