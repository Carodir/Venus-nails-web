package servlets;

import conexion.conexion;
import modelo.Cita;
import java.io.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;

@WebServlet("/CitaServlet")
public class CitaServlet extends HttpServlet {

    // GET → listar citas
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Cita> lista = new ArrayList<>();
        try {
            Connection cn = new conexion().conectar();
            String sql = "SELECT * FROM citas";
            PreparedStatement ps = cn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Cita c = new Cita();
                c.setIdCita(rs.getInt("id_cita"));
                c.setIdUsuario(rs.getInt("id_usuario"));
                c.setIdServicio(rs.getInt("id_servicio"));
                c.setFecha(rs.getString("fecha"));
                c.setHoraInicio(rs.getString("hora_inicio"));
                c.setHoraFin(rs.getString("hora_fin"));
                c.setEstado(rs.getString("estado"));
                lista.add(c);
            }
            request.setAttribute("listaCitas", lista);
            request.getRequestDispatcher("/vistas/citas/listar.jsp")
                   .forward(request, response);
        } catch (SQLException e) {
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher("/vistas/citas/listar.jsp")
                   .forward(request, response);
        }
    }

    // POST → agendar cita
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        int idUsuario  = Integer.parseInt(request.getParameter("idUsuario"));
        int idServicio = Integer.parseInt(request.getParameter("idServicio"));
        String fecha      = request.getParameter("fecha");
        String horaInicio = request.getParameter("horaInicio");

        try {
            Connection cn = new conexion().conectar();

            // Obtener duración del servicio
            String sqlDuracion = "SELECT duracion FROM servicio WHERE id_servicio = ?";
            PreparedStatement psDuracion = cn.prepareStatement(sqlDuracion);
            psDuracion.setInt(1, idServicio);
            ResultSet rs = psDuracion.executeQuery();
            rs.next();

            // Calcular hora fin
            String sqlHoraFin = "SELECT ADDTIME(?, ?) AS hora_fin";
            PreparedStatement psHoraFin = cn.prepareStatement(sqlHoraFin);
            psHoraFin.setString(1, horaInicio);
            psHoraFin.setString(2, rs.getString("duracion"));
            ResultSet rsHoraFin = psHoraFin.executeQuery();
            rsHoraFin.next();
            String horaFin = rsHoraFin.getString("hora_fin");

            // Insertar cita
            String sql = "INSERT INTO citas (id_usuario, id_servicio, fecha, hora_inicio, hora_fin, estado) VALUES (?,?,?,?,?,'Pendiente')";
            PreparedStatement ps = cn.prepareStatement(sql);
            ps.setInt(1, idUsuario);
            ps.setInt(2, idServicio);
            ps.setString(3, fecha);
            ps.setString(4, horaInicio);
            ps.setString(5, horaFin);
            ps.executeUpdate();
            response.sendRedirect("CitaServlet");
        } catch (SQLException e) {
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher("/vistas/citas/agendar.jsp")
                   .forward(request, response);
        }
    }
}