# 최솟값 구하기

[프로그래머스 > SUM, MAX, MIN > 최솟값 구하기](https://school.programmers.co.kr/learn/courses/30/lessons/59038)

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

**동물 보호소에 가장 먼저 들어온 동물은 언제 들어왔는지 조회하는 SQL문을 작성해주세요.**

<br/>

### 출력 예제

| 시간                 |
| ------------------- |
| 2013-10-14 15:38:00 |

<br/>

## 풀이

```SQL
SELECT MIN(DATETIME) AS "시간"
    FROM ANIMAL_INS;
```
