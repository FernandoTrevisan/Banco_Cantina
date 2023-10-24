create database cantina

use cantina

create table CATEGORIA (
   id int auto_increment,
   Descricao varchar(255),
   primary key(id)
);

create table PRODUTO (
   id int auto_increment,
   nome varchar(150),
   data_validade date,
   preco double,
   sabor varchar(100),
   quantidade double,
   id_CATEGORIA int,
   primary key(id),
   foreign key (id_CATEGORIA) references CATEGORIA(id)
);

create table FORNECEDOR (
   id int auto_increment,
   cnpj char(14),
   e-mail varchar(150),
   nome varchar(150),
   telefone varchar(),
   id_ENDERECO int,
   primary key(id),
   foreign key (id_ENDERECO) references ENDERECO(id),
);

create table ENDERECO (
   id int auto_increment,
   cidade varchar(40),
   bairro varchar(50),
   logradouro varchar(150),
   cep char(8),
   estado char(2),
   primary key(id)
);

create trigger PRODUTO_FORNECEDOR_assoc (
   id_PRODUTO int,
   id_FORNECEDOR int,
   primary key (id_PRODUTO, id_FORNECEDOR),
   foreign key (id_PRODUTO) references PRODUTO(id),
   foreign key (id_FORNECEDOR) references FORNECEDOR(id)
);

create table DESPESA (
   id int auto_increment,
   valor double,
   descricao varchar(255),
   data_vencimento date,
   primary key(id)
);

create table PAGAMENTO (
   id int auto_increment,
   valor double,
   data_pagamento date,
   primary key(id),
   foreign key (id_DESPESA) references DESPESA(id),
   foreign key (id_FORNECEDOR) references FORNECEDOR(id)
);

create table ITEM (
   id int auto_increment,
   valor_total double,
   valor_unitario double,
   desconto double,
   quantidade double,
   primary key(id),
   foreign key (id_VENDA) references VENDA(id),
   foreign key (id_PRODUTO) references PRODUTO(id)
);

create table VENDA (
   id auto_increment,
   data_venda date,
   primary key(id),
   foreign key (id_CLIENTE) references CLIENTE(id),
   foreign key (id_FUNCIONARIO) references FUNCIONARIO(id)
);

create table RECEBIMENTO (
   id auto_increment,
   valor double,
   data_recebimento date,
   forma_recebimento varchar(255),
   primary key(id),
   foreign key (id_VENDA) references VENDA(id)
);

create table CLIENTE (
   id auto increment,
   rg char(9),
   cpf char(11),
   data_nascimento date,
   genero varchar(40),
   nome varchar(150),
   primary key(id),
   foreign key (id_FUNCIONARIO) references FUNCIONARIO(id),
   foreign key (id_ENDERECO) references ENDERECO(id)
);

create table FUNCIONARIO (
   id auto increment,
   telefone varchar(255),
   nome varchar(150),
   genero varchar(40),
   endereco varchar(255),
   primary key(id),
   foreign key (id_CARGO) references CARGO(id),
   foreign key (id_ENDERECO) references ENDERECO(id)
);

create table CARGO (
   id auto increment,
   tipo varchar(255),
   descricao varchar(255),
   primary key(id)
);

create trigger PAGAMENTO_FUNCIONARIO_assoc (
   id_PAGAMENTO int,
   id_FORNECEDOR int,
   primary key (id_PAGAMENTO, id_FUNCIONARIO)
   foreign key (id_PAGAMENTO) references PAGAMENTO(id),
   foreign key (id_FUNCIONARIO) references FUNCIONARIO(id)
);