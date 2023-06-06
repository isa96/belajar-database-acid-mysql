CREATE DATABASE belajar_acid;

USE belajar_acid;

CREATE TABLE accounts
(
	id		VARCHAR(100) NOT NULL PRIMARY KEY,
	name	VARCHAR(100) NOT NULL,
	balance	BIGINT		 NOT NULL
) ENGINE InnoDB;

SELECT * FROM accounts;

/* Atomicity */
START TRANSACTION;

INSERT INTO accounts(id, name, balance)
VALUES ('aaa', 'aaa bbb', 1000000)

INSERT INTO accounts(id, name, balance)
VALUES ('ccc', 'ccc ddd', 2000000)

COMMIT;

START TRANSACTION;

DELETE FROM accounts WHERE id = 'aaa';

DELETE FROM accounts WHERE id = 'ccc';

SELECT * FROM accounts;

ROLLBACK;

SELECT * FROM accounts;

/*Consistency*/
START TRANSACTION;

UPDATE accounts SET name = null
WHERE id = 'aaa';

COMMIT;

SELECT * FROM accounts;

/*Isolation*/
START TRANSACTION;

SELECT * FROM accounts WHERE id IN ('aaa', 'ccc') FOR UPDATE;

UPDATE accounts SET balance = balance - 500000
WHERE id = 'aaa';

UPDATE accounts SET balance = balance + 500000
WHERE id = 'ccc';

COMMIT;

SELECT * FROM accounts;

/*Durability*/
START TRANSACTION;

SELECT * FROM accounts WHERE id IN ('aaa', 'ccc') FOR UPDATE;

UPDATE accounts SET balance = balance - 500000
WHERE id = 'aaa';

SELECT * FROM accounts;

/*shutdown mysql*/

UPDATE accounts SET balance = balance + 500000
WHERE id = 'ccc';

COMMIT;

SELECT * FROM accounts;
