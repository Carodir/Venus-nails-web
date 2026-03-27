package servlets;

import conexion.conexion;
import modelo.Pago;
import java.io.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;

@WebServlet("/PagoServlet")
public class PagoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Pago> lista = new ArrayList<>();
        try {
            Connection cn = new conexion().conectar();
            String sql = "SELECT * FROM pago";
            PreparedStatement ps = cn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Pago p = new Pago();
                p.setIdPago(rs.getInt("id_pago"));
                p.setIdCita(rs.getInt("id_cita"));
                p.setFecha(rs.getString("fecha"));
                p.setMonto(rs.getDouble("monto"));
                p.setMetodo(rs.getString("metodo"));
                lista.add(p);
            }
            request.setAttribute("listaPagos", lista);
            request.getRequestDispatcher("/vistas/pagos/listar.jsp")
                   .forward(request, response);
        } catch (SQLException e) {
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher("/vistas/pagos/listar.jsp")
                   .forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        int idCita     = Integer.parseInt(request.getParameter("idCita"));
        String fecha   = request.getParameter("fecha");
        double monto   = Double.parseDouble(request.getParameter("monto"));
        String metodo  = request.getParameter("metodo");

        try {
            Connection cn = new conexion().conectar();
            String sql = "INSERT INTO pago (id_cita, fecha, monto, metodo) VALUES (?,?,?,?)";
            PreparedStatement ps = cn.prepareStatement(sql);
            ps.setInt(1, idCita);
            ps.setString(2, fecha);
            ps.setDouble(3, monto);
            ps.setString(4, metodo);
            ps.executeUpdate();
            response.sendRedirect(request.getContextPath() + "/PagoServlet");
        } catch (SQLException e) {
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher("/vistas/pagos/agregar.jsp")
                   .forward(request, response);
        }
    }
}