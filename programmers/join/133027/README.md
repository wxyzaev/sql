# 주문량이 많은 아이스크림들 조회하기

[프로그래머스 > SELECT > 주문량이 많은 아이스크림들 조회하기](https://school.programmers.co.kr/learn/courses/30/lessons/133027)

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

`JULY` 테이블은 7월의 아이스크림 주문 정보를 담은 테이블입니다.

`JULY` 테이블 구조는 다음과 같습니다.

| NAME        | TYPE       | NULLABLE | ALIAS                 |
| ----------- | ---------- | -------- | --------------------- |
| SHIPMENT_ID | INT(N)     | FALSE    | 출하 번호              |
| FLAVOR      | VARCHAR(N) | FALSE    | 아이스크림 맛          |
| TOTAL_ORDER | INT(N)     | FALSE    | 7월 아이스크림 총주문량 |

7월에는 아이스크림 주문량이 많아

같은 아이스크림에 대하여 서로 다른 두 공장에서 아이스크림 가게로 출하를 진행하는 경우가 있습니다.

이 경우 같은 맛의 아이스크림이라도 다른 출하 번호를 갖게 됩니다.

<br/>

**7월 아이스크림 총 주문량과 상반기의 아이스크림 총 주문량을 더한 값이 큰 순서대로**

**상위 3개의 맛을 조회하는 SQL문을 작성해주세요.**

<br/>

### 출력 예제

| FLAVOR     |
| ---------- |
| strawberry |
| mango      |
| chocolate  |

<br/>

## 풀이

```SQL
SELECT F.FLAVOR
    FROM FIRST_HALF F INNER JOIN (SELECT SHIPMENT_ID, FLAVOR, SUM(TOTAL_ORDER) AS TOTAL_ORDER
                                    FROM JULY
                                    GROUP BY FLAVOR) J
    ON F.SHIPMENT_ID = J.SHIPMENT_ID
    GROUP BY F.FLAVOR
    ORDER BY SUM(F.TOTAL_ORDER + J.TOTAL_ORDER) DESC
    LIMIT 3;
```
