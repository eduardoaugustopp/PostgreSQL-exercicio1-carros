CREATE TABLE carro(
    id SERIAL,
    titulo VARCHAR(255),
    chassi CHAR(17),
    preco NUMERIC(12,2),
    autor VARCHAR(255),
    imagem TEXT,
    alt TEXT,
    quantidade INTEGER,
    categoria VARCHAR(255),
    comprimento REAL,
    disponivel BOOLEAN,
    data_cadastro DATE,
    hora_cadastro TIME,
    cadastrado_em TIMESTAMP
);

SELECT NOW();

SELECT * FROM carro;

INSERT INTO carro (
    titulo, chassi, preco, autor, imagem, alt, quantidade, categoria, comprimento, disponivel, data_cadastro, hora_cadastro, cadastrado_em
) VALUES (
    'Fiat Mobi: O carro acessível para todos',
    'ZFA3120000J123456',
    69994.00,
    'Fiat',
    'https://s2-autoesporte.glbimg.com/SgMuqnuUHhNS2GH-orVgtr4OU8I=/0x0:3200x1989/888x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_cf9d035bf26b4646b105bd958f32089d/internal_photos/bs/2021/Q/M/aPi972S6ecHzFRtZQiWw/negs.jpg',
    'Foto do Fiat Mobi',
    50,
    'carro popular',
    3.56,
    TRUE,
    '2024-08-01',
    '14:30:00',
    '2024-08-01 14:30:00'
);

SELECT * FROM carro;

SELECT * FROM carro WHERE id = 1;

UPDATE carro
SET preco = 74999.00,
    quantidade = 45
WHERE id = 1;

SELECT titulo AS "Fiat Mobi: O carro acessível para todos",
       chassi,
       preco AS custo
FROM carro;

INSERT INTO carro (titulo) VALUES ('Audi e-tron GT: Desempenho ecológico com estilo');
INSERT INTO carro (titulo) VALUES ('Volkswagen Gol: O clássico nacional');
INSERT INTO carro (titulo) VALUES ('Chevrolet Onix: Conforto e economia em um só carro');
INSERT INTO carro (titulo) VALUES ('Ford Ka: Tecnologia e praticidade para o dia a dia');

CREATE TABLE estacionamento (
    id INTEGER PRIMARY KEY,
    nome VARCHAR(255) NOT NULL
);

INSERT INTO estacionamento (id, nome) VALUES (1, 'Estacionamento Central');
INSERT INTO estacionamento (id, nome) VALUES (2, 'Estacionamento Parque');

SELECT * FROM estacionamento;

CREATE TABLE carro_estacionamento (
    carro_id INTEGER,
    estacionamento_id INTEGER,
    PRIMARY KEY (carro_id, estacionamento_id),
    FOREIGN KEY (carro_id) REFERENCES carro (id),
    FOREIGN KEY (estacionamento_id) REFERENCES estacionamento (id)
);

INSERT INTO estacionamento (id, nome) VALUES (3, 'Estacionamento Nova Era');

INSERT INTO carro_estacionamento (carro_id, estacionamento_id) VALUES (1, 1);
INSERT INTO carro_estacionamento (carro_id, estacionamento_id) VALUES (2, 1);
INSERT INTO carro_estacionamento (carro_id, estacionamento_id) VALUES (3, 1);
INSERT INTO carro_estacionamento (carro_id, estacionamento_id) VALUES (1, 3);

SELECT * FROM estacionamento;

UPDATE estacionamento
SET nome = 'Estacionamento Nova Era'
WHERE id = 3;

SELECT * FROM carro;

SELECT * FROM estacionamento;

SELECT * 
FROM carro
JOIN carro_estacionamento ON carro_estacionamento.carro_id = carro.id;

SELECT * 
FROM carro
JOIN carro_estacionamento ON carro_estacionamento.carro_id = carro.id
JOIN estacionamento ON estacionamento.id = carro_estacionamento.estacionamento_id;

INSERT INTO carro_estacionamento (carro_id, estacionamento_id) VALUES (2,2);

SELECT carro.titulo,
       estacionamento.nome
FROM carro
JOIN carro_estacionamento ON carro_estacionamento.carro_id = carro.id
JOIN estacionamento ON estacionamento.id = carro_estacionamento.estacionamento_id;

SELECT carro.titulo AS carro,
       estacionamento.nome AS estacionamento
