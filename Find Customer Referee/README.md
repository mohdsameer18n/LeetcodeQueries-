# Find Customer Referee

## Problem Statement

Write an SQL query to report the names of customers who are **not referred by the customer with id = 2**.

Return the result table in **any order**.

---

## Table Schema

### Customer

| Column Name | Type |
|-------------|------|
| id | int |
| name | varchar |
| referee_id | int |

- `id` is the primary key.
- Each row indicates the ID of a customer, their name, and the ID of the customer who referred them.

---

## Example

### Input

| id | name | referee_id |
|----|------|------------|
| 1 | Will | NULL |
| 2 | Jane | NULL |
| 3 | Alex | 2 |
| 4 | Bill | NULL |
| 5 | Zack | 1 |
| 6 | Mark | 2 |

### Output

| name |
|------|
| Will |
| Jane |
| Bill |
| Zack |

### Explanation

- Customers **Alex** and **Mark** were referred by customer `2`, so they are excluded.
- Customers with a different referee or no referee (`NULL`) are included.

---

## Solution

```sql
SELECT name
FROM Customer
WHERE referee_id <> 2
   OR referee_id IS NULL;
```

---

## Approach

1. Select the `name` column from the `Customer` table.
2. Filter out customers whose `referee_id` is `2`.
3. Include customers whose `referee_id` is `NULL` because they were not referred by anyone.

---

## Complexity Analysis

- **Time Complexity:** O(n)
- **Space Complexity:** O(1)

Where `n` is the number of rows in the `Customer` table.

---

## Key Concepts

- SQL `WHERE` clause
- Handling `NULL` values using `IS NULL`
- Filtering records with comparison operators

---

## LeetCode

**Problem:** Find Customer Referee  
**Difficulty:** Easy  
**Topic:** SQL
