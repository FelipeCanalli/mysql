  /* 
	SQL - Aula 3
	Relacionamento de tabelas
    Exemplo prático N:N (muitos para muitos)
	@author Felipe Galvão Canalli
*/

create database aulaead; 	-- Criação do db
use aulaead;				-- Selecinando esse banco de dados

create table tbalunos(
		idaluno int primary key  auto_increment,
        nome varchar(50) not null,
        fone varchar(15) not null,
        nascimento date not null
);

insert into tbalunos(nome,fone,nascimento)
value ('Felipe Galvão','99451-4444',20030218);

insert into tbalunos(nome,fone,nascimento)
value ('Kauan Perez','91551-2222',now());

insert into tbalunos(nome,fone,nascimento)
value ('Leandro Ramos','96541-1111',19601004);

insert into tbalunos(nome,fone,nascimento)
value ('José de Assis','96176-1111',20001212);

insert into tbalunos(nome,fone,nascimento)
value ('Robson Vaamonde','95681-0000',19500417);

select * from tbalunos;
/*
 O bloco abaixo exibe o nascimento no formato dd/mm/yyyy
 e utiliza apelidos 
    */
select nome as aluno ,fone,date_format(nascimento,'%d/%m/%Y') 
as Nascimento from tbalunos;


create table tbcursos(
	idcurso int primary key auto_increment,
    curso varchar (50) not null,
    horas int not null,
    valor decimal(10,2)
);
describe tbcursos;

-- O comando abaixo adiciona um novo campo a tabela em um lugar específico
alter table tbcursos add column docente varchar(20) after curso;


insert into tbcursos(curso,docente,horas,valor)
values('HTML5','Edilson',40,120);

insert into tbcursos(curso,docente,horas,valor)
values('JavaSript','William',100,300);

insert into tbcursos(curso,docente,horas,valor)
values('Redes','Gilson',90,200);

insert into tbcursos(curso,docente,horas,valor)
values('CSS','Lucas',50,250);

insert into tbcursos(curso,docente,horas,valor)
values('Linux','Roberto',300,500);

select *from tbcursos;

create table tbmatriculas(
	idmatricula int primary key auto_increment,
    datamat timestamp default current_timestamp,
    idaluno int not null,
    idcurso int not null,
    /* 
    Precisamos criar duas chaves estrangeiras para idaluno e idcurso
	foreign key é o comando que faz isso
       */ 
    foreign key(idaluno) references tbalunos (idaluno),
    foreign key(idcurso) references tbcursos (idcurso)
);
describe tbmatriculas;

insert into tbmatriculas (idaluno,idcurso) values (1,1);
insert into tbmatriculas (idaluno,idcurso) values (1,2);
insert into tbmatriculas (idaluno,idcurso) values (1,4);
insert into tbmatriculas (idaluno,idcurso) values (2,2);
insert into tbmatriculas (idaluno,idcurso) values (2,4);
insert into tbmatriculas (idaluno,idcurso) values (3,3);
insert into tbmatriculas (idaluno,idcurso) values (3,1);
insert into tbmatriculas (idaluno,idcurso) values (4,3);
insert into tbmatriculas (idaluno,idcurso) values (4,6);
insert into tbmatriculas (idaluno,idcurso) values (5,3);
insert into tbmatriculas (idaluno,idcurso) values (5,6);

select *from tbmatriculas;

/* 
	Selecione tudo da tbmatriculas, faça uma junção 
    com a tabela alunos onde tbmatriculas.idaluno = tbalunos.idaluno
*/
select *from tbmatriculas
inner join tbalunos
on tbmatriculas.idaluno = tbalunos.idaluno
inner join tbcursos
on tbmatriculas.idcurso = tbcursos.idcurso;

select
M.idmatricula as Matrícula,
A.nome as Aluno,fone,
C.curso,docente as Professor,valor
from tbmatriculas as M
inner join tbalunos as A
on (M.idaluno = A.idaluno)
inner join tbcursos as C
on (M.idcurso = C.idcurso)
order by nome;	-- Deixando em ordem Alfabetica

select sum(valor) as Total from tbcursos; -- Soma dos valores dos cursos