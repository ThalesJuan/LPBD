-- Exercício 1
create database exercicioInnerJoin;

-- Exercício 2
create table cliente(
cpf int not null,
nome varchar(60),
dtNasc date,
primary key(cpf));

create table modelo(
codMod int not null,
desc_2 varchar(40),
primary key(codMod));

create table veiculo(
placa varchar(8) not null,
cor varchar(20),
modelo_codMod int,
cliente_cpf int,
primary key(placa),
foreign key(modelo_codMod) references modelo(codMod),
foreign key(cliente_cpf) references cliente(cpf));

create table patio(
num int not null,
ender varchar(40),
capacidade int,
primary key(num));

create table estaciona(
cod int not null,
dtEntrada varchar(10),
dtSaida varchar(10),
hsEntrada varchar(10),
hsSaida varchar(10),
patio_num int,
veiculo_placa varchar(8),
primary key(cod),
foreign key(patio_num) references patio(num),
foreign key(veiculo_placa) references veiculo(placa));

-- Exercício 3
select v.placa, c.nome from cliente c inner join veiculo v on
v.cliente_cpf = c.cpf;

-- Exercício 4
select c.cpf, c.nome from cliente c inner join veiculo v on
c.cpf = v.cliente_cpf where
v.placa = "jjj-2020";

-- Exercício 5
select v.placa, v.cor from veiculo v inner join estaciona e on
v.placa = e.veiculo_placa where
e.cod = 1;

-- Exercício 6
select p.ender, e.dtEntrada, e.dtSaida from estaciona e
inner join patio p on 
e.patio_num = p.num where
veiculo_placa = "jeg-1010";

-- Exercício 7
select count(e.dtEntrada) from estaciona e inner join veiculo v on
e.veiculo_placa = v.placa where
v.cor = "Verde";

-- Exercício 8
select * from cliente c inner join veiculo v 
on c.cpf = v.cliente_cpf where 
modelo_codMod = 1;

-- Exercício 9
select v.placa, e.hsEntrada, e.hsSaida from veiculo v inner join estaciona e
on v.placa = e.veiculo_placa where
v.cor = "Verde";

-- Exercício 10
select * from estaciona e inner join veiculo v
on e.veiculo_placa = v.placa where
v.placa = "jjj-2020";

-- Exercício 11
select c.nome from cliente c inner join veiculo v
on c.cpf = v.cliente_cpf where
v.modelo_codMod = 2;

-- Exercício 12
select c.cpf from cliente c inner join veiculo v
on c.cpf = v.cliente_cpf where
v.modelo_codMod = 3;

-- Exercício 13
select m.desc_2 from modelo m inner join veiculo v
on m.codMod = v.modelo_codMod 
inner join estaciona e on (e.cod = v.modelo_codMod) where
e.cod = 2;

-- Exercício 14
select distinct v.placa, c.nome, m.desc_2 from veiculo v 
inner join cliente c
on v.cliente_cpf = c.cpf
inner join modelo m
on v.modelo_codMod = v.modelo_codMod;
