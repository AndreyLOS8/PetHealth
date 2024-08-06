use LojaPet;

-- O email e senha serão fictícios
insert into tb_credenciais(email, senha)
values ('ana.mantovani@peth.com.br', 'Password123');

insert into tb_credenciais(email, senha)
values ('tiallysson@peth.com.br', 'Password345');

-- Registro de endereços
insert into tb_enderecos(cep, rua, bairro, cidade, estado, numero, complemento)
values ('13800-971','Rua Marciliano','Centro','Mogi Mirim','SP','538','casa');

-- Registro de contato
insert into tb_contato(celular, email)
values ('(19)99887-7665','ana.mantovani@peth.com.br');

-- Registro de produtos
insert into tb_produtos(nome_produto, descricao, preco, quantidade)
values 
(
    'Vermífugo Vermivet Composto 600mg para cães', 
    'Vermifugo para tratamento e controle de verminoses para cães', 
    9.90, 100
), 

(
    'Antipulgas e Carrapatos para cães de 30 a 60kg', 
    'Proteção contra pulgas, carrapatos, sarna e vermes',
    69.90, 100
),

(
    'Vermífugo Vetmax Plus 700mg para cães e gatos',
    'Indicado no tratamento de vermes gastrointestinais em cães e gatos',
    19.90, 100
),

(   
    'Suplemento Nutrafases Ômega 3 para Cães – 60 Tabletes',
    'Suplemento alimentar, que contém Nano Ômega 3 e o ômega 3 micronizado, extraido
    do óleo de peixe de águas frias, ricos em DHA e EPA e vitamina A;
    Ideal para cães de qualquer idade',
    53.60, 100
),

(
    'Endectocida Mectimax Ivermectina 12mg',
    'É indicado para cães em tratamento da sarna sacóptica, sarna demodécica, otoacaríase e verminoses',
    9.90, 100
),

(
    'Vermífugo Vetmax Plus 700mg para cães e gatos',
    'Amplo espectro para combate de vermes chatos e redondos em cães e gatos.',
    19.90, 100
),

(
    'Antipulgas e Carrapatos Simparic para cães de 20 a 40kg',
    'Combate carrapatos, pulgas e sarnas. É eficaz, seguro e possui ação rápida
    e sustentada por até 35 dias',
    120.00, 100
),

(
    'Antipulgas e Carrapatos para cães Frontline TopStop 20 à 40kg',
    'Proteção mensal contra pulgas, carrapatos e piolhos mastigadores',
    20.90, 100
),

(
    'Brevecto Antipulgas e Carrapatos 40 a 56kg',
    'Controle e prevenção de infestação de pulgas e carrapatos por um longo período.
    Com ação rápida e prolongada por 12 semanas, seu cachorro ou gato ficam livres
    do incômodo e das doenças causadas por esses parasitas.',
    125.90, 100
);