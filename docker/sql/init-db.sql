CREATE TABLE clients
(
    id      SERIAL PRIMARY KEY,
    limit   INTEGER NOT NULL,
    balance INTEGER NOT NULL DEFAULT 0
);

CREATE TABLE transactions
(
    transaction_id SERIAL PRIMARY KEY,
    client_id      INTEGER   NOT NULL,
    type           VARCHAR(1) CHECK (type IN ('c', 'd')),
    amount         INTEGER   NOT NULL CHECK (amount <= 99999999),
    description    VARCHAR(10),
    timestamp      TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (client_id) REFERENCES clients (id)
);

INSERT INTO clients (id, "limit", balance)
VALUES (1, 100000, 0),
       (2, 80000, 0),
       (3, 1000000, 0),
       (4, 10000000, 0),
       (5, 500000, 0);

CREATE INDEX idx_transactions_client_id ON transactions (client_id);
