# 619.Biggest Single Number

## Problem

A **single number** is a number that appears only once in the `MyNumbers` table.

Write an SQL query to report the **largest single number**. If there is no single number, report `null`.

Return the result table as shown in the example.

---

## Example

### Input

**MyNumbers**

| num |
|-----|
| 8 |
| 8 |
| 3 |
| 3 |
| 1 |
| 4 |
| 5 |
| 6 |

### Output

| num |
|-----|
| 6 |

### Explanation

The numbers `8` and `3` appear more than once, so they are not single numbers.

The numbers `1`, `4`, `5`, and `6` appear exactly once.

The largest single number is `6`.

---

## SQL Query

```sql
SELECT MAX(num) AS num
FROM (
    SELECT num
    FROM MyNumbers
    GROUP BY num
    HAVING COUNT(*) = 1
) AS single_numbers;
