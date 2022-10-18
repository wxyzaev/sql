# 여러 기준으로 정렬하기

[프로그래머스 > SELECT > 여러 기준으로 정렬하기](https://school.programmers.co.kr/learn/courses/30/lessons/59404)

<br/>

## 문제

`ANIMAL_INS` 테이블은 동물 보호소에 들어온 동물의 정보를 담은 테이블입니다.

`ANIMAL_INS` 테이블 구조는 다음과 같습니다.

| NAME                | TYPE       | NULLABLE | ALIAS             |
| ------------------- | ---------- | -------- | ----------------- |
| ANIMAL_ID           | VARCHAR(N) | FALSE    | 동물의 ID          |
| ANIMAL_TYPE         | VARCHAR(N) | FALSE    | 생물 종            |
| DATETIME            | DATETIME   | FALSE    | 보호 시작일         |
| INTAKE_CONDITION    | VARCHAR(N) | FALSE    | 보호 시작 시 상태   |
| NAME                | VARCHAR(N) | TRUE     | 이름               |
| SEX_UPON_INTAKE     | VARCHAR(N) | FALSE    | 성별 및 중성화 여부  |

<br/>

**동물 보호소에 들어온 모든 동물의 아이디와 이름, 보호 시작일을 이름 순으로**

**조회하는 SQL문을 작성해주세요.**

**단, 이름이 같은 동물 중에서는 보호를 나중에 시작한 동물을 먼저 보여줘야 합니다.**

<br/>

### 출력 예제

| ANIMAL_ID | NAME  | DATETIME            |
| --------- | ----- | ------------------- |
| A350276   | Jewel | 2017-08-13 13:50:00 |
| A396810   | Raven | 2016-08-22 16:13:00 |
| A410668   | Raven | 2015-11-19 13:41:00 |
| A349996   | Sugar | 2018-01-22 14:32:00 |

<br/>

## 풀이

```SQL
SELECT ANIMAL_ID, NAME, DATETIME
  FROM ANIMAL_INS
  ORDER BY NAME, DATETIME DESC;
```
