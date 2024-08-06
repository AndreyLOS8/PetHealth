-- Criei aqui o banco de dados DDL do projeto
create database LojaPet;

create table tb_enderecos (
    id_endereco int auto_increment primary key,
    cep varchar(9) not null,
    rua varchar(100) not null,
    bairro varchar(100) not null,
    cidade varchar(50) not null,
    estado varchar(50) not null,
    numero varchar(10),
    complemento varchar(255)
);

create table tb_contato (
    id_contato int auto_increment primary key,
    celular varchar(17) unique not null,
    email varchar(100) unique
 );

create table tb_produtos (
    id_produtos int auto_increment primary key,
    nome_produto varchar(100) not null,
    descricao varchar(255) not null,
    quantidade int not null,
    preco numeric(5,2) not null,
    id_fornecedor int unique
);

create table tb_usuarios (
    id_usuario int auto_increment primary key,
    nome varchar(50) not null,
    sobrenome varchar(50) not null,
    cpf varchar(11) unique not null,
    data_cadastro timestamp default NOW(),
    id_contato int,
    id_endereco int,
    id_credencial int,

    foreign key (id_contato) references tb_contato (id_contato),
    foreign key (id_endereco) references tb_enderecos (id_endereco)
);

create table tb_credenciais (
    id_credencial int auto_increment primary key,
    id_usuario int unique,
    email varchar(100) not null,
    senha varchar(255) not null
);

create table tb_pedidos (
    id_pedidos int auto_increment primary key,
    id_usuario int unique,
    data_pedido timestamp default NOW(),
    id_produtos int not null,
    quantidade int(100),
    preco numeric(5,2) not null,

    foreign key (id_usuario) references tb_usuarios(id_usuario),
    foreign key (id_produtos) references tb_produtos(id_produtos)
);

create table tb_fornecedores (
    id_fornecedor int auto_increment primary key,
    razao varchar(64) not null,
    cnpj varchar (14) not null,
    telefone varchar(12) not null,
    email varchar(128) not null
);
use LojaPet;