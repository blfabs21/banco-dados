CREATE DATABASE MINI_MUNDO;
USE MINI_MUNDO;

create table cliente(
_cliente int PRIMARY KEY auto_increment NOT NULL,
 nome varchar (35) not null,
 email varchar (70) not null,
 endereço varchar (30) not null,
 celular tinyint (13) not null
);

create table produtos (
id produto int auto_increment NOT NULL,
 nome varchar (30),
 preço decimal (10),
 descrição varchar (100),
 qtd varchar (255) ,
primary key (id_produto),
foreign key(id _cliente) references clientes(id _cliente)
);

create table pedidos (
id_pedidos int auto_increment,
 num_pedido bigint(300),
 data_compra varchar (8),
 valor_total decimal (30),
 data_entrega date,
 primary key(id_pedidos),
 foreign key(id_produtos) references produtos (id_produtos)
) ;

create table itens(
id_itens int auto_increment,
qtd varchar (255),
 vu decimal(10),
 vt decimal(10),
 primary key(id_itens),
 foreign key(id_pedidos) references pedidos(id_pedidos)	
 );