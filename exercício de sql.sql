/*Exercício da aula 24*/

create table ambulatorios_romulo(
nroa int not null,
andar smallint(3) not null,
capacidade smallint(3) not null,
primary key pknroa(nroa));

create table medicos_romulo(
codm int not null,
nome varchar(40) not null,
idade smallint(3) not null, 
especialidade char(20), 
cpf numeric(11) unique,
cidade varchar(40) not null,
nroa int not null,
foreign key fkambu(nroa) references ambularios_romulo (nroa),
primary key pkcodm (codm));

create table pacientes_romulo(
codp int,
nome varchar(40) not null,
idade smallint(3) not null,
cidade char(30),
cpf numeric(11) unique,
doenca varchar(40) not null,
primary key pkcodp(codp));

create table fucnionarios_romulo(
codf int,
nome varchar(40) not null,
idade smallint(3),
cpf numeric(11) unique,
cidade varchar(30),
salario numeric(10),
cargo varchar(20),
primary key pkcodf(codf));

create table consultas_romulo(
idcunsultas int not null ,
data_ date,
hora time,
codm int not null,
codp int not null,
primary key pkconsultas (idcunsultas),
foreign key fkcodm (codm) references medicos_victor2 (codm),
foreign key fkcodp (codp) references pacientes_victor (codp));

