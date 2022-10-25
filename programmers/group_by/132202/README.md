# 진료과별 총 예약 횟수 출력하기

[프로그래머스 > GROUP BY > 진료과별 총 예약 횟수 출력하기](https://school.programmers.co.kr/learn/courses/30/lessons/132202)

<br/>

## 문제

`APPOINTMENT` 테이블은 종합병원의 진료 예약 정보를 담은 테이블입니다.

`APPOINTMENT` 테이블 구조는 다음과 같습니다.

| NAME          | TYPE        | NULLABLE | ALIAS       |
| ------------- | ----------- | -------- | ----------- |
| APNT_YMD      | TIMESTAMP   | FALSE    | 진료예약일시 |
| APNT_NO       | NUMBER(5)   | FALSE    | 진료예약번호 |
| PT_NO         | VARCHAR(10) | FALSE    | 환자번호    |
| MCDP_CD       | VARCHAR(6)  | FALSE    | 진료과코드   |
| MDDR_ID       | VARCHAR(10) | FALSE    | 의사ID      |
| APNT_CNCL_YN  | VARCHAR(1)  | TRUE     | 예약취소여부 |
| APNT_CNCL_YMD | DATE        | TRUE     | 예약취소날짜 |

<br/>

**2022년 5월에 예약한 환자 수를 진료과코드 별로 조회하는 SQL문을 작성해주세요.**

<br/>

**이때 컬럼명은 '진료과코드', '5월예약건수'로 지정해주시고,**

**결과는 진료과별 예약한 환자 수를 기준으로 오름차순 정렬하고,**

**예약한 환자 수가 같다면 진료과 코드를 기준으로 오름차순 정렬해주세요.**

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
