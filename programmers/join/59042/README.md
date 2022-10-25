# 없어진 기록 찾기

[프로그래머스 > JOIN > 없어진 기록 찾기](https://school.programmers.co.kr/learn/courses/30/lessons/59042)

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

**천재지변으로 인해 일부 데이터가 유실되었습니다.**

**입양을 간 기록은 있는데, 보호소에 들어온 기록이 없는 동물의 ID, 이름을**

**조회하는 SQL문을 작성해주세요.**

<br/>

**이때 결과는 동물의 ID 순으로 정렬해야 합니다.**

<br/>

### 출력 예제

| ANIMAL_ID | NAME  |
| --------- | ----- |
| A349733   | Allie |
| A349990   | Spice |


<br/>

## 풀이

```SQL
SELECT O.ANIMAL_ID, O.NAME
    FROM ANIMAL_OUTS O LEFT OUTER JOIN ANIMAL_INS I
    ON O.ANIMAL_ID = I.ANIMAL_ID
    WHERE I.ANIMAL_ID IS NULL
    ORDER BY ANIMAL_ID;
```
