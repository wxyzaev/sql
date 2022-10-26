# 동명 동물 수 찾기

[프로그래머스 > GROUP BY > 동명 동물 수 찾기](https://school.programmers.co.kr/learn/courses/30/lessons/59041)

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

**동물 이름 중 두 번 이상 쓰인 이름과 해당 이름이 쓰인 횟수를 조회하는 SQL문을 작성해주세요.**

**이때 결과는 이름이 없는 동물은 집계에서 제외하며, 결과는 이름 순으로 조회해주세요.**

<br/>

### 출력 예제

| NAME  | COUNT |
| ----- | ----- |
| Lucy  | 3     |
| Raven | 2     |

<br/>

## 풀이

```SQL
SELECT NAME, COUNT(NAME) AS "COUNT"
    FROM ANIMAL_INS
    GROUP BY NAME
    HAVING COUNT(NAME) > 1
    ORDER BY NAME;
```