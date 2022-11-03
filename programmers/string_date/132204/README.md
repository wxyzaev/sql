# 취소되지 않은 진료 예약 조회하기

[프로그래머스 > String, Date > 취소되지 않은 진료 예약 조회하기](https://school.programmers.co.kr/learn/courses/30/lessons/132204)

<br/>

## 문제

`PATIENT` 테이블은 환자 정보를 담은 테이블입니다.

`PATIENT` 테이블 구조는 다음과 같습니다.

| NAME    | TYPE       | NULLABLE | ALIAS  |
| ------- | ---------- | -------- | ------ |
| PT_NO   | VARCHAR(N) | FALSE    | 환자번호 |
| PT_NAME | VARCHAR(N) | FALSE    | 환자이름 |
| GEND_CD | VARCHAR(N) | FALSE    | 성별코드 |
| AGE     | INTEGER    | FALSE    | 나이    |
| TLNO    | VARCHAR(N) | TRUE     | 전화번호 |

<br/>

`DOCTOR` 테이블은 의사 정보를 담은 테이블입니다.

`DOCTOR` 테이블 구조는 다음과 같습니다.

| NAME     | TYPE       | NULLABLE | ALIAS    |
| -------- | ---------- | -------- | -------- |
| DR_NAME  | VARCHAR(N) | FALSE    | 의사이름 |
| DR_ID    | VARCHAR(N) | FALSE    | 의사ID   |
| LCNS_NO  | VARCHAR(N) | FALSE    | 면허번호  |
| HIRE_YMD | DATE       | FALSE    | 고용일자  |
| MCDP_CD  | VARCHAR(N) | TRUE     | 진료과코드 |
| TLNO     | VARCHAR(N) | TRUE     | 전화번호  |

<br/>

`APPOINTMENT` 테이블은 진료 예약 정보를 담은 테이블입니다.

`APPOINTMENT` 테이블 구조는 다음과 같습니다.

| NAME          | TYPE       | NULLABLE | ALIAS       |
| ------------- | ---------- | -------- | ----------- |
| APNT_YMD      | TIMESTAMP  | FALSE    | 진료예약일시 |
| APNT_NO       | INTEGER    | FALSE    | 진료예약번호 |
| PT_NO         | VARCHAR(N) | FALSE    | 환자번호    |
| MCDP_CD       | VARCHAR(N) | FALSE    | 진료과코드   |
| MDDR_ID       | VARCHAR(N) | FALSE    | 의사ID      |
| APNT_CNCL_YN  | VARCHAR(N) | TRUE     | 예약취소여부 |
| APNT_CNCL_YMD | DATE       | TRUE     | 예약취소날짜 |

<br/>

**`PATIENT`, `DOCTOR`, `APPOINTMENT` 테이블에서 2022년 4월 13일 취소되지 않은**

**흉부외과(CS) 진료 예약 내역을 조회하는 SQL문을 작성해주세요.**

**진료예약번호, 환자이름, 환자번호, 진료과코드, 의사이름, 진료예약일시 등이 출력되도록 작성해주세요.**

<br/>

**결과는 진료예약일시를 기준으로 오름차순 정렬해주세요.**

<br/>

### 출력 예제

| 진료과코드 | 5월예약건수 |
| --------- | ---------- |
| OB        | 1          |
| OS        | 1          |
| CS        | 2          |
| FM        | 2          |
| GS        | 2          |

<br/>

## 풀이

```SQL
SELECT MCDP_CD AS "진료과코드", COUNT(*) AS "5월예약건수"
    FROM APPOINTMENT
    WHERE YEAR(APNT_YMD) = 2022 AND MONTH(APNT_YMD) = 5
    GROUP BY MCDP_CD
    ORDER BY 5월예약건수, 진료과코드;
```
**진료과가 흉부외과(CS)이거나 일반외과(GS)인 의사의 이름, 의사ID, 진료과, 고용일자를**

**조회하는 SQL문을 작성해주세요.**

<br/>

**이때 결과는 고용일자를 기준으로 내림차순 정렬하고,**

**고용일자가 같다면 이름을 기준으로 오름차순 정렬해주세요.**

<br/>

### 출력 예제

| APNT_NO | PT_NAME | PT_NO     | MCDP_CD | DR_NAME | APNT_YMD                  |
| ------- | ------- | --------- | ------- | ------- | -------------------------- |
| 46      | 오스왈드 | PT22000043 | CS     | 루피    | 2022-04-13 09:00:00.000000 |
| 42      | 몬몬    | PT22000071 | CS     | 루피     | 2022-04-13 12:30:00.000000 |
| 42      | 바라    | PT22000001 | CS     | 니모     | 2022-04-13 15:30:00.000000 |

<br/>

## 풀이

```SQL
SELECT A.APNT_NO, P.PT_NAME, A.PT_NO, A.MCDP_CD, D.DR_NAME, A.APNT_YMD
    FROM (SELECT *
            FROM APPOINTMENT
            WHERE APNT_YMD LIKE '2022-04-13%' AND (MCDP_CD = 'CS' AND APNT_CNCL_YN = 'N')) A
    INNER JOIN PATIENT P ON A.PT_NO = P.PT_NO
    INNER JOIN DOCTOR D ON A.MDDR_ID = D.DR_ID
    ORDER BY A.APNT_YMD;
```
