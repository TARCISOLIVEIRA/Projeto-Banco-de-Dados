create database ProjetoOficina;
use ProjetoOficina;

create table mecanico (
   idMecanico int primary key auto_increment,
   NomeMec varchar (50) not null
   );
   
 select * from mecanico; 
 alter table mecanico auto_increment = 1;
 desc mecanico;
 
insert into mecanico  values
(6, 'Paulo');



create table cliente (
   idCliente int primary key auto_increment,
   nome varchar (50) not null,
   CPF int not null,
   cnh varchar (50) not null,
   Rua varchar (50) not null,
   numero int not null,
   complemento varchar (50) not null,
   bairro varchar (50) not null,
   cidade varchar (50) not null,
   Estado varchar (50) not null,
   email varchar (50) not null,
   fone int not null
   );
   
insert into cliente  values
(2,'Armando',1244,'3344','Rua Bonito',12,'bem','Jardim Paulista','Olinda','Pe','lula@gme',199999999),
(3,'Cavalcanti',1244,'3344','Rua Bonito',12,'bem','Jardim Paulista','Abreue e Lima','Pe','lula@gme',199999999);


select * from cliente;

create table estoque (
idEstoque int primary key auto_increment,
categoria varchar (50) not null,
produto varchar (50) not null,
quantidade int not null
);
insert into estoque values
(1,'motor','pistao',40),
(2,'suspensão','amortecedor',100),
(3,'eletrico','lampadas',200);

select * from estoque;


create table TabelaValor(
    idTabela int primary key not null,
	valorPeça float not null,
    valorResvisao float not null,
    valorManutencao float not null,
    valorMaodeObra float not null );
    
    insert into TabelaValor
    values 
    (1,254,1000,450,150),
    (2,254,1000,450,150),
    (3,254,1000,450,150),
    (4,254,1000,450,150);
    
    select * from TabelaValor;
    
    create table funcionario (
    idFuncionario int primary key ,
    idFMecanico int,
    nome varchar (50) not null,
    CPF int,
    profissao varchar (50) not null, 
    especialidade varchar (50) not null,
    Rua varchar (50) not null,
    numero int not null,
    bairro varchar (50) not null,
    cidade varchar (50) not null,
    estado varchar (50) not null,
    constraint unique_cpf_tabela unique (CPF),
    constraint fk_tabela_mecanico foreign key (idFMecanico) references mecanico (idMecanico)
    );
    insert into funcionario values
    (1,1,'Ronaldo','37373','mecanico','embreagem','Rua Bom',12,'Jardim','Recife','Pe'),
    (2,2,'Carlos','29339','mecanico','motor','Rua Mar',14,'Beira Mar','Olinda','Pe');
    
    
    use mecanico;
    select * from mecanico;
    
    create table ItemEstoque (
       IdEstoque int not null,
       IdTabelaValor int not null,
       Tipo varchar (50) not null,
       dtFabricacao date,
       dtValidade date,
       primary key (idEstoque, idTabelaValor),
       constraint fk_ItemEstoque_tabelavalor foreign key (idTabelaValor)references tabelavalor(idTabela),
       constraint fk_ItemEstoque_estoque foreign key (IdEstoque) references estoque(idEstoque)
       );
       
       insert into itemestoque values
       (2,2,'Suspensão','2022-02-23','2023-03-23');
       
create table if not exists fornecedor (
     idFornecedor int primary key,
     idEstoque int,
     RazaoSocial varchar(50),
     CNPJ int not null,
     Contato varchar (50) not null, 
     constraint fk_fornecedor_Estoque foreign key (idEstoque) references estoque(IdEstoque));
     
     insert into fornecedor values
     (1,1,'Pirelli',828228,'Carlos'),
     (2,2,'Som',8282822,'Manoel Martins'),
     (3,3,'Hacata',68882,'Marcos Eduardo');
     
     select * from fornecedor;
     
     create table fatura (
         idFatura int primary key,
         FormaPagamento varchar (50) not null,
         ValorTotal varchar (50) not null,
         IdOrdServico int,
         IdCliente int,
         
         constraint fk_fatura_OrdServico foreign key(IdOrdServico) references OrdemServico (idOrdemServico),
         constraint fk_fatura_Cliente foreign key(IdCliente) references cliente (idCliente));
         
         alter table fatura drop ValorTotal;
         alter table fatura add valorTotal int not null;
         
         insert into fatura values
         (2,'dinheiro',2,2,'202');
         select * from fatura;
         
         
         
	create table OrdemServico (
         idOrdemServico int primary key,
         peca varchar (50),
         valorPeca  float,
         valorMaoObra float,
         IdOrdemOrcamento int,
         idOrdemMecanico int,
         constraint fk_Ordemservico_orcamento foreign key ( IdOrdemOrcamento)references orcamento(idOrcamento));
         
      insert into ordemservico values
         (2,'Pneu',203,120,2,2);


create table orcamento (
    idOrcamento int primary key,
    dtOrcamento  date,
    horarioOrcameno time,
    valor float,
    idMecanico int,
    idTabelaValores int,
    idVeiculo int,
    constraint fk_orcamento_Mecanico foreign key (idMecanico) references mecanico (idMecanico),
    constraint fk_orcameno_TabValor foreign key (idTabelaValores) references tabelavalor(idTabela),
    constraint fk_orcamento_veiculo foreign key (IdVeiculo) references veiculo (idVeiculo));
    
    insert into orcamento values
   
    (2,'2022-08-11','11:00',234.23,2,2,2);
    
    create table if not exists veiculo(
    idVeiculo int primary key,
    renavan int,
    marca varchar (50),
    placa varchar (50),
    chassi varchar (50),
    idVcliente int,
    idVMecanico int,
    constraint fk_veiculo_cliente foreign key (idVcliente) references cliente (idcliente),
    constraint fk_veiculo_Mecanico foreign key (idVMecanico) references mecanico (idMecanico));
    
    insert into veiculo values
    (2,123,'Wlks','837hdhdj','djdjdj23',2,2);
    
select * from cliente;

select  * from cliente

/* Where operadores lógicos*/
where CPF = '123' AND nome ='Lula'and Rua = 'Rua Bonito' ;
select * from funcionario;

/* Ordenar atraves atraves do id*/
select idFuncionario,nome, profissao as experiencia
from funcionario 
where idFuncionario between 1 and 2
order by idFuncionario asc;

select * from funcionario;
select * from cliente;

/*Usando Join  Dessa forma filtro é mais robustro. */
select f.idfuncionario as func , m.idmecanico as mecProf,
m.NomeMec, f.profissao
from funcionario as f, mecanico as m
where f.idFuncionario = m.idMecanico;

select * from tabelavalor;
insert into tabelavalor values
(6,'132','127','128','234'),
(7,'131','157','128','34'),
(8,'142','157','168','214');


/*Funções de agragações*/
select 
max(valorpeça) as maximoValorPeca,
min(valorpeça) as minimovalorpeça,
avg(valorpeça) as mediavalorpeça,
sum(valorpeça) as somavalorpeça,
count(valorpeça) as contagem 
from tabelavalor
where idTabela = '1';

select categoria, count(quantidade ) as totalQuantidade
from estoque
group by categoria
order by totalQuantidade desc;


 select valorResvisao, tipo
 from tabelavalor inner join itemestoque on IdEstoque = idTabela;







   
   
   
