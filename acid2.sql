/*Isolation*/
START TRANSACTION;

SELECT * FROM accounts WHERE id IN ('aaa', 'ccc') FOR UPDATE;

UPDATE accounts SET balance = balance - 500000
WHERE id = 'aaa';

UPDATE accounts SET balance = balance + 500000
WHERE id = 'ccc';

COMMIT;

SELECT * FROM accounts;