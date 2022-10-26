# 루시와 엘라 찾기

[프로그래머스 > String, Date > 루시와 엘라 찾기](https://school.programmers.co.kr/learn/courses/30/lessons/59046)

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

**이름이 Lucy, Ella, Pickle, Rogan, Sabrina, Mitty인**

**동물의 아이디와 이름, 성별 및 중성화 여부를 조회하는 SQL문을 작성해주세요.**

<br/>

**이때 결과는 아이디 순으로 조회해주세요.**

<br/>

### 출력 예제

| ANIMAL_ID | NAME | SEX_UPON_INTAKE |
| --------- | ---- | --------------- |
| A373219   | Ella | Spayed Female   |
| A377750   | Lucy | Spayed Female   |

<br/>

## 풀이

```SQL
SELECT ANIMAL_ID, NAME, SEX_UPON_INTAKE
    FROM ANIMAL_INS
    WHERE NAME IN ('Lucy', 'Ella', 'Pickle', 'Rogan', 'Sabrina', 'Mitty')
    ORDER BY ANIMAL_ID;
```
