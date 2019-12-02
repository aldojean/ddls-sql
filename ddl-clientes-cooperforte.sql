﻿CREATE TABLE clientes.usuario
(
  id bigserial NOT NULL PRIMARY KEY,
  nome character varying(150),
  email character varying(100),
  senha character varying(20),
  data_cadastro date DEFAULT NOW()
);

CREATE TABLE clientes.cliente
(
  id bigserial NOT NULL PRIMARY KEY ,
  nome character varying(100) NOT NULL,
  mes integer NOT NULL,
  ano integer NOT NULL,
  valor numeric(16,2),
  tipo character varying(20) CHECK ( tipo in ('PUBLICO', 'PRIVADO') ) NOT NULL,
  status character varying(20) CHECK ( status IN ('CADASTRAMENTO', 'CANCELADO', 'EFETIVADO' ) ) NOT NULL,
  id_usuario bigint REFERENCES clientes.usuario (id) NOT NULL,
  data_cadastro date DEFAULT NOW()
);