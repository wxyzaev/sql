# 상위 n개 레코드

[프로그래머스 > SELECT > 상위 n개 레코드](https://school.programmers.co.kr/learn/courses/30/lessons/59405)

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

**동물 보호소에 가장 먼저 들어온 동물의 이름을 조회하는 SQL문을 작성해주세요.**

<br/>

### 출력 예제

| NAME  |
| ----- |
| Jack  |

<br/>

## 풀이

```SQL
SELECT NAME
    FROM ANIMAL_INS
    ORDER BY DATETIME
    LIMIT 1;
```
