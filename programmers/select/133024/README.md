# 인기있는 아이스크림

[프로그래머스 > SELECT > 인기있는 아이스크림](https://school.programmers.co.kr/learn/courses/30/lessons/133024)

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

**상반기에 판매된 아이스크림의 맛을 총주문량을 기준으로 내림차순 정렬하고**

**총주문량이 같다면 출하 번호를 기준으로 오름차순 정렬하여 조회하는 SQL문을 작성해주세요.**

<br/>

### 출력 예제

| FLAVOR          |
| --------------- |
| chocolate       |
| melon           |
| white_chocolate |
| strawberry      |
| mango           |
| orange          |
| pineapple       |
| vanilla         |
| caramel         |
| peach           |
| watermelon      |
| mint_chocolate  |

<br/>

## 풀이

```SQL
SELECT FLAVOR
    FROM FIRST_HALF
    ORDER BY TOTAL_ORDER DESC, SHIPMENT_ID;
```
