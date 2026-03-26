package servlets;

import conexion.conexion;
import modelo.Usuario;
import java.io.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;

@WebServlet("/UsuarioServlet")
public class UsuarioServlet extends HttpServlet {

    // GET → listar usuarios
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Usuario> lista = new ArrayList<>();
        try {
            Connection cn = new conexion().conectar();
            String sql = "SELECT * FROM usuario";
            PreparedStatement ps = cn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Usuario u = new Usuario();
                u.setIdUsuario(rs.getInt("id_usuario"));
                u.setNombre(rs.getString("nombre"));
                u.setApellido(rs.getString("apellido"));
                u.setCorreo(rs.getString("correo"));
                u.setTelefono(rs.getString("telefono"));
                u.setRol(rs.getString("rol"));
                lista.add(u);
            }
            request.setAttribute("listaUsuarios", lista);
            request.getRequestDispatcher("/vistas/usuarios/listar.jsp")
                   .forward(request, response);
        } catch (SQLException e) {
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher("/vistas/usuarios/listar.jsp")
                   .forward(request, response);
        }
    }

    // POST → registrar usuario
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String nombre     = request.getParameter("nombre");
        String apellido   = request.getParameter("apellido");
        String correo     = request.getParameter("correo");
        String telefono   = request.getParameter("telefono");
        String contrasena = request.getParameter("contrasena");
        String rol        = request.getParameter("rol");

        try {
            Connection cn = new conexion().conectar();
            String sql = "INSERT INTO usuario (nombre, apellido, correo, telefono, contrasena, rol) VALUES (?,?,?,?,?,?)";
            PreparedStatement ps = cn.prepareStatement(sql);
            ps.setString(1, nombre);
            ps.setString(2, apellido);
            ps.setString(3, correo);
            ps.setString(4, telefono);
            ps.setString(5, contrasena);
            ps.setString(6, rol);
            ps.executeUpdate();
            response.sendRedirect("UsuarioServlet");
        } catch (SQLException e) {
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher("/vistas/usuarios/registrar.jsp")
                   .forward(request, response);
        }
    }
}