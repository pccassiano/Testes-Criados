CREATE DATABASE pweb;
USE pweb;

CREATE TABLE chamado (codigo int primary key auto_increment,
nome varchar (100),
email varchar (100),
titulo varchar (100),
descritivo varchar (400),
prioridade int);
