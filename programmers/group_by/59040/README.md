# 고양이와 개는 몇 마리 있을까

[프로그래머스 > GROUP BY > 고양이와 개는 몇 마리 있을까](https://school.programmers.co.kr/learn/courses/30/lessons/59040)

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

**동물 보호소에 들어온 동물 중 고양이와 개가 각각 몇 마리인지 조회하는 SQL문을 작성해주세요.**

**이때 고양이를 개보다 먼저 조회해주세요.**

<br/>

### 출력 예제

| ANIMAL_TYPE | count |
| ----------- | ----- |
| Cat         | 2     |
| Dog         | 1     |

<br/>

## 풀이

```SQL
SELECT ANIMAL_TYPE, COUNT(*) AS "count"
    FROM ANIMAL_INS
    GROUP BY ANIMAL_TYPE
    ORDER BY ANIMAL_TYPE;
```
