# 재구매가 일어난 상품과 회원 리스트 구하기

[프로그래머스 > SELECT > 재구매가 일어난 상품과 회원 리스트 구하기](https://school.programmers.co.kr/learn/courses/30/lessons/131536)

<br/>

## 문제

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

**동일한 회원이 동일한 상품을 재구매한 데이터를 구하여, 재구매한 회원 ID와 재구매한 상품 ID를**

**출력하는 SQL문을 작성해주세요.**

<br/>

**결과는 회원 ID를 기준으로 오름차순 정렬해주시고,**

**회원 ID가 같다면 상품ID를 기준으로 내림차순 정렬해주세요.**

<br/>

### 출력 예제

| USER_ID | PRODUCT_ID |
| ------- | ---------- |
| 1       | 4          |
| 1       | 3          |
| 2       | 4          |

<br/>

## 풀이

```SQL
SELECT USER_ID, PRODUCT_ID
    FROM ONLINE_SALE
    GROUP BY USER_ID, PRODUCT_ID
    HAVING COUNT(*) > 1
    ORDER BY USER_ID, PRODUCT_ID DESC;
```
