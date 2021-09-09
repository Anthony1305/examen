create table ALQUILER (
   IDALQUILER           INT4                 not null,
   IDPELICULA           INT4                 null,
   IDCLIENTE            INT4                 null,
   FECHAPRESTAMO        DATE                 null,
   FECHAENTREGA         DATE                 null,
   VALOR                INT4 			        null,
   constraint PK_ALQUILER primary key (IDALQUILER)
);

create table CLIENTE (
   IDCLIENTE            INT4                 not null,
   CEDULACLIENTE        VARCHAR(10)          null,
   NOMBRESCLIENTE       VARCHAR(20)          null,
   APELLIDOSCLIENTE     VARCHAR(20)          null,
   FECHAREGISTROCLIENTE DATE                 null,
   constraint PK_CLIENTE primary key (IDCLIENTE)
);

create table PELICULA (
   IDPELICULA           INT4                 not null,
   NOMBREPELICULA       VARCHAR(30)          null,
   ANNIO_ESTRENO        INT4                 null,
   constraint PK_PELICULA primary key (IDPELICULA)
);

alter table ALQUILER
   add constraint FK_ALQUILER_RELATIONS_PELICULA foreign key (IDPELICULA)
      references PELICULA (IDPELICULA)
      on delete restrict on update restrict;

alter table ALQUILER
   add constraint FK_ALQUILER_RELATIONS_CLIENTE foreign key (IDCLIENTE)
      references CLIENTE (IDCLIENTE)
      on delete restrict on update restrict;

