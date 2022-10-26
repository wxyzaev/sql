# 오랜 기간 보호한 동물 (2)

[프로그래머스 > String, Date > 오랜 기간 보호한 동물 (2)](https://school.programmers.co.kr/learn/courses/30/lessons/59411)

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

**입양을 간 동물 중,**

**보호 기간이 가장 길었던 동물 두 마리의 아이디와 이름을 조회하는 SQL문을 작성해주세요.**

<br/>

**이때 결과는 보호 기간이 긴 순으로 조회해야 합니다.**

<br/>

### 출력 예제

| ANIMAL_ID | NAME       |
| --------- | ---------- |
| A362707   | Girly Girl |
| A370507   | Emily      |

* 입양을 간 동물이 2마리 이상인 경우만 입력으로 주어집니다.

<br/>

## 풀이

```SQL
SELECT O.ANIMAL_ID, O.NAME
  FROM ANIMAL_OUTS O INNER JOIN ANIMAL_INS I
  ON O.ANIMAL_ID = I.ANIMAL_ID
  ORDER BY (O.DATETIME - I.DATETIME) DESC
  LIMIT 2;
```
