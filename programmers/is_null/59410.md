# NULL 처리하기

[프로그래머스 > IS NULL > NULL 처리하기](https://school.programmers.co.kr/learn/courses/30/lessons/59410)

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

**입양 게시판에 동물 정보를 게시하려 합니다.**

**동물의 생물 종, 이름, 성별 및 중성화 여부를 아이디 순으로 조회하는 SQL문을 작성해주세요.**

**이때 프로그래밍을 모르는 사람들은 NULL이라는 기호를 모르기 때문에,**

**이름이 없는 동물의 이름은 "No name"으로 표시해 주세요.**

<br/>

### 출력 예제

| ANIMAL_TYPE | NAME    | SEX_UPON_INTAKE |
| ----------- | ------- | --------------- |
| Cat         | Jewel   | Spayed Female   |
| Cat         | Meo     | Neutered Male   |
| Dog         | No name | Spayed Female   |

<br/>

## 풀이

```SQL
SELECT ANIMAL_TYPE, IFNULL(NAME, "No name") AS "NAME", SEX_UPON_INTAKE
    FROM ANIMAL_INS
    ORDER BY ANIMAL_ID;
```
