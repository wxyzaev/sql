# 카테고리 별 상품 개수 구하기

[프로그래머스 > String, Date > 카테고리 별 상품 개수 구하기](https://school.programmers.co.kr/learn/courses/30/lessons/131529)

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

**카테고리 코드(`PRODUCT_CODE` 앞 2자리) 별 상품 개수를 출력하는 SQL문을 작성해주세요.**

**결과는 상품 카테고리 코드를 기준으로 오름차순 정렬해주세요.**

<br/>

### 출력 예제

| CATEGORY | PRODUCTS |
| -------- | -------- |
| A1       | 2        |
| C3       | 3        |
| K1       | 1        |

<br/>

## 풀이

```SQL
SELECT LEFT(PRODUCT_CODE, 2) AS "CATEGORY", COUNT(*) AS "PRODUCTS"
    FROM PRODUCT
    GROUP BY CATEGORY
    ORDER BY CATEGORY;
```
