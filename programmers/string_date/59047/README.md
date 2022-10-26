# 이름에 el이 들어가는 동물 찾기

[프로그래머스 > String, Date > 이름에 el이 들어가는 동물 찾기](https://school.programmers.co.kr/learn/courses/30/lessons/59047)

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

**보호소에 돌아가신 할머니가 기르던 개를 찾는 사람이 찾아왔습니다.**

**이 사람이 말하길 할머니가 기르던 개는 이름에 'el'이 들어간다고 합니다.**

**이름에 "EL"이 들어가는 개의 아이디와 이름을 조회하는 SQL문을 작성해주세요.**

<br/>

**이때 결과는 이름 순으로 조회해주세요. 단, 이름의 대소문자는 구분하지 않습니다.**

<br/>

### 출력 예제

| ANIMAL_ID | NAME      |
| --------- | --------- |
| A355753   | Elijah    |
| A382192   | Maxwell 2 |

<br/>

## 풀이

```SQL
SELECT ANIMAL_ID, NAME
    FROM ANIMAL_INS
    WHERE ANIMAL_TYPE = 'Dog' AND UPPER(NAME) LIKE '%EL%'
    ORDER BY NAME;
```
