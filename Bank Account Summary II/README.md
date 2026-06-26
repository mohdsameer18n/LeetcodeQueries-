# Bank Account Summary II

## Problem
Write an SQL query to find the **name** and **balance** of users whose account balance is **greater than 10000**.

The account balance is the **sum of all transaction amounts** associated with the user's account.

## Approach
- Join the `Users` and `Transactions` tables using the `account` column.
- Group the records by user account and name.
- Calculate each user's balance using `SUM(amount)`.
- Use the `HAVING` clause to keep only users with a balance greater than **10000**.

## SQL Query

```sql
SELECT
    u.name,
    SUM(t.amount) AS balance
FROM Users u
JOIN Transactions t
ON u.account = t.account
GROUP BY u.account, u.name
HAVING SUM(t.amount) > 10000;
```

## Explanation
- `JOIN` combines user information with their transactions.
- `SUM(t.amount)` computes the total balance for each account.
- `GROUP BY` ensures all transactions of a user are aggregated together.
- `HAVING SUM(t.amount) > 10000` filters users whose balance exceeds **10000**.

## Complexity Analysis
- **Time Complexity:** `O(n)`
- **Space Complexity:** `O(1)` (excluding the output)
