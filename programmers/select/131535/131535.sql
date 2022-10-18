SELECT COUNT(*) AS "USERS"
    FROM (SELECT * FROM USER_INFO WHERE YEAR(JOINED) = 2021) T
    WHERE AGE BETWEEN 20 AND 29;