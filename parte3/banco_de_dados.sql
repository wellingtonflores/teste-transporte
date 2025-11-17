-- ================================
-- CRIAÇÃO DAS TABELAS (DDL)
-- ================================

-- Tabela de motoristas
CREATE TABLE motoristas(
    id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cnh VARCHAR(20) NOT NULL UNIQUE,
    telefone VARCHAR(15) NOT NULL,

    PRIMARY KEY (id)
);

-- Tabela de clientes
CREATE TABLE clientes(
    id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cidade VARCHAR(100) NOT NULL,

    PRIMARY KEY (id)
);

-- Tabela de entregas
CREATE TABLE entregas(
    id INT NOT NULL AUTO_INCREMENT,
    data DATE NOT NULL,
    destino VARCHAR(100) NOT NULL,
    status VARCHAR(50) NOT NULL,

    -- Chaves estrangeiras
    id_motorista INT,
    id_cliente INT,

    PRIMARY KEY (id),
    FOREIGN KEY (id_motorista) REFERENCES motoristas(id),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id)
);

-- ================================
-- INSERÇÃO DE DADOS
-- ================================

-- Inserir 3 motoristas
INSERT INTO motoristas (nome, cnh, telefone) VALUES
('João Silva', '12345678900', '11999990000'),
('Maria Oliveira', '98765432100', '11988880000'),
('Carlos Santos', '55555555555', '11977770000');

-- Inserir 3 clientes
INSERT INTO clientes (nome, cidade) VALUES
('Loja Central', 'São Paulo'),
('Mercado Bom Preço', 'Campinas'),
('Super Mix', 'Santos');

-- Inserir 3 entregas
INSERT INTO entregas (data, destino, status, id_motorista, id_cliente) VALUES
('2025-02-10', 'Rua das Flores, 123', 'Entregue', 1, 1),
('2025-02-11', 'Av. Paulista, 900', 'Em trânsito', 2, 2),
('2025-02-12', 'Rua Afonso Pena, 45', 'Pendente', 3, 3);

-- Visualizar todos os motoristas, clientes e entregas
SELECT * FROM motoristas;
SELECT * FROM clientes;
SELECT * FROM entregas;