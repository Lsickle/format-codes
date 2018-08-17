/*drop database basura;*/
create database basura;
	
	create TABLE IF NOT EXISTS ProtectosVarios (
     Proyecto int,
     Fase Varchar(16),
     Actividad Varchar(16),
     InicioP varchar(16),
     InicioR Varchar(16),
     TerminoP Varchar(16),
     TerminoR Varchar(16),
     estado varchar(5)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;