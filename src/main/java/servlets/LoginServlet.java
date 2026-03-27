package servlets;
import conexion.conexion;
import java.io.*;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String correo     = request.getParameter("correo");
        String contrasena = request.getParameter("contrasena");
        try {
            Connection cn = new conexion().conectar();
            String sql = "SELECT * FROM usuario WHERE correo = ? AND contrasena = ?";
            PreparedStatement ps = cn.prepareStatement(sql);
            ps.setString(1, correo);
            ps.setString(2, contrasena);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                HttpSession session = request.getSession();
                session.setAttribute("idUsuario", rs.getInt("id_usuario"));
                session.setAttribute("nombre", rs.getString("nombre"));
                session.setAttribute("rol", rs.getString("rol"));

              String rol = rs.getString("rol").toLowerCase();
                if (rol.equals("admin")) {
                    response.sendRedirect(request.getContextPath() + "/vistas/admin/panel.jsp");
                } else if (rol.equals("manicurista")) {
                    response.sendRedirect(request.getContextPath() + "/vistas/manicurista/panel.jsp");
                } else {
                    response.sendRedirect(request.getContextPath() + "/vistas/cliente/panel.jsp");
                }
            } else {
                response.sendRedirect(request.getContextPath() + "/vistas/login.jsp?error=1");
            }
        } catch (SQLException e) {
            response.sendRedirect(request.getContextPath() + "/vistas/login.jsp?error=2");
        }
    }
}