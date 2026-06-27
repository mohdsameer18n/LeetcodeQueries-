# 602. Friend Requests II: Who Has the Most Friends

## Problem
Given the `RequestAccepted` table, where each row represents an accepted friend request between two users, find the person who has the **highest number of friends**.

Since friendship is **bidirectional**, both the requester and the accepter should be counted as friends.

Return the result table with:

- `id` – User ID
- `num` – Number of friends

If multiple users have the same highest number of friends, return any one of them.

---

## Approach

1. Treat each accepted friend request as a friendship for **both** users.
2. Use `UNION ALL` to combine `requester_id` and `accepter_id` into a single column.
3. Group the combined data by user ID.
4. Count the occurrences of each user to determine the total number of friends.
5. Sort the results in descending order of friend count and return the top result.

---

## SQL Query

```sql
SELECT id, COUNT(*) AS num
FROM (
    SELECT requester_id AS id FROM RequestAccepted
    UNION ALL
    SELECT accepter_id AS id FROM RequestAccepted
) AS all_friends
GROUP BY id
ORDER BY num DESC
LIMIT 1;
```

---

## Explanation

- **UNION ALL** combines both requester and accepter IDs into one list.
- **GROUP BY** groups all records by user ID.
- **COUNT(*)** calculates the number of friendships for each user.
- **ORDER BY num DESC** sorts users by friend count in descending order.
- **LIMIT 1** returns the user with the highest number of friends.

---

## Complexity Analysis

- **Time Complexity:** `O(n)`
- **Space Complexity:** `O(n)`

Where `n` is the number of accepted friend requests.

---

## Key Concepts

- `UNION ALL`
- `GROUP BY`
- `COUNT()`
- `ORDER BY`
- `LIMIT`
- Aggregate Functions
