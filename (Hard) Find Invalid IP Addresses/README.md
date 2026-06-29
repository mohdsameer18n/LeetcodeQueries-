# Find Invalid IP Addresses

## Problem
Given a table `logs` containing IP addresses, identify all **invalid IPv4 addresses** and return the number of times each invalid IP appears.

An IPv4 address is valid if:
- It contains exactly **four octets** separated by dots (`.`).
- Each octet is between **0 and 255**.
- No octet has **leading zeros**, except the value `0`.

Return the invalid IP addresses along with their occurrence count.

---

## Approach
This solution uses **regular expressions (REGEXP)** to validate IP addresses.

- The first `REGEXP` checks whether an IP follows the valid IPv4 format.
- The `NOT REGEXP` condition selects IPs that do **not** match the valid format.
- The second `REGEXP` detects octets with **leading zeros**, which are also considered invalid.
- Finally, the invalid IPs are grouped, counted, and sorted.

---

## Algorithm
1. Check if an IP matches the valid IPv4 pattern.
2. Check if any octet contains leading zeros.
3. Select IPs that satisfy either invalid condition.
4. Group by `ip`.
5. Count occurrences using `COUNT(*)`.
6. Sort by `invalid_count` (descending) and `ip` (descending).

---

## Code

```sql
SELECT ip,
       COUNT(*) AS invalid_count
FROM logs
WHERE ip NOT REGEXP '^((25[0-5]|2[0-4][0-9]|1?[0-9]{1,2})\\.){3}(25[0-5]|2[0-4][0-9]|1?[0-9]{1,2})$'
   OR ip REGEXP '(^|\\.)0[0-9]+'
GROUP BY ip
ORDER BY invalid_count DESC, ip DESC;
```

---

## Explanation

### Valid IPv4 Regex

```regex
^((25[0-5]|2[0-4][0-9]|1?[0-9]{1,2})\.){3}
(25[0-5]|2[0-4][0-9]|1?[0-9]{1,2})$
```

- `25[0-5]` → Matches `250–255`.
- `2[0-4][0-9]` → Matches `200–249`.
- `1?[0-9]{1,2}` → Matches `0–199`.
- `\.` → Matches the dot (`.`).
- `{3}` → First three octets.
- `^` and `$` ensure the entire string is a valid IP address.

### Leading Zero Regex

```regex
(^|\\.)0[0-9]+
```

This matches any octet that:
- Starts with `0`.
- Has one or more digits after it.

Examples:
- `01`
- `001`
- `010`

These are invalid because IPv4 octets cannot have leading zeros.

---

## Example

### Input

| ip |
|----------------|
| 192.168.1.1 |
| 256.100.1.1 |
| 192.168.01.1 |
| 256.100.1.1 |

### Output

| ip | invalid_count |
|----------------|---------------|
| 256.100.1.1 | 2 |
| 192.168.01.1 | 1 |

---

## Complexity Analysis

- **Time Complexity:** `O(n)` where `n` is the number of rows.
- **Space Complexity:** `O(1)`.

---

## Key Insight

Using **regular expressions** allows us to validate the entire IPv4 address in a single condition while a second regex efficiently detects octets with leading zeros. This makes the solution concise, readable, and easy to maintain.
