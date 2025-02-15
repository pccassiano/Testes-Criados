CREATE DATABASE bdweb;
USE bdweb;

CREATE TABLE chamado (codigo int primary key auto_increment,
nome varchar (100),
email varchar (100),
titulo varchar (100),
descritivo varchar (4000),
prioridade int);
