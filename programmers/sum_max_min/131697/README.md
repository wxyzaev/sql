# 가장 비싼 상품 구하기

[프로그래머스 > SUM, MAX, MIN > 가장 비싼 상품 구하기](https://school.programmers.co.kr/learn/courses/30/lessons/131697)

<br/>

## 문제

`PRODUCT` 테이블은 어느 의류 쇼핑몰에서 판매 중인 상품들의 정보를 담은 테이블입니다.

`PRODUCT` 테이블 구조는 다음과 같습니다.

| NAME         | TYPE       | NULLABLE | ALIAS    |
| ------------ | ---------- | -------- | -------- |
| PRODUCT_ID   | INTEGER    | FALSE    | 상품 ID  |
| PRODUCT_CODE | VARCHAR(8) | FALSE    | 상품코드 |
| PRICE        | INTEGER    | FALSE    | 판매가   |

상품별로 중복되지 않는 8자리 상품코드 값을 가지며, 앞 2자리는 카테고리 코드를 의미

<br/>

**판매 중인 상품 중 가장 높은 판매가를 출력하는 SQL문을 작성해주세요.**

**이때 컬럼명은 MAX_PRICE로 지정해주세요.**

<br/>

### 출력 예제

| MAX_PRICE |
| --------- |
| 22000     |

<br/>

## 풀이

```SQL
SELECT MAX(PRICE) AS "MAX_PRICE"
    FROM PRODUCT;
```
