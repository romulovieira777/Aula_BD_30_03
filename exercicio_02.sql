create database eleicao_romulo;
/*USE deljo254_aluno;*/

use eleicao_romulo;

create table Cargo_romulo(
Codigo_Cargo int unique not null,
Nome_Cargo varchar (30) unique not null check (Nome_Cargo <> 'Prefeito' and Nome_Cargo <> 'Vereador'),
Salario float not null default 1700,
Numero_Vagas int unique not null,
primary key (Codigo_Cargo)
);

create table Candidato_romulo(
Numero_Candidato int unique not null,
Nome varchar (40) unique not null,
Codigo_Cargo int not null,
Codigo_Partido int not null,
id_voto int not null,
primary key (Numero_Candidato),
foreign key (Codigo_Cargo) references Cargo_romulo (Codigo_Cargo),
foreign key (Codigo_Partido) references Partido_romulo (Codigo_Partido),
foreign key (id_voto) references voto_romulo (id_voto),
);

create table Partido_romulo(
Codigo_Partido int unique not null,
Sigla char (5) unique not null,
Nome varchar (40) unique not null,
Numero int unique not null,
primary key (Codigo_Partido)
);

create table Eleitor_romulo(
Titulo_Eleitor varchar (30) unique not null,
Zona_Eleitoral char (5) not null,
Sessao_Eleitoral char (5) not null,
Nome varchar (40) not null,
primary key (Titulo_Eleitor)
);

create table Voto_romulo(
Titulo_Eleitor varchar (30) unique not null,
codigo_candidato int unique not null,
primary key (id_voto),
foreign key (Titulo_Eleitor) references Eleitor_romulo (Titulo_Eleitor),
foreign key (codigo_candidato) references Candidato_romulo (codigo_candidato)
);