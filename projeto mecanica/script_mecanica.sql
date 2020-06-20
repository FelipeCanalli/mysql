/* 
	SQL - Mecânica
	Projeto para uma  oficina mecânica 
SPA dos Automóveis 
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
    perfil VARCHAR(10) NOT NULL
);

describe tbusuarios;

-- inserindo dados na tabela
insert into tbusuarios(iduser,usuario,fone,login,senha,perfil)
values (1,'Felipe Galvão','','felipe','123456','admin');
insert into tbusuarios(iduser,usuario,fone,login,senha,perfil)
values (2,'Gilson Caetano','','gilson','123456','admin');
insert into tbusuarios(iduser,usuario,fone,login,senha,perfil)
values (3,'José de Assis','','jose','123456','user');

SELECT * FROM tbusuarios;


-- criando a tabela tbusuarios
CREATE TABLE tbclientes (
    idcli INT PRIMARY KEY AUTO_INCREMENT,
    nomecli VARCHAR(50) NOT NULL,
    doccli VARCHAR(5) NOT NULL,
    numdoccli VARCHAR(15) NOT NULL,
    fonecli VARCHAR(20) NOT NULL,
    endcli VARCHAR(100),
    numendcli VARCHAR(6),
    emailcli VARCHAR(20)
);

describe tbclientes;

-- criando a tabela tbusuarios
CREATE TABLE tbos (
    os INT PRIMARY KEY AUTO_INCREMENT,
    data_os TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    veiculo VARCHAR(10) NOT NULL,
    marca VARCHAR(20) NOT NULL,
    modelo VARCHAR(20) NOT NULL,
    placa VARCHAR(7) NOT NULL,
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
