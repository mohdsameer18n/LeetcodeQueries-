# List the Products Ordered in a Period

## Problem

Write an SQL query to find the products that have at least **100 units ordered in February 2020**.

Return the result table in any order.

---

## Tables

### Products

| Column Name  | Type    |
| ------------ | ------- |
| product_id   | int     |
| product_name | varchar |

**product_id** is the primary key.

### Orders

| Column Name | Type |
| ----------- | ---- |
| product_id  | int  |
| order_date  | date |
| unit        | int  |

This table may contain duplicate rows.

---

## Example

### Input

**Products**

| product_id | product_name          |
| ---------- | --------------------- |
| 1          | Leetcode Solutions    |
| 2          | Jewels of Stringology |
| 3          | HP                    |

**Orders**

| product_id | order_date | unit |
| ---------- | ---------- | ---- |
| 1          | 2020-02-05 | 60   |
| 1          | 2020-02-10 | 40   |
| 2          | 2020-02-15 | 120  |
| 3          | 2020-03-01 | 50   |

### Output

| product_name          | unit |
| --------------------- | ---- |
| Leetcode Solutions    | 100  |
| Jewels of Stringology | 120  |

---

## Approach

1. Join the `Products` and `Orders` tables using `product_id`.
2. Filter orders placed in **February 2020**.
3. Group records by product.
4. Calculate the total units ordered using `SUM(unit)`.
5. Return products whose total ordered units are at least **100**.

---

## SQL Solution 1 (Using YEAR() and MONTH())

```sql
SELECT p.product_name,
       SUM(o.unit) AS unit
FROM Products p
JOIN Orders o
ON p.product_id = o.product_id
WHERE YEAR(o.order_date) = 2020
  AND MONTH(o.order_date) = 2
GROUP BY p.product_id, p.product_name
HAVING SUM(o.unit) >= 100;
```

### Explanation

* `JOIN` combines product details with order information.
* `YEAR()` and `MONTH()` filter records to February 2020.
* `GROUP BY` groups orders for each product.
* `SUM(unit)` calculates total units ordered.
* `HAVING` filters products with at least 100 units sold.

---

## SQL Solution 2 (Using BETWEEN)

```sql
SELECT
    p.product_name,
    SUM(o.unit) AS unit
FROM Orders o
JOIN Products p
ON o.product_id = p.product_id
WHERE o.order_date BETWEEN '2020-02-01' AND '2020-02-29'
GROUP BY p.product_id, p.product_name
HAVING SUM(o.unit) >= 100;
```

### Explanation

* `BETWEEN` filters all orders placed during February 2020.
* `JOIN` connects product details with order records.
* `GROUP BY` groups records by product.
* `SUM(unit)` calculates total units sold.
* `HAVING` keeps only products with at least 100 units ordered.

---

## Complexity Analysis

* **Time Complexity:** O(n)
* **Space Complexity:** O(1) (excluding output).

---

## Topics

* SQL
* JOIN
* GROUP BY
* HAVING
* Aggregate Functions
* Date Functions
* Filtering Records
