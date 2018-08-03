create database Ciclismo;
create table equipo (
    nomeq varchar(20) not null,
    director varchar(50),
    constraint PK_Equipo Primary Key (nomeq)
);

create table maillot (
    codigo varchar(3) NOT NULL,
    tipo varchar(20),
    color varchar(20),
    premio int,
    constraint PK_Maillot Primary Key (codigo)
);

create table ciclista
(
  dorsal int not null,
  nombre varchar(50),
  edad int,
  nomeq varchar(20),
  constraint PK_ciclista Primary Key(dorsal),
  constraint ciclista_equipo Foreign Key (nomeq) references equipo(nomeq) on delete cascade on update cascade
);

create table etapa
(
  netapa int not null,
  km     int,
  salida varchar(20),
  llegada varchar(20),
  dorsal int,
  constraint PK_etapa Primary Key(netapa),
  constraint etapa_ciclista Foreign Key (dorsal) references ciclista(dorsal) on delete cascade on update cascade

);


create table puerto
(
  nompuerto varchar(20) not null,
  altura int,
  categoria varchar(1),
  pendiente int,
  netapa int,
  dorsal int,
  constraint PK_puerto Primary Key(nompuerto),
  constraint puerto_ciclista Foreign Key (dorsal) references ciclista(dorsal) on delete cascade on update cascade,
  constraint puerto_etapa Foreign Key (netapa) references etapa(netapa) on delete cascade on update cascade
);


create table llevar(
  dorsal int not null,
  netapa int not null,
  codigomail varchar(3),
  constraint llevar_ciclista Foreign Key (dorsal) references ciclista(dorsal) on delete cascade on update cascade,
  constraint llevar_etapa Foreign Key (netapa) references etapa(netapa) on delete cascade on update cascade,
  constraint llevar_maillot Foreign Key (codigomail) references maillot(codigo) on delete cascade on update cascade
);







