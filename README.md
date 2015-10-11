Contribuidores:
Victor Guillem Agustí 
Pau alegria Civera 
Euxenia Miruna Goia


* CREATE SENTENCES ON postgresSQL JAVA version 9.1 *
* 

DROP TABLE Reserva;
DROP TABLE Supervisar;
DROP TABLE Monitor;
DROP TABLE Usuario;
DROP TABLE NivelActividad;
DROP TABLE HorasInicioActividad;
DROP TABLE Actividad;
DROP TABLE TipoActividad;

CREATE TABLE TipoActividad( 
    tipo                VARCHAR(50) NOT NULL,
    descripcion         TEXT,
    foto                TEXT,
    requisitos          TEXT,
    activa              VARCHAR(2) NOT NULL,
    CONSTRAINT cp_tipo PRIMARY KEY (tipo) 
);

CREATE TABLE Actividad(
    idActividad         SERIAL, 
    tipo                VARCHAR(50) NOT NULL,
    nombre              VARCHAR(50) NOT NULL,
    duracionHoras       INTEGER NOT NULL,
    descripcion         TEXT,
    minParticipantes    INTEGER NOT NULL,
    maxParticipantes    INTEGER NOT NULL,
    oferta              VARCHAR(100),
    nuevo               INTEGER,
    localizacion        TEXT,
    foto                TEXT,
    activa              VARCHAR(2) NOT NULL,
    CONSTRAINT cp_idActividad PRIMARY KEY (idActividad),
    CONSTRAINT tipo_actividad_A_caj FOREIGN KEY(tipo) REFERENCES TipoActividad(tipo)
        ON DELETE CASCADE
        ON UPDATE CASCADE  
);

CREATE TABLE HorasInicioActividad(
    idActividad         INTEGER NOT NULL, 
    horaInicio          VARCHAR(30) NOT NULL,
    CONSTRAINT cp_idActividad_horaInicio PRIMARY KEY (idActividad, horaInicio),
    CONSTRAINT HorasInicioActividad_caj FOREIGN KEY(idActividad) REFERENCES Actividad(idActividad)
        ON DELETE CASCADE
        ON UPDATE CASCADE  
);

CREATE TABLE NivelActividad(
    idActividad         INTEGER NOT NULL, 
    nivel               VARCHAR (20) NOT NULL,
    precioPorPersona    NUMERIC(10, 2) NOT NULL,
    CONSTRAINT cp_nivel_idActividad PRIMARY KEY (idActividad,nivel),
    CONSTRAINT actividad_N_caj FOREIGN KEY(idActividad) REFERENCES Actividad(idActividad)
        ON DELETE CASCADE
        ON UPDATE CASCADE  
);

CREATE TABLE Usuario(
    rol                 VARCHAR(25) NOT NULL,
    usuario             VARCHAR(10) NOT NULL,
    contrasenya         VARCHAR(32) NOT NULL,
    CONSTRAINT usuario_cp PRIMARY KEY(usuario)
);

CREATE TABLE Monitor(
    nombre              VARCHAR(25) NOT NULL,
    email               VARCHAR(50) NOT NULL,
    usuario             VARCHAR(10) NOT NULL,
    CONSTRAINT monitor_cp PRIMARY KEY(usuario),
    CONSTRAINT monitor_caj FOREIGN KEY(usuario) REFERENCES Monitor(usuario)
        ON DELETE CASCADE
        ON UPDATE CASCADE, 
    CONSTRAINT email_u UNIQUE(email)
);

CREATE TABLE Supervisar( 
    tipo                VARCHAR(50) NOT NULL,
    usuario             VARCHAR(50) NOT NULL,
    CONSTRAINT Supervisar_cp PRIMARY KEY(tipo, usuario),
    CONSTRAINT tipo_actividad_S_caj FOREIGN KEY(tipo) REFERENCES TipoActividad(tipo)
        ON DELETE CASCADE
        ON UPDATE CASCADE,  
    CONSTRAINT usuario_caj FOREIGN KEY(usuario) REFERENCES Monitor(usuario)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE Reserva(
    idReserva           SERIAL NOT NULL,
    nombreCliente       VARCHAR(50) NOT NULL,
    telefonoCliente     VARCHAR(9) NOT NULL,
    emailCliente        VARCHAR(80) NOT NULL, 
    horaInicio          VARCHAR(30) NOT NULL, 
    estado              VARCHAR(10) NOT NULL, 
    numParticipantes    INTEGER NOT NULL, 
    fechaReserva        DATE, 
    fechaActividad      DATE, 
    idActividad         INTEGER NOT NULL, 
    monitor             VARCHAR(20),
    nivel               VARCHAR (20) NOT NULL,
    CONSTRAINT reserva_cp PRIMARY KEY(idReserva),
    CONSTRAINT actividadNivelR_caj FOREIGN KEY(idActividad,nivel) REFERENCES NivelActividad(idActividad,nivel)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT monitorR_caj FOREIGN KEY(monitor) REFERENCES Monitor(usuario)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);



* INSERT SENTENCES *
* 


INSERT INTO TipoActividad VALUES('Escalada','La escalada, en montanismo, es una actividad que consiste en realizar ascensos sobre paredes de fuerte pendiente valiendose de la fuerza fisica y mental propia',null,'Calzado y ropa profesional propia','SI');
INSERT INTO TipoActividad VALUES('Ranfting','El descenso de rios es una actividad deportiva y recreativa que consiste en recorrer el cauce de rios en la direccion de la corriente (rio abajo), por lo general sobre algun tipo de embarcacion o balsa',null,null,'SI');

INSERT INTO Actividad VALUES(default,'Escalada','Escalada en Castellet',5,'Escalada profesional',5,10,null,null,null,null,'SI');
INSERT INTO Actividad VALUES(default,'Ranfting','Descenso por el tramo de aguas bravas',5,'Descenso por rio',5,8,null,null,'Montanejos',null,'SI');

INSERT INTO HorasInicioActividad VALUES(1,'MANYANA');
INSERT INTO HorasInicioActividad VALUES(1,'TARDE');
INSERT INTO HorasInicioActividad VALUES(2,'MANYANA');

INSERT INTO NivelActividad VALUES(1,'AVANZADO',20.5);
INSERT INTO NivelActividad VALUES(1,'PRINCIPIANTE',19.5);
INSERT INTO NivelActividad VALUES(2,'AVANZADO',20);


INSERT INTO Usuario VALUES('GESTOR','admin','admin');

---------------------------------------------------no son correctos -----------------------------
INSERT INTO Monitor VALUES('Miruna Alba','alba@agg.com','alba');
INSERT INTO Monitor VALUES('Ramon Gilet','gilet@agg.com','gilet');

INSERT INTO Supervisar VALUES('Escalada','alba');
INSERT INTO Supervisar VALUES('Escalada','gilet');
INSERT INTO Supervisar VALUES('Ranfting','gilet');

INSERT INTO Reserva VALUES(DEFAULT,'Andres Martinez','788786678','amartinez@hotmail.com','MANYANA','PENDIENTE',6,current_date,current_date + 20,1,null,'AVANZADO');
INSERT INTO Reserva VALUES(DEFAULT,'Victor Sagunto','878667778','victorito@hotmail.com','TARDE','PENDIENTE',6,current_date,current_date + 22,1,'gilet','AVANZADO');


UPDATE Reserva SET monitor = 'alba' WHERE idReserva = 1;



Good coding! ;)
