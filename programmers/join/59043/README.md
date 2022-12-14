# 있었는데요 없었습니다

[프로그래머스 > JOIN > 있었는데요 없었습니다](https://school.programmers.co.kr/learn/courses/30/lessons/59043)

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

`ANIMAL_OUTS` 테이블은 동물 보호소에서 입양 보낸 동물의 정보를 담은 테이블입니다.

`ANIMAL_OUTS` 테이블 구조는 다음과 같습니다.

| NAME                | TYPE       | NULLABLE | ALIAS             |
| ------------------- | ---------- | -------- | ----------------- |
| ANIMAL_ID           | VARCHAR(N) | FALSE    | 동물의 ID          |
| ANIMAL_TYPE         | VARCHAR(N) | FALSE    | 생물 종            |
| DATETIME            | DATETIME   | FALSE    | 입양일             |
| NAME                | VARCHAR(N) | TRUE     | 이름               |
| SEX_UPON_OUTCOME    | VARCHAR(N) | FALSE    | 성별 및 중성화 여부  |

<br/>

`ANIMAL_OUTS` 테이블의 `ANIMAL_ID`는 `ANIMAL_INS`의 `ANIMAL_ID`의 외래 키입니다.

<br/>

**관리자의 실수로 동물의 입양일이 잘못 입력되었습니다.**

**보호 시작일보다 입양일이 더 빠른 동물의 ID, 이름을 조회하는 SQL문을 작성해주세요.**

**이때 결과는 보호 시작일이 빠른 순으로 정렬해야 합니다.**

<br/>

### 출력 예제

| ANIMAL_ID | NAME     |
| --------- | -------- |
| A381217   | Cherokee |


<br/>

## 풀이

```SQL
SELECT I.ANIMAL_ID, I.NAME
    FROM ANIMAL_INS I INNER JOIN ANIMAL_OUTS O
    ON I.ANIMAL_ID = O.ANIMAL_ID
    WHERE I.DATETIME > O.DATETIME
    ORDER BY I.DATETIME;
```
