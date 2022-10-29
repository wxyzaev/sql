# 과일로 만든 아이스크림 고르기

[프로그래머스 > SELECT > 과일로 만든 아이스크림 고르기](https://school.programmers.co.kr/learn/courses/30/lessons/133025)

<br/>

## 문제

`FIRST_HALF` 테이블은 아이스크림 가게의 상반기 주문 정보를 담은 테이블입니다.

`FIRST_HALF` 테이블 구조는 다음과 같습니다.

| NAME        | TYPE       | NULLABLE | ALIAS                   |
| ----------- | ---------- | -------- | ----------------------- |
| SHIPMENT_ID | INT(N)     | FALSE    | 출하 번호                |
| FLAVOR      | VARCHAR(N) | FALSE    | 아이스크림 맛             |
| TOTAL_ORDER | INT(N)     | FALSE    | 상반기 아이스크림 총주문량 |

동일한 날짜, 회원 ID, 상품 ID 조합에 대해서는 하나의 판매 데이터만 존재합니다.

<br/>

`ICECREAM_INFO` 테이블은 어느 의류 쇼핑몰의 오프라인 상품 판매 정보를 담은 테이블입니다.

`ICECREAM_INFO` 테이블 구조는 다음과 같습니다.

| NAME            | TYPE    | NULLABLE | ALIAS                |
| --------------- | ------- | -------- | -------------------- |
| OFFLINE_SALE_ID | INTEGER | FALSE    | 오프라인 상품 판매 ID |
| PRODUCT_ID      | INTEGER | FALSE    | 상품 ID              |
| SALES_AMOUNT    | INTEGER | FALSE    | 판매량               |
| SALES_DATE      | DATE    | FALSE    | 판매일               |

동일한 날짜, 상품 ID 조합에 대해서는 하나의 판매 데이터만 존재합니다.

<br/>

**`ONLINE_SALE` 테이블과 `OFFLINE_SALE` 테이블에서 2022년 3월의 오프라인/온라인 상품 판매 데이터의**

**판매 날짜, 상품ID, 유저ID, 판매량을 출력하는 SQL문을 작성해주세요.**

<br/>

**`OFFLINE_SALE` 테이블의 판매 데이터의 `USER_ID` 값은 NULL로 표시해주세요.**

**결과는 판매일을 기준으로 오름차순 정렬해주시고, 판매일이 같다면 상품 ID를 기준으로 오름차순,**

**상품 ID까지 같다면 유저 ID를 기준으로 오름차순 정렬해주세요.**

<br/>

### 출력 예제

| SALES_DATE | PRODUCT_ID | USER_ID | SALES_AMOUNT |
| ---------- | ---------- | ------- | ------------ |
| 2022-03-01 | 1          | NULL    | 2            |
| 2022-03-01 | 3          | NULL    | 3            |
| 2022-03-01 | 4          | NULL    | 1            |
| 2022-03-01 | 4          | 4       | 1            |
| 2022-03-02 | 2          | 2       | 2            |
| 2022-03-02 | 3          | 6       | 3            |
| 2022-03-03 | 2          | NULL    | 1            |
| 2022-03-03 | 5          | 5       | 1            |

<br/>

## 풀이

```SQL
SELECT DATE_FORMAT(SALES_DATE, '%Y-%m-%d') AS "SALE_DATE", PRODUCT_ID, USER_ID, SALES_AMOUNT
    FROM (SELECT SALES_DATE, PRODUCT_ID, USER_ID, SALES_AMOUNT
            FROM ONLINE_SALE
          UNION
          SELECT SALES_DATE, PRODUCT_ID, NULL AS USER_ID, SALES_AMOUNT
            FROM OFFLINE_SALE) A
    WHERE YEAR(SALES_DATE) = '2022' AND MONTH(SALES_DATE) = '3'
    ORDER BY SALES_DATE, PRODUCT_ID, USER_ID;
```
