# 경기도에 위치한 식품창고 목록 출력하기

[프로그래머스 > IS NULL > 경기도에 위치한 식품창고 목록 출력하기](https://school.programmers.co.kr/learn/courses/30/lessons/131114)

<br/>

## 문제

`FOOD_WAREHOUSE` 테이블은 식품창고의 정보를 담은 테이블입니다.

`FOOD_WAREHOUSE` 테이블 구조는 다음과 같습니다.

| NAME           | TYPE         | NULLABLE | ALIAS       |
| -------------- | ------------ | -------- | ----------- |
| WAREHOUSE_ID   | VARCHAR(10)  | FALSE    | 창고 ID      |
| WAREHOUSE_NAME | VARCHAR(20)  | FALSE    | 창고 이름    |
| ADDRESS        | VARCHAR(100) | TRUE     | 창고 주소    |
| TLNO           | VARCHAR(20)  | TRUE     | 전화번호     |
| FREEZER_YN     | VARCHAR(1)   | TRUE     | 냉동시설 여부 |

<br/>

**경기도에 위치한 창고의 ID, 이름, 주소, 냉동시설 여부를 조회하는 SQL문을 작성해주세요.**

**이때 냉동시설 여부가 NULL인 경우, 'N'으로 출력시켜주시고,**

**결과는 창고 ID를 기준으로 오름차순 정렬해주세요.**

<br/>

### 출력 예제

| WAREHOUSE_ID | WAREHOUSE_NAME | ADDRESS                            | FREEZER_YN |
| ------------ | -------------- | ---------------------------------- | ---------- |
| WH0001       | 창고_경기1     | 경기도 안산시 상록구 용담로 141       | Y          |
| WH0003       | 창고_경기2     | 경기도 이천시 마장면 덕평로 811       | N          |
| WH0004       | 창고_경기3     | 경기도 김포시 대곶면 율생중앙로250번길 | N          |

<br/>

## 풀이

```SQL
SELECT WAREHOUSE_ID, WAREHOUSE_NAME, ADDRESS, IFNULL(FREEZER_YN, "N") AS "FREEZER_YN"
    FROM FOOD_WAREHOUSE
    WHERE ADDRESS LIKE '경기%'
    ORDER BY WAREHOUSE_ID;
```
