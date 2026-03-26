package modelo;

public class Cita {
    private int idCita;
    private int idUsuario;
    private int idServicio;
    private String fecha;
    private String horaInicio;
    private String horaFin;
    private String estado;

    public Cita() {}

    public Cita(int idCita, int idUsuario, int idServicio, String fecha, String horaInicio, String horaFin, String estado) {
        this.idCita = idCita;
        this.idUsuario = idUsuario;
        this.idServicio = idServicio;
        this.fecha = fecha;
        this.horaInicio = horaInicio;
        this.horaFin = horaFin;
        this.estado = estado;
    }

    public int getIdCita() { return idCita; }
    public void setIdCita(int idCita) { this.idCita = idCita; }

    public int getIdUsuario() { return idUsuario; }
    public void setIdUsuario(int idUsuario) { this.idUsuario = idUsuario; }

    public int getIdServicio() { return idServicio; }
    public void setIdServicio(int idServicio) { this.idServicio = idServicio; }

    public String getFecha() { return fecha; }
    public void setFecha(String fecha) { this.fecha = fecha; }

    public String getHoraInicio() { return horaInicio; }
    public void setHoraInicio(String horaInicio) { this.horaInicio = horaInicio; }

    public String getHoraFin() { return horaFin; }
    public void setHoraFin(String horaFin) { this.horaFin = horaFin; }

    public String getEstado() { return estado; }
    public void setEstado(String estado) { this.estado = estado; }
}