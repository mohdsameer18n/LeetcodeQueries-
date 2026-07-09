# 177. Nth Highest Salary

## Problem Statement

Given an `Employee` table:

| Column Name | Type |
| ------------ | ---- |
| id | int |
| salary | int |

- `id` is the primary key.
- Each row contains the salary of an employee.

Write a SQL query to find the **nth highest distinct salary**. If there are fewer than **n** distinct salaries, return **NULL**.

---

## Approach

1. Remove duplicate salaries using `DISTINCT`.
2. Sort the salaries in descending order.
3. Convert `N` to zero-based indexing by subtracting `1`.
4. Use `LIMIT 1 OFFSET N` to fetch the required salary.
5. If the offset exceeds the available rows, SQL automatically returns `NULL`.

---

## SQL Solution

```sql
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
    SET N = N - 1;

    RETURN (
        SELECT DISTINCT salary
        FROM Employee
        ORDER BY salary DESC
        LIMIT 1 OFFSET N
    );
END
```

---

## Example

### Input

| id | salary |
|----|--------|
| 1 | 100 |
| 2 | 200 |
| 3 | 300 |

`N = 2`

### Output

| getNthHighestSalary(2) |
|-------------------------|
| 200 |

---

## Dry Run

Distinct salaries:

```
100
200
300
```

After sorting in descending order:

```
300
200
100
```

For `N = 2`:

- Convert to zero-based index: `N - 1 = 1`
- `OFFSET 1` points to `200`

Result:

```
200
```

---

## Complexity Analysis

- **Time Complexity:** `O(n log n)` (sorting distinct salaries)
- **Space Complexity:** `O(n)` (for storing distinct salaries)

---

## Key SQL Concepts Used

- `DISTINCT` – Removes duplicate salaries.
- `ORDER BY DESC` – Sorts salaries from highest to lowest.
- `LIMIT` – Returns only one row.
- `OFFSET` – Skips the first `N-1` rows.
- SQL Functions (`CREATE FUNCTION`) – Encapsulates the query for reuse.

---

## Takeaways

- Always use `DISTINCT` because the problem asks for the **nth highest distinct salary**.
- `OFFSET` starts from `0`, so subtract `1` from `N`.
- If the requested rank does not exist, the function naturally returns `NULL`.
