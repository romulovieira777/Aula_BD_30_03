/*Informa ao SGBD que você utilizará o Banco abaixo*/
use deljo254_aluno;

/*Criará uma tabela simples*/
create table tabelaPai_romulo(
id  smallint not null auto_increment,
nome varchar(40) not null,
primary key pkTPai (id));

/* criará uma tabela que possui relacionamento */
create table tabelaFilho_romulo(
id smallint not null,
idFilho smallint not null,
nome varchar(30) not null,
daNascimento date not null,
rg char(9) not null,
primary key pkTFilho (id, idFilho),
foreign key fkTFilho_pai (id) references tabelaPai (id));

/*Criação de uma coluna em uma tabela já existente*/
alter table tabelaFilho_romulo
add column situacao tinyint default 1;

/*Criando uma coluna definindo o local onde a mesma será criada*/
alter table tabelaFilho_romulo
add column nomeMae varchar(35) not null after nome;

/*Criando um indice após a criação original da Tabela*/
alter table tabelaFilho_romulo
add index idTFilho_nome (daNascimento, nome);

/*Alteração de tabela, eliminando um objeto*/
alter table tabelaFilho_nome_romulo
drop index idTFilho_nome_romulo;

/*Eliminar um objeto do SGBD*/
drop table tabelaPai_romulo;
drop table if exists tabelaPai_romulo, tabelaFilho_romulo;

/*Insere um registro dentro da tabela pai*/
insert into tabelaPai_romulo values(1, 'Evandro_2'), (null, 'Brenda_2'), (null, 'Romulo_2');
insert into tabelaPai_romulo values(1, 'Evandro');
insert into tabelaPai values (null,'Evandro');
insert into tabelaPai (nome) value ('Evandro2'),('Luiz'),('Delmar'),('Karime'),('Renata'),
('Victoria'),('Leonardo'),('Tiago'),('Jean'),('Guilherme');

/* Insere valores na tabela filho */
insert into tabelaFilho_romulo
values(1, 1,'Filho 1', 'Nome Mae do Evandro', '2020-01-01', '123456789', 1);

insert into tabelaFilho_romulo (id, idfilho, nome, nomeMae, daNascimento, rg) values
(1, 3, 'Filho 3', 'Nome Mae do Filho 3', '2020-03-01', '987654321');

update tabelaFilho_romulo set nomeMae = 'Maria'
where id = 1 and idFilho = 2;

/*Retirar o modo de segurança do DML*/
set sql_safe_updates = 0;

truncate tabelaFilho_romulo, tabelaPai_romulo;

/*Consulta / Recuperação das informações nas tabelas */
select * from tabelaPai_romulo;
select * from tabelaFilho_romulo;

/* Retirar o modo de segurança do DML */
SET SQL_SAFE_UPDATES = 0;

/* Inserir por meio de um Select */
insert into tabelaFilho_romulo
select id,1,nome,'NOME MAE','2020-01-01','RG123',1 from tabelaPai_romulo;

insert into tabelaFilho_romulo values(1,1,'Evandro','NOME MAE','2020-01-01','Rg111',1)
ON duplicate key update situacao = 0;

select * from tabelaFilho_romulo where id = 1 and idFilho = 1;
