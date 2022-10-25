# 식품분류별 가장 비싼 식품의 정보 조회하기

[프로그래머스 > GROUP BY > 식품분류별 가장 비싼 식품의 정보 조회하기](https://school.programmers.co.kr/learn/courses/30/lessons/131116)

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

**식품분류별로 가격이 제일 비싼 식품의 분류, 가격, 이름을 조회하는 SQL문을 작성해주세요.**

<br/>

**이때 식품분류가 '과자', '국', '김치', '식용유'인 경우만 출력시켜주시고**

**결과는 식품 가격을 기준으로 내림차순 정렬해주세요.**

<br/>

### 출력 예제

| CATEGORY | MAX_PRICE | PRODUCT_NAME |
| -------- | --------- | ------------ |
| 식용유   | 6500      | 맛있는산초유  |
| 과자     | 1800      | 맛있는맛동산  |

<br/>

## 풀이

```SQL
SELECT CATEGORY, PRICE AS "MAX_PRICE", PRODUCT_NAME
  FROM FOOD_PRODUCT
  WHERE (CATEGORY, PRICE) IN (SELECT CATEGORY, MAX(PRICE)
                                FROM FOOD_PRODUCT
                                WHERE CATEGORY IN ('과자', '국', '김치', '식용유')
                                GROUP BY CATEGORY)
  ORDER BY PRICE DESC;
```