FROM carro
JOIN carro_estacionamento ON carro_estacionamento.carro_id = carro.id
JOIN estacionamento ON estacionamento.id = carro_estacionamento.estacionamento_id;

SELECT carro.titulo AS carro_nome,
       estacionamento.nome AS estacionamento_nome
FROM carro
JOIN carro_estacionamento ON carro_estacionamento.carro_id = carro.id
JOIN estacionamento ON estacionamento.id = carro_estacionamento.estacionamento_id;

SELECT carro.titulo AS "Nome do carro",
       estacionamento.nome AS "Nome do estacionamento"
FROM carro
JOIN carro_estacionamento ON carro_estacionamento.carro_id = carro.id
JOIN estacionamento ON estacionamento.id = carro_estacionamento.estacionamento_id;

WITH RankedCarros AS (
    SELECT id, 
           ROW_NUMBER() OVER (PARTITION BY id ORDER BY id) AS rn
    FROM carro
)
SELECT id
FROM RankedCarros
WHERE rn > 1;

WITH RankedCarros AS (
    SELECT id, 
           ROW_NUMBER() OVER (PARTITION BY id ORDER BY id) AS rn
    FROM carro
)
DELETE FROM carro
WHERE id IN (
    SELECT id
    FROM RankedCarros
    WHERE rn > 1
);

SELECT * FROM carro;
SELECT * FROM estacionamento;
SELECT * FROM carro_estacionamento;

INSERT INTO carro (titulo) VALUES ('Jeep Renegade: Aventura e conforto na cidade e na estrada');

SELECT * FROM carro;

SELECT carro.titulo AS "Titulo do carro",
       estacionamento.nome AS "Titulo do estacionamento"
FROM carro
JOIN carro_estacionamento ON carro_estacionamento.carro_id = carro.id
JOIN estacionamento ON estacionamento.id = carro_estacionamento.estacionamento_id;

INSERT INTO estacionamento (id, nome) VALUES (4, 'Estacionamento Portal');

SELECT * FROM estacionamento;

SELECT carro.titulo AS "Titulo do carro",
       estacionamento.nome AS "Titulo do estacionamento"
FROM carro
LEFT JOIN carro_estacionamento ON carro_estacionamento.carro_id = carro.id
LEFT JOIN estacionamento ON estacionamento.id = carro_estacionamento.estacionamento_id;

SELECT carro.titulo AS "Titulo do carro",
       estacionamento.nome AS "Titulo do estacionamento"
FROM carro
RIGHT JOIN carro_estacionamento ON carro_estacionamento.carro_id = carro.id
RIGHT JOIN estacionamento ON estacionamento.id = carro_estacionamento.estacionamento_id;

SELECT carro.titulo AS "Titulo do carro",
       estacionamento.nome AS "Titulo do estacionamento"
FROM carro
FULL JOIN carro_estacionamento ON carro_estacionamento.carro_id = carro.id
FULL JOIN estacionamento ON estacionamento.id = carro_estacionamento.estacionamento_id;

SELECT carro.titulo AS "Titulo do carro",
       estacionamento.nome AS "Titulo do estacionamento"
FROM carro
CROSS JOIN estacionamento;

INSERT INTO carro (titulo) VALUES ('Honda WR-V: A robustez de um SUV');

SELECT *
FROM carro
WHERE id = 1;

CREATE TABLE vendedores (
    id SERIAL PRIMARY KEY,
    matricula VARCHAR(20),
    nome VARCHAR(255),
    sobrenome VARCHAR(255)
);

INSERT INTO vendedores (matricula, nome, sobrenome) VALUES('V001-2024','Carlos','Silva');
INSERT INTO vendedores (matricula, nome, sobrenome) VALUES('V002-2024','Ana','Pereira');
INSERT INTO vendedores (matricula, nome, sobrenome) VALUES('V003-2024','Pedro','Alves');
INSERT INTO vendedores (matricula, nome, sobrenome) VALUES('V004-2024','Maria','Costa');
INSERT INTO vendedores (matricula, nome, sobrenome) VALUES('V005-2024','Julia','Santos');
INSERT INTO vendedores (matricula, nome, sobrenome) VALUES('V006-2024','Roberto','Lima');

SELECT * FROM vendedores;

SELECT *
FROM vendedores
ORDER BY nome;

SELECT *
FROM vendedores
ORDER BY nome DESC;

