
create DATABASE Colegio;

USE Colegio;

create table ALUMNOS(
     Cod_Alumno int auto_increment,
     Nombre varchar(25) NOT NUll,
     Primer_Apellido varchar(40) NOT NUll,
     Segundo_apellido varchar(40),
     Ciudad varchar(40),
     Dirección varchar(30) NOT NUll,
     Teléfono varchar(14) NOT NUll,
     birthday date,
     Identificación varchar(25) NOT NUll,
     No_Identificacion Int(17) NOT NUll,
     primary key(Cod_Alumno)
);
create table PROFESORES(
     Cod_de_Profesor int auto_increment,
     Nombre varchar(25) Not Null,
     Primer_Apellido varchar(40) Not Null,
     Segundo_apellido varchar(40),
     Ciudad varchar(40),
     Dirección varchar(30) Not Null,
     Teléfono varchar(14),
     birthday Date Not Null ,
     No_Identificación Int Not Null,
     primary key(Cod_de_Profesor)
);
create table CURSO(
     Cod_Curso int(10),
     Curso Varchar(20) Not Null,
     Cod_de_Profesor Int Not Null,
     Fecha_Inicio Date,
     Fecha_Fin Date,
     Incidencias Varchar(50),
     primary key(Cod_Curso),
     FOREIGN KEY (Cod_de_Profesor) REFERENCES PROFESORES(Cod_de_Profesor)
     ON DELETE CASCADE ON UPDATE CASCADE
);
create table EVALUACIONES(
     Cod_Alumno Int Not Null,
     Cod_Curso Int Not Null,
     Cod_de_Profesor Int Not Null,
     Nota_Final float,
     Observaciones varchar(50),
     FOREIGN KEY (Cod_Alumno) REFERENCES ALUMNOS(Cod_Alumno),
     FOREIGN KEY (Cod_Curso) REFERENCES CURSO(Cod_Curso)
     ON DELETE CASCADE ON UPDATE CASCADE
);
insert into ALUMNOS VALUES
     (1, "luis", "de la hoz", "ricaurte", "mosquera", "cll50", "3026211857", "1997-12-06", "cedula", 1006459024),
     (2, "Alberto", "Garcia", "Gutierrez", "Cali", "cll3", "3005460445", "1999-03-18", "cedula", 1056308130),
     (3, "Amparo", "Ferrandez", "Palomo", "Barranquilla", "cll25", "3011661142", "2000-04-26", "cedula", 1198831423), 
     (4, "Amparo", "Coral", "Marin", "Cartagena", "cll42", "3026245016", "1986-07-13", "cedula", 1196836204),
     (5, "Angel", "Sanchez", "Molina", "Cúcuta", "cll7", "3011418440", "1992-05-10", "cedula", 1141034607), 
     (6, "Antonio", "Pizana", "Tornero", "Bucaramanga", "cll1", "3000104305", "1988-08-01", "cedula",1094473325),
     (7, "Helena", "Cerdan", "Sanchez", "Barranquilla", "cll35", "3029244992", "1988-01-26", "cedula", 1088788972),
     (8, "Jose", "Ferrandez", "Molina", "Cartagena", "cll4", "3000466925", "1997-10-16", "cedula", 1019720818),
     (9, "Josefina", "Rodriguez", "Ruso", "Cúcuta", "cll20", "3005999269", "1993-07-07", "cedula", 1083060677),
     (10, "Pedro", "Gil", "Gasser", "Bucaramanga", "cll2", "3018347393", "1988-03-23", "cedula", 1032599137);

insert into PROFESORES VALUES
     (1, "carlos", "Gilbert", "Gasser", "Bucaramanga", "cll2", "3018347394", "1988-03-24", 1032599138),
     (2, "daniel", "hauss", "hill", "cucuta", "cll2", "3018347355", "1988-03-01", 1032599139),
     (3, "ferando", "justino", "lorens", "dinamarca", "cll2", "3018347356","1988-03-02", 1032599140),
     (4, "hildemaro", "cabeza", "press", "dinamarca", "cll2", "3018347357", "1988-03-03", 1032599954),
     (5, "raul", "cage", "press", "caracas", "cll2", "3018347358", "1988-03-04", 1032599942),
     (6, "kevin", "luke", "skywalker", "NY", "cll2", "3018347360", "1988-03-05", 1032599943);

insert into CURSO VALUES
     (1, "ingles", 1, "2010-03-05", "2011-03-05", "ninguna"),
     (2, "progamacion", 2, "2010-03-05", "2011-03-05", "ninguna" );

insert into EVALUACIONES VALUES
     (1, 1, 1, 5, "aprobo"),
     (1, 2, 2, 5, "aprobo"),
     (2, 1, 1, 4, "aprobo"),
     (2, 2, 2, 5, "aprobo"),
     (3, 1, 1, 3, "aprobo"),
     (3, 2, 2, 5, "aprobo"),
     (4, 1, 1, 2, "reprobo"),
     (4, 2, 2, 5, "aprobo"),
     (5, 1, 1, 2, "reprobo"),
     (5, 2, 2, 5, "aprobo"),
     (6, 1, 1, 3, "aprobo"),
     (6, 2, 2, 5, "aprobo"),
     (7, 1, 1, 3, "aprobo"),
     (7, 2, 2, 5, "aprobo"),
     (8, 1, 1, 4, "aprobo"),
     (8, 2, 2, 5, "aprobo"),
     (9, 1, 1, 4, "aprobo"),
     (9, 2, 2, 4, "aprobo"),
     (10, 1, 1, 4, "aprobo"),
     (10, 2, 2, 4, "aprobo");