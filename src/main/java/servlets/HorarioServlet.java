package servlets;

import conexion.conexion;
import modelo.Horario;
import java.io.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;

@WebServlet("/HorarioServlet")
public class HorarioServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Horario> lista = new ArrayList<>();
        try {
            Connection cn = new conexion().conectar();
            String sql = "SELECT * FROM horario_disponible";
            PreparedStatement ps = cn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Horario h = new Horario();
                h.setIdHorario(rs.getInt("id_horario"));
                h.setIdUsuario(rs.getInt("id_usuario"));
                h.setDiaSemana(rs.getString("dia_semana"));
                h.setHoraInicio(rs.getString("hora_inicio"));
                h.setHoraFin(rs.getString("hora_fin"));
                lista.add(h);
            }
            request.setAttribute("listaHorarios", lista);
            request.getRequestDispatcher("/vistas/horarios/listar.jsp")
                   .forward(request, response);
        } catch (SQLException e) {
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher("/vistas/horarios/listar.jsp")
                   .forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        int idUsuario      = Integer.parseInt(request.getParameter("idUsuario"));
        String diaSemana   = request.getParameter("diaSemana");
        String horaInicio  = request.getParameter("horaInicio");
        String horaFin     = request.getParameter("horaFin");

        try {
            Connection cn = new conexion().conectar();
            String sql = "INSERT INTO horario_disponible (id_usuario, dia_semana, hora_inicio, hora_fin) VALUES (?,?,?,?)";
            PreparedStatement ps = cn.prepareStatement(sql);
            ps.setInt(1, idUsuario);
            ps.setString(2, diaSemana);
            ps.setString(3, horaInicio);
            ps.setString(4, horaFin);
            ps.executeUpdate();
            response.sendRedirect(request.getContextPath() + "/HorarioServlet");
        } catch (SQLException e) {
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher("/vistas/horarios/agregar.jsp")
                   .forward(request, response);
        }
    }
}