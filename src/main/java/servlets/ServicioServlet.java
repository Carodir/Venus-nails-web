package servlets;

import conexion.conexion;
import modelo.Servicio;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/ServicioServlet")
public class ServicioServlet extends HttpServlet {

    // GET → listar servicios
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Servicio> lista = new ArrayList<>();

        try {
            conexion cn = new conexion();
            Connection con = cn.conectar();
            String sql = "SELECT * FROM servicio";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Servicio s = new Servicio();
                s.setIdServicio(rs.getInt("id_servicio"));
                s.setNombre(rs.getString("nombre"));
                s.setDescripcion(rs.getString("descripcion"));
                s.setDuracion(rs.getString("duracion"));
                s.setPrecio(rs.getDouble("precio"));
                lista.add(s);
            }

            request.setAttribute("listaServicios", lista);
            request.getRequestDispatcher("/vistas/servicios/listar.jsp")
                   .forward(request, response);

        } catch (SQLException e) {
            throw new ServletException("Error al listar servicios", e);
        }
    }

    // POST → agregar servicio
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nombre = request.getParameter("nombre");
        String descripcion = request.getParameter("descripcion");
        String duracion = request.getParameter("duracion");
        double precio = Double.parseDouble(request.getParameter("precio"));

        try {
            conexion cn = new conexion();
            Connection con = cn.conectar();
            String sql = "INSERT INTO servicio (nombre, descripcion, duracion, precio) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, nombre);
            ps.setString(2, descripcion);
            ps.setString(3, duracion);
            ps.setDouble(4, precio);
            ps.executeUpdate();

            response.sendRedirect(request.getContextPath() + "/ServicioServlet");

        } catch (SQLException e) {
            throw new ServletException("Error al agregar servicio", e);
        }
    }
}