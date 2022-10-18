# 이름이 있는 동물의 아이디

[프로그래머스 > IS NULL > 이름이 있는 동물의 아이디](https://school.programmers.co.kr/learn/courses/30/lessons/59407)

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

**동물 보호소에 들어온 동물 중, 이름이 있는 동물의 ID를 조회하는 SQL문을 작성해주세요.**

**단, ID는 오름차순 정렬되어야 합니다.**

<br/>

### 출력 예제

| ANIMAL_ID |
| --------- |
| A465637   |
| A524634   |

<br/>

## 풀이

```SQL
SELECT ANIMAL_ID
    FROM ANIMAL_INS
    WHERE NAME IS NOT NULL
    ORDER BY ANIMAL_ID;
```
