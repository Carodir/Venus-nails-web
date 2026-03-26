package modelo;

public class Pago {
    private int idPago;
    private int idCita;
    private String fecha;
    private double monto;
    private String metodo;

    public Pago() {}

    public Pago(int idPago, int idCita, String fecha, double monto, String metodo) {
        this.idPago = idPago;
        this.idCita = idCita;
        this.fecha = fecha;
        this.monto = monto;
        this.metodo = metodo;
    }

    public int getIdPago() { return idPago; }
    public void setIdPago(int idPago) { this.idPago = idPago; }

    public int getIdCita() { return idCita; }
    public void setIdCita(int idCita) { this.idCita = idCita; }

    public String getFecha() { return fecha; }
    public void setFecha(String fecha) { this.fecha = fecha; }

    public double getMonto() { return monto; }
    public void setMonto(double monto) { this.monto = monto; }

    public String getMetodo() { return metodo; }
    public void setMetodo(String metodo) { this.metodo = metodo; }
}