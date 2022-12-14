# 즐겨찾기가 가장 많은 식당 정보 출력하기

[프로그래머스 > GROUP BY > 즐겨찾기가 가장 많은 식당 정보 출력하기](https://school.programmers.co.kr/learn/courses/30/lessons/131123)

<br/>

## 문제

`REST_INFO` 테이블은 식당의 정보를 담은 테이블입니다.

`REST_INFO` 테이블 구조는 다음과 같습니다.

| NAME        | TYPE         | NULLABLE | ALIAS      |
| ----------- | ------------ | -------- | ---------- |
| REST_ID     | VARCHAR(5)   | FALSE    | 식당 ID    |
| REST_NAME   | VARCHAR(50)  | FALSE    | 식당 이름   |
| FOOD_TYPE   | VARCHAR(20)  | TRUE     | 음식 종류   |
| VIEWS       | NUMBER       | TRUE     | 조회수     |
| FAVORITES   | NUMBER       | TRUE     | 즐겨찾기수  |
| PARKING_LOT | VARCHAR(1)   | TRUE     | 주차장 유무 |
| ADDRESS     | VARCHAR(100) | TRUE     | 주소       |
| TEL         | VARCHAR(100) | TRUE     | 전화번호    |

<br/>

**음식종류별로 즐겨찾기수가 가장 많은 식당의 음식 종류, ID, 이름, 즐겨찾기수를**

**조회하는 SQL문을 작성해주세요.**

<br/>

**이때 결과는 음식 종류를 기준으로 내림차순 정렬해주세요.**

<br/>

### 출력 예제

| FOOD_TYPE | REST_ID | REST_NAME | FAVORITES |
| --------- | ------- | --------- | --------- |
| 한식      | 00001   | 은돼지식당 | 734       |
| 일식      | 00004   | 스시사카우스 | 230       |
| 양식      | 00003   | 따띠따띠뜨 | 102       |

<br/>

## 풀이

```SQL
SELECT FOOD_TYPE, REST_ID, REST_NAME, FAVORITES
    FROM REST_INFO
    WHERE (FOOD_TYPE, FAVORITES) IN (SELECT FOOD_TYPE, MAX(FAVORITES)
                                        FROM REST_INFO
                                        GROUP BY FOOD_TYPE)
    ORDER BY FOOD_TYPE DESC;
```
