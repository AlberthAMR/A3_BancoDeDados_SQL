# 💰 Sistema de Carteiras de Criptomoedas

Este repositório contém um script SQL que define a estrutura e os dados iniciais para um sistema de gerenciamento de carteiras de criptomoedas. Ele inclui o controle de usuários, carteiras, criptomoedas e transações associadas.

O grupo contém 4 integrantes, são eles:
Alberth Assis Macedo Rocha
Leonardo Alves Silva
João Victor Duarte Alves
Livia Steise Gaspar Diniz

## 🗂 Tabelas do Banco de Dados

- **Usuario**: Armazena os dados dos usuários (nome, e-mail, data de criação).
- **Carteira**: Registra as carteiras associadas aos usuários, com saldo e nome personalizado.
- **Criptomoeda**: Contém os dados das moedas digitais (nome e símbolo).
- **Transacao**: Representa as transações realizadas em cada carteira com determinada criptomoeda.

## 🔗 Relacionamentos

- Cada carteira pertence a um único usuário (`usuario_id`).
- Cada transação está ligada a uma carteira e a uma criptomoeda.

## 🧪 Como usar

1. Abra o MySQL Workbench (ou outro gerenciador de banco de dados).
2. Crie um novo schema, por exemplo `criptomoedas`.
3. Importe ou execute o arquivo `banco.sql` para criar as tabelas e popular os dados iniciais.

## 📂 Arquivos

- `banco.sql`: Contém todas as instruções `CREATE TABLE` e `INSERT INTO` com os dados iniciais.
- `diagrama.png`: (opcional) Imagem com o diagrama ER do banco de dados.

## 📝 Exemplo de uso

Você pode utilizar esse banco para praticar consultas SQL como:
```sql
-- Listar transações de um usuário específico
SELECT u.nome, c.nome AS carteira, cr.nome AS cripto, t.quantidade, t.valor_total
FROM Transacao t
JOIN Carteira c ON t.carteira_id = c.carteira_id
JOIN Usuario u ON c.usuario_id = u.usuario_id
JOIN Criptomoeda cr ON t.cripto_id = cr.cripto_id
WHERE u.usuario_id = 1;
```

---

⚠️ **Nota**: Esse banco é fictício e serve apenas para fins educacionais.
