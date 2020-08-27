create database exerc_fixacao;

use exerc_fixacao;

create table departamentos(
codigo_Depto int not null,
nome varchar(30) not null,
localizacao varchar(30),
primary key(codigo_Depto));

insert into departamentos(codigo_Depto, nome, localizacao) values
(002, "segundo func", "Computação");

create table funcionarios(
codigo_Func int not null,
codigo_Depto int not null,
primeiro_Nome varchar(20) not null,
segundo_Nome varchar(20) not null,
ultimo_Nome varchar(20) not null,
data_Nasc date,
cpf varchar(14) unique,
rg varchar(13),
endereco varchar(60),
cep varchar(10),
cidade varchar(30) default 'Itapira',
fone_Res varchar(14),
fone_Cel varchar(15),
funcao varchar(30),
salario decimal(8,2),
primary key(codigo_Func),
foreign key(codigo_Depto) references departamentos(codigo_Depto));

insert into funcionarios(codigo_Func, codigo_Depto, primeiro_Nome,
segundo_Nome, ultimo_Nome, data_Nasc, cpf, rg, endereco, cep,
cidade, fone_Res, fone_Cel, funcao, salario) values 
(00014, 002, "Primeiro2", "Segundo2", "bbbbbb", "1997-07-10", 14141414, 
"rgsegundo", "Segunda rua", "111111", "Itapira", "3333-3333",
 "0202-0202", "Recepcionista", 10000);

select primeiro_Nome, ultimo_Nome from funcionarios
order by ultimo_Nome;

select * from funcionarios order by cidade;

select primeiro_Nome, segundo_Nome, ultimo_Nome, salario
from funcionarios where salario > 1000.00;

select data_Nasc, primeiro_Nome from funcionarios
order by data_Nasc desc;

select * from funcionarios;

select sum(salario) from funcionarios;

select count(codigo_Func) from funcionarios;

select avg(salario) from funcionarios;

select primeiro_Nome, segundo_Nome, ultimo_Nome from funcionarios
where cidade = 'Itapira' and funcao = "Recepcionista";
