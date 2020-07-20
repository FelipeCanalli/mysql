/* 
	SQL - Mecânica
	Projeto para uma  oficina mecânica 
	Tipo de Relacionamento 1:N 
    Um para muitos
	@author Felipe Galvão Canalli
*/

-- criando Banco de Dados
create database dboficina;
use dboficina;

-- criando a tabela tbusuarios
CREATE TABLE tbusuarios (
    iduser INT PRIMARY KEY,
    usuario VARCHAR(50) NOT NULL,
    fone VARCHAR(15),
    login VARCHAR(15) NOT NULL UNIQUE,
    senha VARCHAR(15) NOT NULL,
    perfil VARCHAR(5) NOT NULL
);

describe tbusuarios;

-- inserindo dados na tabela
insert into tbusuarios(iduser,usuario,fone,login,senha,perfil)
values (1,'Felipe Galvão','','felipe','123456','admin');
insert into tbusuarios(iduser,usuario,fone,login,senha,perfil)
values (2,'Gilson Caetano','','gilson','123456','admin');
insert into tbusuarios(iduser,usuario,fone,login,senha,perfil)
values (3,'José de Assis','','jose','123456','user');
insert into tbusuarios(iduser,usuario,fone,login,senha,perfil)
values (4,'Administrador','','admin','admin','admin');

SELECT * FROM tbusuarios;


-- criando a tabela tbusuarios
CREATE TABLE tbclientes (
    idcli INT PRIMARY KEY AUTO_INCREMENT,
    nomecli VARCHAR(50) NOT NULL,
    doccli VARCHAR(4) NOT NULL,
    numdoccli VARCHAR(20) NOT NULL,
    fonecli VARCHAR(20) NOT NULL,
    endcli VARCHAR(100),
    emailcli VARCHAR(50)
);

describe tbclientes;

SELECT * FROM tbclientes;

-- criando a tabela tbusuarios
CREATE TABLE tbos (
    os INT PRIMARY KEY AUTO_INCREMENT,
    data_os TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    tipo VARCHAR(15) NOT NULL,
    situacao VARCHAR(20) NOT NULL,
    veiculo VARCHAR(10) NOT NULL,
    fabricante VARCHAR(20) NOT NULL,
    modelo VARCHAR(20) NOT NULL,
	cor VARCHAR(10) NOT NULL,
    placa VARCHAR(8) NOT NULL,
    avarias VARCHAR(100) NOT NULL,
    defeito VARCHAR(100),
    pecas VARCHAR(100),
    servico VARCHAR(100) NOT NULL,
    mecanico VARCHAR(50) NOT NULL,
    valor DECIMAL(10 , 2 ),
    idcli INT NOT NULL,
    FOREIGN KEY (idcli) REFERENCES tbclientes (idcli)
);
describe tbos;
select * from tbos;

use dboficina;
-- O comando abaixo altera o tipo de dados ou parâmetros de um campo específico
alter table tbusuarios modify column perfil VARCHAR(5) NOT NULL;

-- O comando abaixo exclui um campo da tabela
alter table tbclientes drop column numendcli;

-- O comando abaixo altera o nome de um campo da tabela
ALTER TABLE tbos CHANGE marca fabricante VARCHAR(20) NOT NULL ;

-- Mostrando Dados pré selecionados com apelido e faz uma busca avaçando como inicío na letra
select idcli as Id, nomecli as Nome,fonecli as Fone from tbclientes where nomecli like "E%";
select nomecli, doccli, numdoccli, fonecli, endcli, emailcli from tbclientes where idcli = 1;

-- a linha abaixo altera a tabela adicionando um campo em uma determinadada posição
alter table tbos add tipo varchar(15) not null after data_os; 
alter table tbos add situacao varchar(20) not null after tipo;
alter table tbos add cor varchar(10) not null after modelo;

-- a instrução abaixo selecinona e ordena por nome todos os clientes em ordem alfabética
select * from tbclientes order by nomecli;

-- o bloco de código abaixo faz a seleção e união de dados de duas tabelas
-- OSER é uma variável que contém os campos desejados da tabela tbos
-- CLI é uma variável que contém os campos desejados da tabela tbclientes
select
OSER.os,data_os,tipo,situacao,fabricante,modelo,placa,servico,valor,
CLI.nomecli,fonecli
from tbos as OSER 
inner join tbclientes as CLI
on (CLI.idcli = OSER.idcli);

-- pegando mais informações
select
OSER.os,data_os,tipo,situacao,veiculo,fabricante,modelo,cor,placa,avarias,defeito,pecas,servico,mecanico,valor,
CLI.nomecli,doccli,numdoccli,fonecli,endcli,emailcli
from tbos as OSER
inner join tbclientes as CLI
on (CLI.idcli=1 = OSER.os=1) ;

-- selecionando o último id adicionado ordenando pela data mais recente
SELECT os FROM tbos ORDER BY data_os DESC LIMIT 1 ;
