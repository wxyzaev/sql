# 가격대 별 상품 개수 구하기

[프로그래머스 > GROUP BY > 가격대 별 상품 개수 구하기](https://school.programmers.co.kr/learn/courses/30/lessons/131530)

<br/>

## 문제

`PRODUCT` 테이블은 어느 의류 쇼핑몰에서 판매중인 상품들의 상품 정보를 담은 테이블입니다.

`PRODUCT` 테이블 구조는 다음과 같습니다.

| NAME         | TYPE       | NULLABLE | ALIAS   |
| ------------ | ---------- | -------- | ------- |
| PRODUCT_ID   | INTEGER    | FALSE    | 상품 ID |
| PRODUCT_CODE | VARCHAR(8) | FALSE    | 상품코드 |
| PRICE        | INTEGER    | FALSE    | 판매가  |

상품 별로 중복되지 않는 8자리 상품코드 값을 가지며, 앞 2자리는 카테고리 코드를 나타냅니다.

<br/>

**만원 단위의 가격대별로 상품 개수를 출력하는 SQL문을 작성해주세요.**

<br/>

**이때 컬럼명은 각각 PRICE_GROUP, PRODUCTS로 지정해주시고,**

**가격대 정보는 각 구간의 최소금액[1]으로 표시해주세요.**

**결과는 가격대를 기준으로 오름차순 정렬해주세요.**

<br/>

[1] 10,000원 이상 20,000원 미만 구간인 경우 10,000

<br/>

### 출력 예제

| PRICE_GROUP | PRODUCTS |
| ----------- | -------- |
| 0           | 1        |
| 10000       | 3        |
| 20000       | 1        |
| 30000       | 1        |

<br/>

## 풀이

```SQL
SELECT FLOOR(PRICE/10000) * 10000 AS "PRICE_GROUP", COUNT(*) AS "PRODUCTS"
    FROM PRODUCT
    GROUP BY PRICE_GROUP
    ORDER BY PRICE_GROUP;
```
