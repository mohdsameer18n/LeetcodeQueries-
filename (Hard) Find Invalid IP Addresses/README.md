# Find Invalid IP Addresses

## Solution 1: Using REGEXP

### Approach
This solution validates IP addresses using **regular expressions**.

- `NOT REGEXP` checks whether an IP does **not** follow the valid IPv4 format.
- Another `REGEXP` detects octets with **leading zeros**.
- Invalid IPs are grouped and counted.

### Code

```sql
SELECT ip,
       COUNT(*) AS invalid_count
FROM logs
WHERE ip NOT REGEXP '^((25[0-5]|2[0-4][0-9]|1?[0-9]{1,2})\\.){3}(25[0-5]|2[0-4][0-9]|1?[0-9]{1,2})$'
   OR ip REGEXP '(^|\\.)0[0-9]+'
GROUP BY ip
ORDER BY invalid_count DESC, ip DESC;
```

### Complexity
- **Time Complexity:** `O(n)`
- **Space Complexity:** `O(1)`

### Advantages
- Short and concise.
- Easy to write.
- Validates the entire IP in one condition.

### Disadvantages
- Regular expressions can be difficult to understand.
- May not be supported in every SQL database.

---

# Solution 2: Using SUBSTRING_INDEX()

### Approach
Instead of regex, split the IP into four octets using `SUBSTRING_INDEX()`.

For each octet:
- Convert it into an integer using `CAST()`.
- Check if it is greater than `255`.
- Check for leading zeros using `REGEXP`.

If any octet is invalid, the IP is considered invalid.

### Code

```sql
SELECT ip,
       COUNT(*) AS invalid_count
FROM logs
WHERE
    CAST(SUBSTRING_INDEX(ip, '.', 1) AS UNSIGNED) > 255
    OR CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(ip, '.', 2), '.', -1) AS UNSIGNED) > 255
    OR CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(ip, '.', 3), '.', -1) AS UNSIGNED) > 255
    OR CAST(SUBSTRING_INDEX(ip, '.', -1) AS UNSIGNED) > 255
    OR SUBSTRING_INDEX(ip, '.', 1) REGEXP '^0[0-9]+$'
    OR SUBSTRING_INDEX(SUBSTRING_INDEX(ip, '.', 2), '.', -1) REGEXP '^0[0-9]+$'
    OR SUBSTRING_INDEX(SUBSTRING_INDEX(ip, '.', 3), '.', -1) REGEXP '^0[0-9]+$'
    OR SUBSTRING_INDEX(ip, '.', -1) REGEXP '^0[0-9]+$'
GROUP BY ip
ORDER BY invalid_count DESC, ip DESC;
```

### Complexity
- **Time Complexity:** `O(n)`
- **Space Complexity:** `O(1)`

### Advantages
- Easy to understand.
- Validates each octet individually.
- Useful when avoiding complex regular expressions.

### Disadvantages
- Longer query.
- More function calls than the regex solution.

---

# Comparison

| Feature | REGEXP Solution | SUBSTRING_INDEX Solution |
|---------|-----------------|--------------------------|
| Code Length | Short | Long |
| Readability | Medium | High |
| Performance | Good | Good |
| Validation | Entire IP at once | Each octet separately |
| Best Use | When regex is allowed | When regex should be avoided |

## Conclusion
- **Use the REGEXP solution** for a concise and elegant query.
- **Use the SUBSTRING_INDEX solution** if you prefer explicit validation of each octet or want to avoid complex regex.
