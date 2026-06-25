# Triangle Judgement

## 📌 Problem Statement
Write an SQL query to determine whether three given side lengths can form a valid triangle.

A triangle is valid if the sum of any two sides is greater than the third side.

## 💡 Approach
- Use the `CASE` statement to evaluate the triangle inequality conditions.
- If all three conditions are satisfied, return `'Yes'`.
- Otherwise, return `'No'`.

## ✅ SQL Solution

```sql
SELECT
    x,
    y,
    z,
    CASE
        WHEN x + y > z
         AND x + z > y
         AND y + z > x
        THEN 'Yes'
        ELSE 'No'
    END AS triangle
FROM Triangle;
```

## 📊 Complexity
- **Time Complexity:** `O(n)`
- **Space Complexity:** `O(1)`

## 🔑 Concepts Used
- SQL `CASE` Statement
- Conditional Expressions
- Triangle Inequality Theorem
