# 보호소에서 중성화한 동물

[프로그래머스 > JOIN > 보호소에서 중성화한 동물](https://school.programmers.co.kr/learn/courses/30/lessons/59045)

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

**보호소에서 중성화 수술을 거친 동물 정보를 알아보려 합니다.**

**보호소에 들어올 당시에는 중성화되지 않았지만,**

**보호소를 나갈 당시에는 중성화[1]된 동물의 ID, 생물 종, 이름을 조회하는 SQL문을 작성해주세요.**

<br/>

**이때 결과는 ID 순으로 정렬해야 합니다.**

<br/>

[1] 중성화를 거치지 않은 동물은 `성별 및 중성화 여부`에 `Intact`,

중성화를 거친 동물은 `Spayed` 또는 `Neutered`라고 표시되어 있습니다.

<br/>

### 출력 예제

| ANIMAL_ID | ANIMAL_TYPE | NAME     |
| --------- | ----------- | -------- |
| A382192   | Dog         | Maxwell2 |
| A410330   | Dog         | Chewy    |

<br/>

## 풀이

```SQL
SELECT O.ANIMAL_ID, O.ANIMAL_TYPE, O.NAME
    FROM ANIMAL_OUTS O LEFT OUTER JOIN ANIMAL_INS I
    ON O.ANIMAL_ID = I.ANIMAL_ID
    WHERE O.SEX_UPON_OUTCOME != I.SEX_UPON_INTAKE
    ORDER BY ANIMAL_ID;
```
