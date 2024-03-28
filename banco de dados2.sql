CREATE DATABASE Ecommerce;
USE Ecommerce;

CREATE TABLE Cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(255) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    celular VARCHAR(20) NOT NULL,
    data_nascimento DATE NOT NULL
);


CREATE TABLE Produto (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    descricao TEXT,
    quantidade_estoque INT NOT NULL
);


CREATE TABLE Pedido (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    data_compra DATE NOT NULL,
    valor_total DECIMAL(10, 2) NOT NULL,
    data_estimada_entrega DATE NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);


CREATE TABLE ItemPedido (
    id_item INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT,
    id_produto INT,
    quantidade INT NOT NULL,
    valor_unitario DECIMAL(10, 2) NOT NULL,
    valor_total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido),
    FOREIGN KEY (id_produto) REFERENCES Produto(id_produto)
);


INSERT INTO Cliente (nome, endereco, email, celular, data_nascimento) VALUES
('João Silva', 'Rua A, 123', 'joao@email.com', '(11) 98765-4321', '1990-05-15'),
('Maria Oliveira', 'Rua B, 456', 'maria@email.com', '(11) 98765-4322', '1985-07-20'),
('Carlos Ferreira', 'Rua C, 789', 'carlos@email.com', '(11) 98765-4323', '1992-01-10'),
('Ana Souza', 'Rua D, 1011', 'ana@email.com', '(11) 98765-4324', '1988-11-25'),
('Pedro Santos', 'Rua E, 1213', 'pedro@email.com', '(11) 98765-4325', '1995-04-30'),
('Julia Lima', 'Rua F, 1415', 'julia@email.com', '(11) 98765-4326', '1993-08-05'),
('Roberto Costa', 'Rua G, 1617', 'roberto@email.com', '(11) 98765-4327', '1987-02-18'),
('Mariana Alves', 'Rua H, 1819', 'mariana@email.com', '(11) 98765-4328', '1994-06-12'),
('Fernanda Ribeiro', 'Rua I, 2021', 'fernanda@email.com', '(11) 98765-4329', '1991-09-15'),
('Lucas Gomes', 'Rua J, 2223', 'lucas@email.com', '(11) 98765-4330', '1996-03-20');

INSERT INTO Produto (nome, preco, descricao, quantidade_estoque) VALUES
('Produto 1', 100.50, 'Descrição do Produto 1', 50),
('Produto 2', 200.75, 'Descrição do Produto 2', 30),
('Produto 3', 50.25, 'Descrição do Produto 3', 80),
('Produto 4', 300.00, 'Descrição do Produto 4', 20),
('Produto 5', 150.00, 'Descrição do Produto 5', 60),
('Produto 6', 75.50, 'Descrição do Produto 6', 90),
('Produto 7', 250.50, 'Descrição do Produto 7', 40),
('Produto 8', 180.00, 'Descrição do Produto 8', 70),
('Produto 9', 90.25, 'Descrição do Produto 9', 100),
('Produto 10', 210.75, 'Descrição do Produto 10', 10);


INSERT INTO Pedido (id_cliente, data_compra, valor_total, data_estimada_entrega) VALUES
(1, '2024-03-27', 502.00, '2024-04-03'),
(2, '2024-03-26', 451.25, '2024-04-02'),
(3, '2024-03-25', 301.50, '2024-04-01'),
(4, '2024-03-24', 755.00, '2024-04-07'),
(5, '2024-03-23', 902.50, '2024-04-06');


INSERT INTO ItemPedido (id_pedido, id_produto, quantidade, valor_unitario, valor_total) VALUES
(1, 1, 2, 100.50, 201.00),
(1, 3, 3, 50.25, 150.75),
(2, 2, 1, 200.75, 200.75),
(2, 5, 4, 150.00, 600.00),
(3, 4, 2, 300.00, 600.00),
(3, 6, 5, 75.50, 377.50),
(4, 7, 3, 250.50, 751.50),
(4, 8, 2, 180.00, 360.00),
(5, 9, 4, 90.25, 361.00),
(5, 10, 1, 210.75, 210.75);


UPDATE Cliente SET email = 'joaosilva@email.com' WHERE id_cliente = 1;
UPDATE Produto SET quantidade_estoque = 45 WHERE id_produto = 3;
UPDATE Pedido SET valor_total = 510.00 WHERE id_pedido = 1;
UPDATE ItemPedido SET quantidade = 5 WHERE id_item = 6;


DELETE FROM Cliente WHERE id_cliente = 10;
DELETE FROM Produto WHERE id_produto = 10;