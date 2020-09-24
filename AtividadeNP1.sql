-- Figura 1
-- Exe A
select avg(salario) from funcionarios;

-- Exe B
select f.primeiro_Nome as Nome, f.funcao as Função,
d.nome as NomeDepartaento from funcionarios f, departamentos d
where f.codigo_Depto = d.codigo_Depto
group by d.nome;

-- Exe C
select f.primeiro_Nome as Nome, f.endereco as Endereço,
f.rg as RG, f.cpf as CPF from funcionarios f,
departamentos d where f.codigo_Depto = d.codigo_Depto and
d.nome = "TI";

-- Exe D
select f.primeiro_Nome as Nome, f.salario as Salário from funcionarios f
where f.data_Nasc >= '1980-01-01' && f.data_Nasc <= '1990-12-31';


-- Figura 2
-- Exe A
select c.Name as País, c.Continent as Continente from country c;

-- Exe B
select c.Name as País, c.Region as Região, c.Population as População
from country c where
c.Continent = 'Europe';

-- Exe C
select c.LifeExpectancy as ExpectativaVida from country c where
c.Continent = 'Ásia';

-- Exe D
create view nomes as
select c.Name as País, c.HeadOfState as Presidente,
c.GovernmentForm as TipoGoverno, c.Population as População
from country c where c.Continent = 'South America' and
c.Population > 2000000;

-- Exe E
create view tamanhoidioma as
select c.Name as País, c.SurfaceArea as Área, cl.Language as Idioma
from country c, countrylanguage cl where
c.Code = cl.CountryCode and 
cl.IsOfficial = 'English'
order by c.SurfaceArea;

select * from tamanhoidioma;

-- Exe F 
alter view tamanhoidioma as
select c.Name as País, c.SurfaceArea as Área, cl.Language as Idioma,
cl.Percentage as Porcentual from country c, countrylanguage cl where
c.Code = cl.CountryCode and 
cl.IsOfficial = 'English'
order by c.SurfaceArea;

select * from tamanhoidioma;
