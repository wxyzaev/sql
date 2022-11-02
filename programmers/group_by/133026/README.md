# 성분으로 구분한 아이스크림 총 주문량

[프로그래머스 > SELECT > 성분으로 구분한 아이스크림 총 주문량](https://school.programmers.co.kr/learn/courses/30/lessons/133026)

<br/>

## 문제

`FIRST_HALF` 테이블은 아이스크림 가게의 상반기 주문 정보를 담은 테이블입니다.

`FIRST_HALF` 테이블 구조는 다음과 같습니다.

| NAME        | TYPE       | NULLABLE | ALIAS                   |
| ----------- | ---------- | -------- | ----------------------- |
| SHIPMENT_ID | INT(N)     | FALSE    | 출하 번호                |
| FLAVOR      | VARCHAR(N) | FALSE    | 아이스크림 맛             |
| TOTAL_ORDER | INT(N)     | FALSE    | 상반기 아이스크림 총주문량 |

<br/>

`ICECREAM_INFO` 테이블은 아이스크림 성분에 대한 정보를 담은 테이블입니다.

`ICECREAM_INFO` 테이블 구조는 다음과 같습니다.

| NAME            | TYPE       | NULLABLE | ALIAS                |
| --------------- | ---------- | -------- | -------------------- |
| FLAVOR          | VARCHAR(N) | FALSE    | 아이스크림 맛         |
| INGREDIENT_TYPE | VARCHAR(N) | FALSE    | 아이스크림의 성분 타입 |

`INGREDIENT_TYPE`에는 아이스크림의 주 성분이 설탕이면 `sugar_based`라고 입력되고,

아이스크림 주 성분이 과일이면 `fruit_based`라고 입력됩니다.

<br/>

**상반기 동안 각 아이스크림 성분 타입과 성분 타입에 대한 아이스크림의 총주문량을**

**총주문량이 작은 순서대로 조회하는 SQL 문을 작성해주세요.**

**이때 총주문량을 나타내는 컬럼명은 TOTAL_ORDER로 지정해주세요.**

<br/>

### 출력 예제

| INGREDIENT_TYPE | TOTAL_ORDER |
| --------------- | ----------- |
| sugar_based     | 13400       |
| fruit_based     | 19550       |

<br/>

## 풀이

```SQL
SELECT I.INGREDIENT_TYPE, SUM(F.TOTAL_ORDER) AS "TOTAL_ORDER"
    FROM FIRST_HALF F INNER JOIN ICECREAM_INFO I
    ON F.FLAVOR = I.FLAVOR
    GROUP BY I.INGREDIENT_TYPE
    ORDER BY TOTAL_ORDER;
```
