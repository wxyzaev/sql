# 상품 별 오프라인 매출 구하기

[프로그래머스 > JOIN > 상품 별 오프라인 매출 구하기](https://school.programmers.co.kr/learn/courses/30/lessons/131533)

<br/>

## 문제

`PRODUCT` 테이블은 어느 의류 쇼핑몰에서 판매중인 상품들의 상품 정보를 담은 테이블입니다.

`PRODUCT` 테이블 구조는 다음과 같습니다.

| NAME         | TYPE       | NULLABLE | ALIAS   |
| ------------ | ---------- | -------- | ------- |
| PRODUCT_ID   | INTEGER    | FALSE    | 상품 ID |
| PRODUCT_CODE | VARCHAR(8) | FALSE    | 상품코드 |
| PRICE        | INTEGER    | FALSE    | 판매가  |

상품 별로 중복되지 않는 8자리 상품코드 값을 가지며, 앞 2자리는 카테고리 코드를 의미합니다.

<br/>

`OFFLINE_SALE` 테이블은 어느 의류 쇼핑몰의 오프라인 상품 판매 정보를 담은 테이블입니다.

`OFFLINE_SALE` 테이블 구조는 다음과 같습니다.

| NAME            | TYPE    | NULLABLE | ALIAS                |
| --------------- | ------- | -------- | -------------------- |
| OFFLINE_SALE_ID | INTEGER | FALSE    | 오프라인 상품 판매 ID |
| PRODUCT_ID      | INTEGER | FALSE    | 상품 ID              |
| SALES_AMOUNT    | INTEGER | FALSE    | 판매량               |
| SALES_DATE      | DATE    | FALSE    | 판매일               |

동일한 날짜, 상품 ID 조합에 대해서는 하나의 판매 데이터만 존재합니다.

<br/>

**`PRODUCT` 테이블과 `OFFLINE_SALE` 테이블에서**

**상품코드 별 매출액(판매가 * 판매량) 합계를 출력하는 SQL문을 작성해주세요.**

<br/>

**결과는 매출액을 기준으로 내림차순 정렬해주시고,**

**매출액이 같다면 상품코드를 기준으로 오름차순 정렬해주세요.**

<br/>

### 출력 예제

| PRODUCT_CODE | SALES  |
| ------------ | ------ |
| C3000002     | 126000 |
| A1000011     | 90000  |
| A1000045     | 16000  |

<br/>

## 풀이

```SQL
SELECT P.PRODUCT_CODE, (P.PRICE * SUM(O.SALES_AMOUNT)) AS "SALES"
    FROM PRODUCT P INNER JOIN OFFLINE_SALE O
    ON P.PRODUCT_ID = O.PRODUCT_ID
    GROUP BY O.PRODUCT_ID
    ORDER BY SALES DESC, P.PRODUCT_CODE;
```
