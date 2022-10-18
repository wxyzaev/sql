# 5월 식품들의 총매출 조회하기

[프로그래머스 > JOIN > 5월 식품들의 총매출 조회하기](https://school.programmers.co.kr/learn/courses/30/lessons/131117)

<br/>

## 문제

`FOOD_PRODUCT` 테이블은 식품의 정보를 담은 테이블입니다.

`FOOD_PRODUCT` 테이블 구조는 다음과 같습니다.

| NAME         | TYPE        | NULLABLE | ALIAS    |
| ------------ | ----------- | -------- | -------- |
| PRODUCT_ID   | VARCHAR(10) | FALSE    | 식품 ID  |
| PRODUCT_NAME | VARCHAR(50) | FALSE    | 식품 이름 |
| PRODUCT_CD   | VARCHAR(10) | TRUE     | 식품 코드 |
| CATEGORY     | VARCHAR(10) | TRUE     | 식품 분류 |
| PRICE        | NUMBER      | TRUE     | 식품 가격 |

<br/>

`FOOD_ORDER` 테이블은 식품의 주문 정보를 담은 테이블입니다.

`FOOD_ORDER` 테이블 구조는 다음과 같습니다.

| NAME         | TYPE        | NULLABLE | ALIAS    |
| ------------ | ----------- | -------- | -------- |
| ORDER_ID     | VARCHAR(10) | FALSE    | 주문 ID  |
| PRODUCT_ID   | VARCHAR(5)  | FALSE    | 제품 ID  |
| AMOUNT       | NUMBER      | FALSE    | 주문량   |
| PRODUCE_DATE | DATE        | TRUE     | 생산일자 |
| IN_DATE      | DATE        | TRUE     | 입고일자 |
| OUT_DATE     | DATE        | TRUE     | 출고일자 |
| FACTORY_ID   | VARCHAR(10) | FALSE    | 공장 ID  |
| WAREHOUSE_ID | VARCHAR(10) | FALSE    | 창고 ID  |

<br/>

**생산일자가 2022년 5월인 식품들의 ID, 이름, 총매출을 조회하는 SQL문을 작성해주세요.**

**이때 결과는 총매출을 기준으로 내림차순 정렬해주시고,**

**총매출이 같다면 식품 ID를 기준으로 오름차순 정렬해주세요.**

<br/>

### 출력 예제

| PRODUCT_ID | PRODUCT_NAME  | TOTAL_SALES |
| ---------- | ------------- | ----------- |
| P0017      | 맛있는들기름   | 17380000    |
| P0019      | 맛있는카놀라유 | 10200000    |

<br/>

## 풀이

```SQL
SELECT P.PRODUCT_ID, P.PRODUCT_NAME, (P.PRICE * SUM(O.AMOUNT)) AS "TOTAL_SALES"
    FROM FOOD_PRODUCT P INNER JOIN FOOD_ORDER O
    ON P.PRODUCT_ID = O.PRODUCT_ID
    WHERE (YEAR(O.PRODUCE_DATE) = 2022) AND (MONTH(O.PRODUCE_DATE) = 5)
    GROUP BY PRODUCT_ID
    ORDER BY TOTAL_SALES DESC, P.PRODUCT_ID;
```
