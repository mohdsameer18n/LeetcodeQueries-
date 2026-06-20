# 1393. Capital Gain/Loss

## Problem Statement

Write an SQL query to report the Capital Gain/Loss for each stock.

The Capital Gain/Loss of a stock is calculated as:

```text
Total Sell Price - Total Buy Price
```

Return the result table in any order.

---

## Example

### Input

**Stocks**

| stock_name   | operation | operation_day | price |
| ------------ | --------- | ------------- | ----- |
| Leetcode     | Buy       | 1             | 1000  |
| Corona Masks | Buy       | 2             | 10    |
| Leetcode     | Sell      | 5             | 9000  |
| Handbags     | Buy       | 17            | 30000 |
| Corona Masks | Sell      | 3             | 1010  |
| Corona Masks | Buy       | 4             | 1000  |
| Corona Masks | Sell      | 5             | 500   |
| Corona Masks | Buy       | 6             | 1000  |
| Handbags     | Sell      | 29            | 7000  |
| Corona Masks | Sell      | 10            | 10000 |

### Output

| stock_name   | capital_gain_loss |
| ------------ | ----------------- |
| Leetcode     | 8000              |
| Corona Masks | 9500              |
| Handbags     | -23000            |

---

## Explanation

### Leetcode

```text
Sell = 9000
Buy  = 1000

Capital Gain = 9000 - 1000 = 8000
```

### Corona Masks

```text
Sell = 1010 + 500 + 10000 = 11510
Buy  = 10 + 1000 + 1000 = 2010

Capital Gain = 11510 - 2010 = 9500
```

### Handbags

```text
Sell = 7000
Buy  = 30000

Capital Loss = 7000 - 30000 = -23000
```

---

## Approach

1. Group records by `stock_name`.
2. Add stock prices when the operation is `Sell`.
3. Subtract stock prices when the operation is `Buy`.
4. Sum all values to get the final capital gain/loss.

---

## SQL Solution

```sql
SELECT stock_name,
       SUM(
           CASE
               WHEN operation = 'Sell' THEN price
               ELSE -price
           END
       ) AS capital_gain_loss
FROM Stocks
GROUP BY stock_name;
```

---

## Dry Run

For stock **Leetcode**:

```text
Buy  = 1000
Sell = 9000

Capital Gain/Loss
= 9000 - 1000
= 8000
```

For stock **Handbags**:

```text
Buy  = 30000
Sell = 7000

Capital Gain/Loss
= 7000 - 30000
= -23000
```

---

## Complexity Analysis

### Time Complexity

```text
O(n)
```

where `n` is the number of rows in the Stocks table.

### Space Complexity

```text
O(1)
```

excluding the output table.

---

## Concepts Used

* CASE WHEN
* SUM()
* GROUP BY
* Conditional Aggregation
