/*
  SQL - Aula 1 
  Introdução ao SQL e CRUD
  Agenda de contatos 
  @author Felipe Galvão Canalli
*/

-- O comando abaixo lista os bancos "<ctrl><enter> para executar"
show databases;

-- O comando abaixo cria um novo banco de dados (Para excluir um banco da de dados use o comando drop database seguido do nome do banco)
create database agenda;
show databases;

-- O comando abaixo seleciona o banco de dados para trabalhar
use agenda;

-- O comando abaixo cria uma table//tabela
create table tbcontatos(
	id int primary key,
    nome varchar(50) not null,
    fone varchar(15) not null,
    email varchar(50)
);
show tables;
describe tbcontatos;


		/********* CRUD **********/
-- create
insert into tbcontatos(id,nome,fone,email)
values(1,'José de Assis','99999-9999','ze.gmail.com');

-- read
select * from tbcontatos;

-- update
update tbcontatos set fone='91234-5678' where id = 1;

-- delete
delete from tbcontatos where id= 1;