SELECT *
FROM vendedores
ORDER BY nome, matricula;

SELECT *
FROM vendedores
ORDER BY nome, matricula DESC;

SELECT *
FROM vendedores
ORDER BY 4;

SELECT *
FROM vendedores
ORDER BY 3, 4, 2;

INSERT INTO vendedores (matricula, nome, sobrenome) VALUES('V007-2024','Julia','Oliveira');

SELECT *
FROM vendedores
ORDER BY 3, 4, 2;

SELECT *
FROM vendedores
ORDER BY 4 DESC, nome DESC, 2 ASC;

SELECT *
FROM vendedores
ORDER BY 4 DESC, vendedores.nome DESC, 2 ASC;

SELECT
    carro.id AS carro_id,
    carro.titulo AS "Titulo do carro",
    estacionamento.id AS estacionamento_id,
    estacionamento.nome AS "Nome do estacionamento"
FROM carro
JOIN carro_estacionamento ON carro_estacionamento.carro_id = carro.id
JOIN estacionamento ON estacionamento.id = carro_estacionamento.estacionamento_id;

SELECT
    carro.id AS carro_id,
    carro.titulo AS "Titulo do carro",
    estacionamento.id AS estacionamento_id,
    estacionamento.nome AS "Nome do estacionamento"
FROM carro
JOIN carro_estacionamento ON carro_estacionamento.carro_id = carro.id
JOIN estacionamento ON estacionamento.id = carro_estacionamento.estacionamento_id
ORDER BY carro.titulo;

SELECT
    carro.id AS carro_id,
    carro.titulo AS "Titulo do carro",
    estacionamento.id AS estacionamento_id,
    estacionamento.nome AS "Nome do estacionamento"
FROM carro
JOIN carro_estacionamento ON carro_estacionamento.carro_id = carro.id
JOIN estacionamento ON estacionamento.id = carro_estacionamento.estacionamento_id
ORDER BY carro.titulo DESC;

SELECT
    carro.id AS carro_id,
    carro.titulo AS "Titulo do carro",
    estacionamento.id AS estacionamento_id,
    estacionamento.nome AS "Nome do estacionamento"
FROM carro
JOIN carro_estacionamento ON carro_estacionamento.carro_id = carro.id
JOIN estacionamento ON estacionamento.id = carro_estacionamento.estacionamento_id
ORDER BY carro.titulo DESC, estacionamento.nome;

SELECT * FROM estacionamento;
SELECT * FROM carro;

INSERT INTO carro_estacionamento (carro_id, estacionamento_id) VALUES (2, 4);

SELECT
    carro.id AS carro_id,
    carro.titulo AS "Titulo do carro",
    estacionamento.id AS estacionamento_id,
    estacionamento.nome AS "Nome do estacionamento"
FROM carro
JOIN carro_estacionamento ON carro_estacionamento.carro_id = carro.id
JOIN estacionamento ON estacionamento.id = carro_estacionamento.estacionamento_id
ORDER BY carro.titulo DESC, estacionamento.nome;

SELECT
    carro.id AS carro_id,
    carro.titulo AS "Titulo do carro",
    estacionamento.id AS estacionamento_id,
    estacionamento.nome AS "Nome do estacionamento"
FROM carro
JOIN carro_estacionamento ON carro_estacionamento.carro_id = carro.id
JOIN estacionamento ON estacionamento.id = carro_estacionamento.estacionamento_id
ORDER BY estacionamento.nome, carro.titulo DESC;

SELECT
    carro.id AS carro_id,
    carro.titulo AS "Titulo do carro",
    estacionamento.id AS estacionamento_id,
    estacionamento.nome AS "Nome do estacionamento"
FROM carro
JOIN carro_estacionamento ON carro_estacionamento.carro_id = carro.id
JOIN estacionamento ON estacionamento.id = carro_estacionamento.estacionamento_id
ORDER BY estacionamento.nome, carro.titulo;

SELECT * FROM vendedores;

SELECT COUNT(id) FROM vendedores;

SELECT COUNT(id), SUM(id) FROM vendedores;

SELECT COUNT(id), SUM(id), MAX(id) FROM vendedores;

SELECT COUNT(id), SUM(id), MAX(id), MIN(id) FROM vendedores;

SELECT COUNT(id), SUM(id), MAX(id), MIN(id), ROUND(AVG(id), 0) FROM vendedores;
