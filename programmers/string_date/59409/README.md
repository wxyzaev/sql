# 중성화 여부 파악하기

[프로그래머스 > String, Date > 중성화 여부 파악하기](https://school.programmers.co.kr/learn/courses/30/lessons/59409)

<br/>

## 문제

`ANIMAL_INS` 테이블은 동물 보호소에 들어온 동물의 정보를 담은 테이블입니다.

`ANIMAL_INS` 테이블 구조는 다음과 같습니다.

| NAME                | TYPE       | NULLABLE | ALIAS              |
| ------------------- | ---------- | -------- | ------------------ |
| ANIMAL_ID           | VARCHAR(N) | FALSE    | 동물의 ID           |
| ANIMAL_TYPE         | VARCHAR(N) | FALSE    | 생물 종             |
| DATETIME            | DATETIME   | FALSE    | 보호 시작일          |
| INTAKE_CONDITION    | VARCHAR(N) | FALSE    | 보호 시작 시 상태    |
| NAME                | VARCHAR(N) | TRUE     | 이름                |
| SEX_UPON_INTAKE     | VARCHAR(N) | FALSE    | 성별 및 중성화 여부   |

<br/>

**보호소의 동물이 중성화되었는지 아닌지 파악하려 합니다.**

**중성화된 동물은 `SEX_UPON_INTAKE` 컬럼에 'Neutered' 또는 'Spayed'라는 단어가 들어있습니다.**

**동물의 아이디와 이름, 중성화 여부를 아이디 순으로 조회하는 SQL문을 작성해주세요.**

<br/>

**이때 중성화가 되어있다면 'O', 아니라면 'X'라고 표시해주세요.**

<br/>

### 출력 예제

| ANIMAL_ID | NAME      | 중성화 |
| --------- | --------- | ----- |
| A355753   | Elijah    | O     |
| A373219   | Ella      | O     |
| A382192   | Maxwell 2 | X     |

<br/>

## 풀이

```SQL
SELECT ANIMAL_ID, NAME,
    CASE
        WHEN SEX_UPON_INTAKE LIKE 'Intact%' THEN 'X'
        ELSE 'O'
    END '중성화'
    FROM ANIMAL_INS
    ORDER BY ANIMAL_ID;
```
