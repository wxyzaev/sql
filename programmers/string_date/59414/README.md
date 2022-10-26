# DATETIME에서 DATE로 형 변환

[프로그래머스 > String, Date > DATETIME에서 DATE로 형 변환](https://school.programmers.co.kr/learn/courses/30/lessons/59414)

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

**각 동물의 아이디와 이름, 들어온 날짜[1]를 조회하는 SQL문을 작성해주세요.**

**이때 결과는 아이디 순으로 조회해야 합니다.**

[1] 시각(시-분-초)을 제외한 날짜(년-월-일)만 보여주세요.

<br/>

### 출력 예제

| ANIMAL_ID | NAME   | 날짜       |
| --------- | ------ | ---------- |
| A349996   | Sugar  | 2018-01-22 |
| A350276   | Jewel  | 2017-08-13 |
| A350375   | Meo    | 2017-03-06 |
| A352555   | Harley | 2014-08-08 |
| A352713   | Gia    | 2017-04-13 |

<br/>

## 풀이

```SQL
SELECT ANIMAL_ID, NAME, DATE_FORMAT(DATETIME, '%Y-%m-%d') AS "날짜"
    FROM ANIMAL_INS
    ORDER BY ANIMAL_ID;
```
