# 조건별로 분류하여 주문상태 출력하기

[프로그래머스 > String, Date > 조건별로 분류하여 주문상태 출력하기](https://school.programmers.co.kr/learn/courses/30/lessons/131113)

<br/>

## 문제

`FOOD_ORDER` 테이블은 식품공장의 주문 정보를 담은 테이블입니다.

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

**5월 1일을 기준으로 주문ID, 제품ID, 출고일자, 출고여부를 조회하는 SQL문을 작성해주세요.**

**출고여부는 5월 1일까지 출고완료로 이 후 날짜는 출고대기로 미정이면 출고미정으로 출력해주시고,**

**결과는 주문 ID를 기준으로 오름차순 정렬해주세요.**

<br/>

### 출력 예제

| ORDER_ID   | PRODUCT_ID | OUT_DATE   | 출고여부 |
| ---------- | ---------- | ---------- | ------- |
| OD00000051 | P0002      | 2022-04-21 | 출고완료 |
| OD00000052 | P0003      | 2022-04-27 | 출고완료 |
| OD00000053 | P0005      | 2022-05-01 | 출고완료 |
| OD00000054 | P0006      |            | 출고미정 |
| OD00000055 | P0008      | 2022-05-11 | 출고대기 |

<br/>

## 풀이

```SQL
SELECT ORDER_ID, PRODUCT_ID, DATE_FORMAT(OUT_DATE, '%Y-%m-%d') AS "OUT_DATE",
    CASE
        WHEN OUT_DATE IS NULL THEN '출고미정'
        WHEN DATEDIFF(OUT_DATE, '2022-05-01 00:00:00') > 0 THEN '출고대기'
        ELSE '출고완료'
    END "출고여부"
    FROM FOOD_ORDER
    ORDER BY ORDER_ID;
```
