-- Tabela que armazena os produtos disponíveis
CREATE TABLE produtos (
  id_produtos TEXT PRIMARY KEY,                   -- Identificador único do produto
  nome VARCHAR(255),                              -- Nome do produto
  descricao VARCHAR(255),                         -- Descrição do produto
  preço DECIMAL(10,2),                            -- Preço unitário do produto
  categoria VARCHAR(50)                           -- Categoria ou tipo do produto
);

-- Tabela que armazena informações dos clientes
CREATE TABLE clientes(
  id_clientes TEXT PRIMARY KEY NOT NULL,          -- Identificador único do cliente
  nome VARCHAR(255),                              -- Nome completo do cliente
  telefone VARCHAR(50),                           -- Telefone de contato
  email VARCHAR(100) DEFAULT 'Cliente sem E-mail',-- Email, com valor padrão se não informado
  endereço VARCHAR(255)                           -- Endereço completo
);

-- Tabela que registra os pedidos feitos pelos clientes
CREATE TABLE pedidos(
  id_pedidos TEXT PRIMARY KEY,                    -- Identificador único do pedido
  datahora DATE,                                  -- Data do pedido
  status VARCHAR(50),                             -- Status do pedido (Ex: Em andamento, Concluído)
  idcliente TEXT,                                 -- Referência ao cliente que fez o pedido
  FOREIGN KEY (idcliente) REFERENCES clientes(id_clientes) ON DELETE CASCADE -- Remove pedidos se o cliente for deletado
);

-- Tabela intermediária que registra os itens de cada pedido
CREATE TABLE itenspedidos( 
  idpedidos TEXT,                                 -- Referência ao pedido
  idprodutos TEXT,                                -- Referência ao produto
  quantidade INT,                                 -- Quantidade de unidades do produto no pedido
  precounitario DECIMAL(10,2),                    -- Preço unitário do produto no momento da compra
  PRIMARY KEY (idpedidos, idprodutos),            -- Chave composta (cada produto por pedido)
  FOREIGN KEY (idpedidos) REFERENCES pedidos(id_pedidos) ON DELETE CASCADE,
  FOREIGN KEY (idprodutos) REFERENCES produtos(id_produtos) ON DELETE CASCADE
);

-- Tabela com informações dos colaboradores da empresa
CREATE TABLE colaboradores(
  id_colaboradores TEXT PRIMARY KEY,              -- Identificador único do colaborador
  nome VARCHAR(255) NOT NULL,                     -- Nome do colaborador
  cargo VARCHAR(100) NOT NULL,                    -- Cargo/função do colaborador
  datacontratacao DATE,                           -- Data de contratação
  telefone VARCHAR(50) NOT NULL,                  -- Telefone de contato
  email VARCHAR(100) NOT NULL,                    -- Email do colaborador
  rua VARCHAR(255) NOT NULL,                      -- Endereço: rua
  bairro VARCHAR(255) NOT NULL,                   -- Bairro
  cidade VARCHAR(255) NOT NULL,                   -- Cidade
  estado VARCHAR(255) NOT NULL,                   -- Estado
  cep VARCHAR(255) NOT NULL                       -- CEP
);

-- Tabela com os fornecedores parceiros da empresa
CREATE TABLE fornecedores(
  id_fornecedores TEXT PRIMARY KEY,               -- Identificador único do fornecedor
  nome VARCHAR(255) NOT NULL,                     -- Nome da empresa ou fornecedor
  contato VARCHAR(100) NOT NULL,                  -- Nome da pessoa de contato
  telefone VARCHAR(50) NOT NULL,                  -- Telefone de contato
  email VARCHAR(100) NOT NULL,                    -- Email de contato
  rua VARCHAR(255) NOT NULL,                      -- Endereço: rua
  bairro VARCHAR(255) NOT NULL,                   -- Bairro
  cidade VARCHAR(255) NOT NULL,                   -- Cidade
  estado VARCHAR(255) NOT NULL,                   -- Estado
  cep VARCHAR(255) NOT NULL                       -- CEP
);
