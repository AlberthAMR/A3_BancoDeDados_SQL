CREATE TABLE Usuario (
  usuario_id   INT AUTO_INCREMENT PRIMARY KEY,
  nome         VARCHAR(100) NOT NULL,
  email        VARCHAR(150) NOT NULL UNIQUE,
  criado_em    DATETIME    NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Carteira (
  carteira_id  INT AUTO_INCREMENT PRIMARY KEY,
  usuario_id   INT NOT NULL,
  nome         VARCHAR(100) NOT NULL,
  saldo        DECIMAL(18,8) NOT NULL DEFAULT 0.0,
  criado_em    DATETIME       NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (usuario_id) REFERENCES Usuario(usuario_id)
);

CREATE TABLE Criptomoeda (
  cripto_id    INT AUTO_INCREMENT PRIMARY KEY,
  nome         VARCHAR(50)  NOT NULL,
  simbolo      VARCHAR(10)  NOT NULL UNIQUE
);

CREATE TABLE Transacao (
  transacao_id    INT AUTO_INCREMENT PRIMARY KEY,
  carteira_id     INT NOT NULL,
  cripto_id       INT NOT NULL,
  quantidade      DECIMAL(18,8) NOT NULL,
  valor_total     DECIMAL(18,2) NOT NULL,
  data_transacao DATETIME      NOT NULL,
  FOREIGN KEY (carteira_id) REFERENCES Carteira(carteira_id),
  FOREIGN KEY (cripto_id)   REFERENCES Criptomoeda(cripto_id)
);

INSERT INTO Usuario (nome, email) VALUES
  ('Ana Silva',    'ana.silva@example.com'),
  ('Bruno Costa',  'bruno.costa@example.com'),
  ('Carla Pereira','carla.pereira@example.com');

INSERT INTO Carteira (usuario_id, nome, saldo) VALUES
  (1, 'Carteira Pessoal',  0.0),
  (1, 'Carteira de Trading', 0.0),
  (2, 'Carteira Principal', 0.0),
  (3, 'Carteira Reserva',   0.0);

INSERT INTO Criptomoeda (nome, simbolo) VALUES
  ('Bitcoin',  'BTC'),
  ('Ethereum', 'ETH'),
  ('Ripple',   'XRP');

INSERT INTO Transacao (carteira_id, cripto_id, quantidade, valor_total, data_transacao) VALUES
  (1, 1, 0.02500000,  1250.00, '2025-05-20 09:15:00'),
  (1, 2, 0.10000000,   300.00, '2025-05-21 14:30:00'),
  (2, 1, 0.01000000,   500.00, '2025-05-22 11:45:00'),
  (3, 3, 50.00000000,  750.00, '2025-05-23 16:00:00'),
  (4, 2, 0.05000000,   150.00, '2025-05-24 10:20:00');
  
  SELECT t.data_transacao, c.simbolo, t.quantidade, t.valor_total
FROM Transacao AS t
JOIN Carteira   AS w ON t.carteira_id = w.carteira_id
JOIN Usuario    AS u ON w.usuario_id    = u.usuario_id
JOIN Criptomoeda AS c ON t.cripto_id     = c.cripto_id
WHERE u.usuario_id = 1
ORDER BY t.data_transacao;

SELECT w.nome AS carteira, SUM(t.valor_total) AS total_investido
FROM Transacao AS t
JOIN Carteira   AS w ON t.carteira_id = w.carteira_id
GROUP BY w.carteira_id;

SELECT c.simbolo, SUM(t.quantidade) AS total_quantidade
FROM Transacao   AS t
JOIN Criptomoeda AS c ON t.cripto_id = c.cripto_id
GROUP BY c.cripto_id;