CREATE DATABASE clinica_romulo;
/*USE deljo254_aluno;*/

USE Clinica_romulo;
CREATE TABLE sala_romulo(
id_sala INT AUTO_INCREMENT NOT NULL,
numero_sala INT UNIQUE NOT NULL CHECK(numero_sala > 1 and numero_sala < 50),
andar INT UNIQUE NOT NULL CHECK(andar < 12),
PRIMARY KEY pkId_sala (id_sala)
);

CREATE TABLE medicos_romulo(
id_medico INT AUTO_INCREMENT NOT NULL,
crm VARCHAR(15) UNIQUE NOT NULL,
nome VARCHAR(40) NOT NULL,
idade INT CHECK (idade > 23),
especialidade CHAR(20) NOT NULL DEFAULT 'ORTOPEDIA',
cpf VARCHAR(15) UNIQUE NOT NULL,
data_admissao DATE,
PRIMARY KEY pkId_medico (id_medico)
);

CREATE TABLE pacientes_romulo(
id_paciente INT AUTO_INCREMENT NOT NULL,
rg VARCHAR(15) UNIQUE NOT NULL,
nome VARCHAR(40) NOT NULL,
data_nascimento DATE,
cidade CHAR(30) DEFAULT 'ITABUNA',
doenca VARCHAR(40) NOT NULL,
plano_saude VARCHAR(40) NOT NULL DEFAULT 'SUS',
PRIMARY KEY pkId_paciente (id_paciente)
);

CREATE TABLE funcionarios_romulo(
id_funcionario INT AUTO_INCREMENT NOT NULL,
matricula VARCHAR(40) NOT NULL,
data_nascimento DATE NOT NULL,
data_admissao DATE NOT NULL,
cargo VARCHAR(40) NOT NULL DEFAULT 'ASSISTENTE MEDICO',
salario FLOAT NOT NULL DEFAULT 510,
PRIMARY KEY pkId_funcionario (id_funcionario)
);

CREATE TABLE consultas_romulo(
id_consultas INT AUTO_INCREMENT NOT NULL,
data_horario DATETIME,
PRIMARY KEY pkId_consultas (id_consultas)
);

CREATE TABLE Atende_romulo(
Id_Atende INT NOT NULL AUTO_INCREMENT,
data_ DATETIME,
Id_Medico INT,
Id_Sala INT,
PRIMARY KEY (Id_Atende),
FOREIGN KEY (Id_Medico) REFERENCES Medicos (Crm),
FOREIGN KEY (Id_Sala) REFERENCES Sala (Numero_Sala)
);

CREATE TABLE Realiza_romulo(
Id_Realiza INT NOT NULL AUTO_INCREMENT,
Id_Medico INT,
Id_Consulta INT,
PRIMARY KEY (Id_Realiza),
FOREIGN KEY (Id_Medico) REFERENCES Medicos (Crm),
FOREIGN KEY (Id_Consulta) REFERENCES Consultas (Codigo_Consulta)
);

Create table Faz_romulo(
Id int not null auto_increment,
Id_Consulta int,
Id_Paciente int,
PRIMARY KEY (Id),
FOREIGN KEY (Id_Consulta) REFERENCES Consultas (Codigo_Consulta),
FOREIGN KEY (Id_Paciente) REFERENCES Pacientes (Rg)
);