# 가격이 제일 비싼 식품의 정보 출력하기

[프로그래머스 > SUM, MAX, MIN > 가격이 제일 비싼 식품의 정보 출력하기](https://school.programmers.co.kr/learn/courses/30/lessons/131115)

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

**가격이 제일 비싼 식품의 정보를 조회하는 SQL문을 작성해주세요.**

<br/>

### 출력 예제

| PRODUCT_ID | PRODUCT_NAME | PRODUCT_CD | CATEGORY | PRICE |
| ---------- | ------------ | ---------- | -------- | ----- |
| P0020      | 맛있는산초유  | CD_OL00010 | 식용유   | 6500   |

<br/>

## 풀이

```SQL
SELECT *
  FROM FOOD_PRODUCT
  WHERE PRICE = (SELECT MAX(PRICE) FROM FOOD_PRODUCT);
```
