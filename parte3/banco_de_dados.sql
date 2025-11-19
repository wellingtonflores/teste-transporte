-- ================================================
-- CRIAÇÃO DAS TABELAS 
-- Define a estrutura do banco de dados.
-- ================================================

-- Tabela de motoristas: Armazena informações sobre os condutores.
CREATE TABLE motoristas(
    id INT NOT NULL AUTO_INCREMENT, -- Chave primária: identificador único do motorista
    nome VARCHAR(100) NOT NULL,    -- Nome completo do motorista
    cnh VARCHAR(20) NOT NULL UNIQUE, -- Número da CNH (único, não pode haver duplicatas)
    telefone VARCHAR(15) NOT NULL,   -- Telefone de contato

    PRIMARY KEY (id) -- Define 'id' como chave primária
);

-- Tabela de clientes: Armazena informações sobre os destinatários das entregas.
CREATE TABLE clientes(
    id INT NOT NULL AUTO_INCREMENT, -- Chave primária: identificador único do cliente
    nome VARCHAR(100) NOT NULL,    -- Nome do cliente/empresa
    cidade VARCHAR(100) NOT NULL,  -- Cidade onde o cliente está localizado

    PRIMARY KEY (id) -- Define 'id' como chave primária
);

-- Tabela de entregas: Armazena os detalhes de cada transporte.
CREATE TABLE entregas(
    id INT NOT NULL AUTO_INCREMENT, -- Chave primária: identificador único da entrega
    data DATE NOT NULL,             -- Data prevista ou realizada da entrega
    destino VARCHAR(100) NOT NULL,  -- Endereço de destino
    status VARCHAR(50) NOT NULL,    -- Situação atual da entrega (Ex: 'Pendente', 'Em trânsito', 'Entregue')

    -- Chaves estrangeiras (Foreign Keys)
    id_motorista INT,               -- FK que liga a entrega ao motorista responsável
    id_cliente INT,                 -- FK que liga a entrega ao cliente/destinatário

    PRIMARY KEY (id), -- Define 'id' como chave primária
    -- Relacionamento: id_motorista referencia a tabela motoristas
    FOREIGN KEY (id_motorista) REFERENCES motoristas(id),
    -- Relacionamento: id_cliente referencia a tabela clientes
    FOREIGN KEY (id_cliente) REFERENCES clientes(id)
);

-- ================================================
-- INSERÇÃO DE DADOS
-- Popula as tabelas com registros iniciais.
-- ================================================

-- Inserir 3 motoristas: (nome, cnh, telefone)
INSERT INTO motoristas (nome, cnh, telefone) VALUES
('João Silva', '12345678900', '11999990000'),
('Maria Oliveira', '98765432100', '11988880000'),
('Carlos Santos', '55555555555', '11977770000');

-- Inserir 3 clientes: (nome, cidade)
INSERT INTO clientes (nome, cidade) VALUES
('Loja Central', 'São Paulo'),
('Mercado Bom Preço', 'Campinas'),
('Super Mix', 'Santos');

-- Inserir 3 entregas: (data, destino, status, id_motorista, id_cliente)
INSERT INTO entregas (data, destino, status, id_motorista, id_cliente) VALUES
('2025-02-10', 'Rua das Flores, 123', 'Entregue', 1, 1), -- Motorista 1 -> Cliente 1
('2025-02-11', 'Av. Paulista, 900', 'Em trânsito', 2, 2), -- Motorista 2 -> Cliente 2
('2025-02-12', 'Rua Afonso Pena, 45', 'Pendente', 3, 3);  -- Motorista 3 -> Cliente 3

-- ================================================
-- CONSULTAS DE VERIFICAÇÃO 
-- Demonstra o conteúdo das tabelas após a inserção.
-- ================================================

-- Visualizar todos os motoristas
SELECT * FROM motoristas;

-- Visualizar todos os clientes
SELECT * FROM clientes;

-- Visualizar todas as entregas
SELECT * FROM entregas;