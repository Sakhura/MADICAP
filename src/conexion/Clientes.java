/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package conexion;

/**
 *
 * @author Usuario
 */
public class Clientes {
    
    private int rut;    
    private String dv;
    private String nombre;
    private int celular;
    private int telefono;
    private String fecha_nac;
    private String email;
    private String redsocial;
    
    
    public Clientes(){}

    public Clientes(int rut, String dv, String nombre, int celular, int telefono, String fecha_nac, String email, String redsocial) {
        this.rut = rut;
        this.dv = dv;
        this.nombre = nombre;
        this.celular = celular;
        this.telefono = telefono;
        this.fecha_nac = fecha_nac;
        this.email = email;
        this.redsocial = redsocial;
    }

    public int getRut() {
        return rut;
    }

    public void setRut(int rut) {
        this.rut = rut;
    }

    public String getDv() {
        return dv;
    }

    public void setDv(String dv) {
        this.dv = dv;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCelular() {
        return celular;
    }

    public void setCelular(int celular) {
        this.celular = celular;
    }

    public int getTelefono() {
        return telefono;
    }

    public void setTelefono(int telefono) {
        this.telefono = telefono;
    }

    public String getFecha_nac() {
        return fecha_nac;
    }

    public void setFecha_nac(String fecha_nac) {
        this.fecha_nac = fecha_nac;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getRedsocial() {
        return redsocial;
    }

    public void setRedsocial(String redsocial) {
        this.redsocial = redsocial;
    }
    
     
    
    
}
