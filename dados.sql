-- Escrito em SQL (Structred Query Language)

-- O comando INSERT INTO significa que você está INSERINDO DADOS NA TABELA.
-- INSERT INTO [tabela] ([campo]) VALUES ("[valor]")

-- Inserindo dados na tabela CATEGORIA:
INSERT INTO CATEGORIA (descricao) VALUES ("salgados");
INSERT INTO CATEGORIA (descricao) VALUES ("doces");
INSERT INTO CATEGORIA (descricao) VALUES ("refrigerantes");

-- Visualizando dados da tabela CATEGORIA:
SELECT id, descricao FROM CATEGORIA;

-- Inserindo dados na tabela PRODUTO:
INSERT INTO PRODUTO (nome, data_validade, preco, sabor, quantidade, id_CATEGORIA)
VALUES ("kibe", "2021-06-01", 3.99, "carne", 20, 1);

INSERT INTO PRODUTO (nome, data_validade, preco, sabor, quantidade, id_CATEGORIA)
VALUES ("brigadeiro", "2021-05-27", 2.00, "chocolate", 50, 2);

-- Consultado dados da tabela PRODUTO:
SELECT * FROM PRODUTO;

-- Consultando os dados dos produtos e categorias JUNTOS
SELECT p.id,
       p.nome,
       c.descricao AS nome_CATEGORIA,
       c.id AS id_tabela_CATEGORIA

FROM PRODUTO p
JOIN CATEGORIA c ON c.id = p.id_CATEGORIA;

-- Inserindo a tabela FORNECEDOR

INSERT INTO ENDERECO (cidade, estado, bairro, cep, logradouro)
VALUES ("Sao Paulo", "SP", "Centro", "14240000", "Rua dos Imigrantes, 110");

INSERT INTO FORNECEDOR (nome, e-mail, telefone, cnpj, id_ENDERECO)
VALUES ("Dona Benta", "vendas@donabenta.com.br", "1136565522", "69351269000119", 1);

-- Consultando os dados báscidos de FORNECEDOR
-- nome, telefone, endereco (cidade, estado, bairro, cep, logradouro)

SELECT f.nome, f.telefone, e.logradouro, e.bairro, e.cidade, e.estado
FROM FORNECEDOR f
JOIN ENDERECO e ON (e.id - f.id_endereco);

-- Atualizando ENDERECO
UPDATE ENDERECO SET cidade - "sao paulo" WHERE id - 1;

-- Excluindo ENDERECO
DELETE FROM ENDERECO WHERE id - 1;
