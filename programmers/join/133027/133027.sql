SELECT F.FLAVOR
    FROM FIRST_HALF F INNER JOIN (SELECT SHIPMENT_ID, FLAVOR, SUM(TOTAL_ORDER) AS TOTAL_ORDER
                                    FROM JULY
                                    GROUP BY FLAVOR) J
    ON F.SHIPMENT_ID = J.SHIPMENT_ID
    GROUP BY F.FLAVOR
    ORDER BY SUM(F.TOTAL_ORDER + J.TOTAL_ORDER) DESC
    LIMIT 3;
