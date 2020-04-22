/* 
	SQL - infox
	Projeto para uma Lan House
InfoX
	@author Felipe Galvão Canalli
*/
-- comentários

-- a linha abaixo cria um banco de dados
create database dbinfox;

-- a linha abaixo ela escolhe o banco de dados
use dbinfox;

-- o bloco de instruções abaixo cria uma tabela
create table tbusuarios(
	iduser int primary key,
    usuario varchar (50) not null,
    fone varchar(15),
    login varchar (15) not null unique,
    senha varchar (15) not null
);

-- o comando abaixo descreve a tabela
describe tbusuarios;

-- a linha abaixo insere dados na tabela
-- create -> insert
insert into tbusuarios(iduser,usuario,fone,login,senha)
values (1,'José de Assis','99999-9999','joseassis','123456');

-- a linha abaixo exibe os dados da tabela (CRUD)
-- read -> select
select * from tbusuarios;

insert into tbusuarios(iduser,usuario,fone,login,senha)
values (2,'Administrador','99999-9999','admin','admin');
insert into tbusuarios(iduser,usuario,fone,login,senha)
values (3,'Bill Gates','99999-9999','bill','123456');

delete from tbusuarios where iduser=3;

select *from tbusuarios;

create table tbclientes(
idcli int primary key auto_increment,
nomecli varchar(50) not null,
fonecli varchar(50) not null,
endcli varchar(100),
numcli varchar(5),
cidcli varchar(50) not null,
estcli varchar(02) not null,
cepcli varchar(10) not null,
emailcli varchar(50)
);

select *from tbclientes;
describe tbclientes;

insert into tbclientes(nomecli,endcli,fonecli,emailcli,cidcli, estcli,cepcli)
values('Linus Torvalds','Rua Tux','9999-9999','linus@linux.com','São Paulo','SP','00000-100');

insert into tbclientes(nomecli,endcli,fonecli,emailcli,cidcli, estcli,cepcli)
values('Felipe Galvão','Rua Folha de Hera','9999-9999','felipe@gmail.com','São Paulo','SP','03800-100');

insert into tbclientes(nomecli,endcli,fonecli,emailcli,cidcli, estcli,cepcli)
values('Mari','Rua Muniz','9999-9999','Mariana@hotmail.com','Uberlandia','MG','10800-560');

select * from tbclientes;

use dbinfox;
create table tbos(
		os int primary key auto_increment,
        data_os timestamp default current_timestamp,
        equipamento varchar(150) not null,
        defeito varchar (150) not null,
        servico varchar (150),
        tecnico varchar (30),
        valor decimal(10,2),
        idcli int not null,
        foreign key(idcli) references tbclientes(idcli)
);

insert into tbos (equipamento,defeito,servico,tecnico,valor,idcli)
values ('Notebook','Não liga','Troca de fonte','Zé',87.50,3);
select *from tbos;
delete from tbos where os=11;

-- o código abaixo traz informações de duas tabelas
select
O.os,equipamento,defeito,servico,valor,
C.nomecli,fonecli
from tbos as O
inner join tbclientes as C
on (O.idcli = C.idcli);