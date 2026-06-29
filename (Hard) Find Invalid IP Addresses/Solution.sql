SELECT ip,
       COUNT(*) AS invalid_count
FROM logs
WHERE ip NOT REGEXP '^((25[0-5]|2[0-4][0-9]|1?[0-9]{1,2})\\.){3}(25[0-5]|2[0-4][0-9]|1?[0-9]{1,2})$'
   OR ip REGEXP '(^|\\.)0[0-9]+'
GROUP BY ip
ORDER BY invalid_count DESC, ip DESC;
