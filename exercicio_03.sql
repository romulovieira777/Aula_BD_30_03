create database revendedora_carros_romulo;
/*USE deljo254_aluno;*/

use revendedora_carros_romulo;

create table Automovel_romulo(
Renavam int unique not null,
Marca varchar (30) not null,
Placa char (6) unique not null,
Modelo varchar (30) not null,
Ano_Fabricacao int (4) not null,
Ano_Modelo int (4) not null,
Cor varchar (20) not null,
Motor varchar (20) not null,
Numero_Portas int (5) not null,
Combustivel char (10) not null,
Preco float not null,
primary key (Renavam)
);

create table Ciente_romulo(
Id_Cliente int unique auto_increment,
Nome varchar (20) not null,
Sobrenome  varchar (20) not null,
Telefone int (11) not null,
Rua varchar (40) not null,
Numero_Casa int not null,
Complemento varchar (40) not null,
Bairro varchar (40) not null,
Cidade varchar (40) not null,
Estado varchar (40) not null,
Cep int (8) not null,
primary key (Id_Cliente)
);

create table Vendedores_romulo(
Id_Vendedor int unique auto_increment,
Nome varchar (20) not null,
Sobrenome  varchar (20) not null,
Telefone int (11) not null,
Rua varchar (40) not null,
Numero_Casa int not null,
Complemento varchar (40) not null,
Bairro varchar (40) not null,
Cidade varchar (40) not null,
Estado varchar (40) not null,
Cep int (8) not null,
Data_Admissao date not null,
salario_Fixo float not null,
primary key (Id_Vendedor)
);

create table Venda_romulo(
Id_Venda int unique auto_increment,
Data_Venda date not null,
Id_Automovel int,
Id_Cliente int,
Id_Vendedor int,
Valor_Venda float not null,
primary key (Id_Venda),
foreign key (Id_Automovel) references Automovel (Renavam),
foreign key (Id_Cliente) references Ciente (Id_Cliente),
foreign key (Id_Vendedor) references Vendedores (Id_Vendedor)
);