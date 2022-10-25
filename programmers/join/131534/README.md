# 상품을 구매한 회원 비율 구하기

[프로그래머스 > JOIN > 상품을 구매한 회원 비율 구하기](https://school.programmers.co.kr/learn/courses/30/lessons/131534)

<br/>

## 문제

`USER_INFO` 테이블은 어느 의류 쇼핑몰에 가입한 회원 정보를 담은 테이블입니다.

`USER_INFO` 테이블 구조는 다음과 같습니다.

| NAME    | TYPE       | NULLABLE | ALIAS   |
| ------- | ---------- | -------- | ------- |
| USER_ID | INTEGER    | FALSE    | 회원 ID |
| GENDER  | TINYINT(1) | TRUE     | 성별    |
| AGE     | INTEGER    | TRUE     | 나이    |
| JOINED  | DATE       | FALSE    | 가입일  |

`GENDER` 컬럼은 비어있거나 0 또는 1의 값을 가지며 0인 경우 남자를, 1인 경우는 여자를 나타냅니다.

<br/>

`ONLINE_SALE` 테이블은 어느 의류 쇼핑몰의 온라인 상품 판매 정보를 담은 테이블입니다.

`ONLINE_SALE` 테이블 구조는 다음과 같습니다.

| NAME           | TYPE    | NULLABLE | ALIAS             |
| -------------- | ------- | -------- | ----------------- |
| ONLINE_SALE_ID | INTEGER | FALSE    | 온라인 상품 판매 ID |
| USER_ID        | INTEGER | FALSE    | 회원 ID            |
| PRODUCT_ID     | INTEGER | FALSE    | 상품 ID            |
| SALES_AMOUNT   | INTEGER | FALSE    | 판매량             |
| SALES_DATE     | DATE    | FALSE    | 판매일             |

동일한 날짜, 회원 ID, 상품 ID 조합에 대해서는 하나의 판매 데이터만 존재합니다.

<br/>

**`USER_INFO` 테이블과 `ONLINE_SALE` 테이블에서**

**2021년에 가입한 전체 회원들 중 상품을 구매한 회원수와 상품을 구매한 회원의 비율[1]을**

**년, 월 별로 출력하는 SQL문을 작성해주세요.**

[1] 2021년에 가입한 회원 중 상품을 구매한 회원수 / 2021년에 가입한 전체 회원수

<br/>

**상품을 구매한 회원의 비율은 소수점 두번째자리에서 반올림하고,**

**전체 결과는 년을 기준으로 오름차순 정렬해주시고,**

**년이 같다면 월을 기준으로 오름차순 정렬해주세요.**

<br/>

### 출력 예제

| YEAR | MONTH | PURCHASED_USERS | PURCHASED_RATIO |
| ---- | ----- | --------------- | --------------- |
| 2022 | 1     | 2               | 0.5             |
| 2022 | 2     | 1               | 0.3             |

<br/>

## 풀이

```SQL
SELECT YEAR, MONTH, COUNT(*) AS "PURCHASED_USERS", ROUND(COUNT(*)/(SELECT COUNT(*) FROM USER_INFO WHERE YEAR(JOINED) = 2021), 1) AS "PURCHASED_RATIO"
    FROM (SELECT DISTINCT YEAR(N.SALES_DATE) AS "YEAR", MONTH(N.SALES_DATE) AS "MONTH", N.USER_ID
            FROM ONLINE_SALE N INNER JOIN USER_INFO I
            ON N.USER_ID = I.USER_ID
            WHERE YEAR(I.JOINED) = 2021) A
    GROUP BY YEAR, MONTH
    ORDER BY YEAR, MONTH;
```
