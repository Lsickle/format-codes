<%-- 
    Document   : index
    Created on : 6/08/2018, 07:15:55 PM
    Author     : SENA
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.Catch"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="controladores.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body align="center">
            <%!
            /*reconoce sql(Traductor sql a java)*/
            PreparedStatement ps=null;
            Conexion con=new Conexion();
            Connection cnn=con.conexionbd();
        %>
    <form action="index.jsp">
        <input type ="text" name="Dor" placeholder="Digite el Dorsal">
        <input type="text" name="Nombre" placeholder="Digite el Nombre">
        <input type="text" name="Edad" placeholder="Digite la edad">
        <input type="text" name="Equipo" placeholder="Digite Nombre de equipo">
        <input type="submit" name="btning" value="Guardar">
        <h5>
            <hr/>
        </h5>
    
        
        <%
            if(request.getParameter("btning")!=null){
            String Nom,Equip;
            int Dorsal,Ed;
            Dorsal = Integer.parseInt(request.getParameter("Dor"));
            Nom=request.getParameter("Nombre");
            Ed = Integer.parseInt(request.getParameter("Edad"));
            Equip=request.getParameter("Equipo");
           try {
                ps=cnn.prepareStatement("INSERT INTO ciclista VALUES (?,?,?,?)");
                ps.setInt(1, Dorsal);
                ps.setString(2, Nom);
                ps.setInt(3, Ed);
                ps.setString(4, Equip);
                //Actualiza BD
                ps.executeUpdate();  
               } catch (Exception e) {
                   JOptionPane.showMessageDialog (null, e);
               }
               }
        %>
        </form>
        <table border="10px" align="center">
            <tr >
                 <th>Dorsal</th>
                 <th>Nombre</th>
                 <th>Edad</th>
                 <th>Nombre de equipo</th>
            </tr>
        <!--Variables Globales-->
        <%!
            /*Arreglos*/
            ResultSet rs=null;
        %>
        
        <% 
            Conexion con=new Conexion();
            Connection cnn=con.conexionbd();
            try{
            ps=cnn.prepareStatement("SELECT * FROM ciclista");
            rs=ps.executeQuery();
            while(rs.next()){
                
        %>
             <form action="index.jsp">
        <tr>
            <td><input type="text" name="Dor" value="<%=rs.getString(1) %>"/></td>
            <td><input type="text" name="Nombre" value="<%=rs.getString(2)%>"/></td>
            <td><input type="text" name="Edad" value="<%=rs.getString(3)%>"/></td>
            <td><input type="text" name="Equipo" value="<%=rs.getString(4)%>"/></td>
            <td><input type="submit" name="btnmod" value="modificar"/></td>
        </tr>
        </form>
            <div id="buscar">
                <form action="index.jsp">
                <input type="text" name="buscar" id="bus">
                <input type="submit" name="btnbus" value="Enviar" id="btnbus">
                   </div>
                <%
                    if(request.getParameter("btnbus")!=null){
                        int Dorsal;
                        Dorsal=Integer.parseInt(request.getParameter("buscar"));
                        try {
                            ps=cnn.prepareStatement("SELECT *FROM ciclista WHERE dorsal='"+Dorsal+"'");
                            rs=ps.executeQuery();
                            while(rs.next()){
                                %>
                                <input type="text" name="td" value="<%=rs.getInt(1)%>"/>
                                <input type="text" name="td" value="<%=rs.getString(2)%>"/>
                                <input type="text" name="td" value="<%=rs.getString(3)%>"/>
                                <input type="text" name="td" value="<%=rs.getString(4)%>"/>
                                
                                <%
                            }
                                
                            } catch (Exception e) {
                            }
                        
                        
                    
                    }
                    %>
         
                                </form>            
        <%
            }
}catch(Exception e){
    JOptionPane.showMessageDialog(null, e);
}
        %>
        <%
            if(request.getParameter("btnmod")!=null){
            String Nm,Eq;
            int D,Edd;
            D=Integer.parseInt(request.getParameter("Dor"));
            Nm=request.getParameter("Nombre");
            Edd=Integer.parseInt(request.getParameter("Edad"));
            Eq=request.getParameter("Equipo");
        try{
            //''=texto,,""=sentencia sql,,,++=variable
            ps=cnn.prepareStatement("UPDATE ciclista SET nombre='"+Nm+"',"
                    + "edad='"+Edd+"' where dorsal='"+D+"' ");
            ps.executeUpdate();
            response.sendRedirect("index.jsp");
            JOptionPane.showMessageDialog(null, "Datos modificados");
        }catch (Exception e){
            JOptionPane.showMessageDialog(null, e);
        }
        }  
        %>
        </table>
    </body>
</html>
