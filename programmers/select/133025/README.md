# 과일로 만든 아이스크림 고르기

[프로그래머스 > SELECT > 과일로 만든 아이스크림 고르기](https://school.programmers.co.kr/learn/courses/30/lessons/133025)

<br/>

## 문제

`FIRST_HALF` 테이블은 아이스크림 가게의 상반기 주문 정보를 담은 테이블입니다.

`FIRST_HALF` 테이블 구조는 다음과 같습니다.

| NAME        | TYPE       | NULLABLE | ALIAS                   |
| ----------- | ---------- | -------- | ----------------------- |
| SHIPMENT_ID | INT(N)     | FALSE    | 출하 번호                |
| FLAVOR      | VARCHAR(N) | FALSE    | 아이스크림 맛             |
| TOTAL_ORDER | INT(N)     | FALSE    | 상반기 아이스크림 총주문량 |

동일한 날짜, 회원 ID, 상품 ID 조합에 대해서는 하나의 판매 데이터만 존재합니다.

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

**상반기 아이스크림 총주문량이 3,000보다 높으면서 아이스크림의 주 성분이 과일인**

**아이스크림의 맛을 총주문량이 큰 순서대로 조회하는 SQL문을 작성해주세요.**

<br/>

### 출력 예제

| FLAVOR     |
| ---------- |
| melon      |
| strawberry |

<br/>

## 풀이

```SQL
SELECT F.FLAVOR
    FROM FIRST_HALF F INNER JOIN ICECREAM_INFO I
    ON F.FLAVOR = I.FLAVOR
    WHERE F.TOTAL_ORDER > 3000 AND I.INGREDIENT_TYPE = 'fruit_based'
    ORDER BY TOTAL_ORDER DESC;
```
