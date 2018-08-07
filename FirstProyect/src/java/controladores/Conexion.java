/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controladores;

import java.sql.Connection;
import java.sql.DriverManager;
import javax.swing.JOptionPane;


public class Conexion {
    Connection cnn=null;
    public Connection conexionbd(){
    try {Class.forName("com.mysql.jdbc.Driver");
    cnn=DriverManager.getConnection("jdbc:mysql://localhost/ciclismo","root","0000");
        JOptionPane.showMessageDialog(null, "conexion exitosa");
    }
    catch (Exception e) {
        JOptionPane.showMessageDialog(null, e);
    }        
    return cnn;
    }
    public static void main(String[]args){
        Conexion con = new Conexion();
        con.conexionbd();
    }
}
