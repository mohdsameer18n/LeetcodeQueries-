# 627. Swap Sex

**Difficulty:** Easy

## Problem Statement

Table: `Salary`

| Column Name | Type    |
| ----------- | ------- |
| id          | int     |
| name        | varchar |
| sex         | ENUM    |
| salary      | int     |

The `sex` column contains only two values:

* `'m'` → Male
* `'f'` → Female

Write a **single UPDATE statement** to swap all `'m'` values to `'f'` and all `'f'` values to `'m'`.

---

## Example

### Input

| id | name | sex | salary |
| -- | ---- | --- | ------ |
| 1  | A    | m   | 2500   |
| 2  | B    | f   | 1500   |
| 3  | C    | m   | 5500   |
| 4  | D    | f   | 500    |

### Output

| id | name | sex | salary |
| -- | ---- | --- | ------ |
| 1  | A    | f   | 2500   |
| 2  | B    | m   | 1500   |
| 3  | C    | f   | 5500   |
| 4  | D    | m   | 500    |

---

# Approach

Use the `CASE` expression to check each row:

* If `sex = 'm'`, change it to `'f'`.
* Otherwise, change it to `'m'`.

Since every row is updated once, this satisfies the requirement of using a **single UPDATE statement**.

---

# SQL Solution

```sql
UPDATE Salary
SET sex = CASE
            WHEN sex = 'm' THEN 'f'
            ELSE 'm'
          END;
```

---

# Explanation

### Before Update

| id | sex |
| -- | --- |
| 1  | m   |
| 2  | f   |
| 3  | m   |
| 4  | f   |

### After Update

| id | sex |
| -- | --- |
| 1  | f   |
| 2  | m   |
| 3  | f   |
| 4  | m   |

The `CASE` statement evaluates each row independently and swaps the values accordingly.

---

# Alternative Solution (MySQL)

```sql
UPDATE Salary
SET sex = IF(sex = 'm', 'f', 'm');
```

---

# Time Complexity

* **O(n)** — Every row is updated once.

# Space Complexity

* **O(1)** — No extra space is used.

---

# Key Interview Points

* Uses a **single UPDATE statement**.
* `CASE` is ANSI SQL and works across most database systems.
* No temporary table or additional column is required.
* This is the most commonly accepted interview solution.
