package modelo;

public class Horario {
    private int idHorario;
    private int idUsuario;
    private String diaSemana;
    private String horaInicio;
    private String horaFin;

    public Horario() {}

    public Horario(int idHorario, int idUsuario, String diaSemana, String horaInicio, String horaFin) {
        this.idHorario = idHorario;
        this.idUsuario = idUsuario;
        this.diaSemana = diaSemana;
        this.horaInicio = horaInicio;
        this.horaFin = horaFin;
    }

    public int getIdHorario() { return idHorario; }
    public void setIdHorario(int idHorario) { this.idHorario = idHorario; }

    public int getIdUsuario() { return idUsuario; }
    public void setIdUsuario(int idUsuario) { this.idUsuario = idUsuario; }

    public String getDiaSemana() { return diaSemana; }
    public void setDiaSemana(String diaSemana) { this.diaSemana = diaSemana; }

    public String getHoraInicio() { return horaInicio; }
    public void setHoraInicio(String horaInicio) { this.horaInicio = horaInicio; }

    public String getHoraFin() { return horaFin; }
    public void setHoraFin(String horaFin) { this.horaFin = horaFin; }
}