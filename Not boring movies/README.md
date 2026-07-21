# 620. Not Boring Movies

## Problem Statement

Given a table `Cinema` containing movie details, write an SQL query to:

- Select movies with **odd-numbered IDs**.
- Exclude movies whose `description` is **"boring"**.
- Return the result sorted by **rating in descending order**.

---

## SQL Query

```sql
SELECT *
FROM Cinema
WHERE id % 2 = 1
  AND description <> 'boring'
ORDER BY rating DESC;
```

---

## Explanation

### 1. Filter Odd IDs

```sql
id % 2 = 1
```

- `%` is the modulo operator.
- Odd numbers leave a remainder of `1` when divided by `2`.

Example:

| ID | ID % 2 | Selected |
|----|---------|----------|
| 1 | 1 | ✅ |
| 2 | 0 | ❌ |
| 3 | 1 | ✅ |
| 4 | 0 | ❌ |
| 5 | 1 | ✅ |

---

### 2. Exclude Boring Movies

```sql
description <> 'boring'
```

- `<>` means **not equal to**.
- Removes movies whose description is exactly `"boring"`.

---

### 3. Sort by Rating

```sql
ORDER BY rating DESC;
```

- `DESC` sorts ratings from **highest to lowest**.

---

## Example

### Input

| id | movie | description | rating |
|----|------------|-------------|--------|
| 1 | War | great 3D | 8.9 |
| 2 | Science | fiction | 8.5 |
| 3 | Irish | boring | 6.2 |
| 4 | Ice Song | Fantasy | 8.6 |
| 5 | House Card | Interesting | 9.1 |

### Filtering

- Odd IDs → **1, 3, 5**
- Remove description = `"boring"` → **1, 5**
- Sort by rating (descending)

### Output

| id | movie | description | rating |
|----|------------|-------------|--------|
| 5 | House Card | Interesting | 9.1 |
| 1 | War | great 3D | 8.9 |

---

## Complexity Analysis

- **Time Complexity:** `O(n log n)` (sorting)
- **Space Complexity:** `O(1)` (excluding output)

---

## Key SQL Concepts

- `SELECT`
- `WHERE`
- Modulo Operator (`%`)
- Not Equal Operator (`<>`)
- `ORDER BY`
- `DESC`

---

## Takeaway

The solution first filters movies with **odd IDs**, removes those with the description **"boring"**, and finally sorts the remaining movies by **rating in descending order**.
