# 흉부외과 또는 일반외과 의사 목록 출력하기

[프로그래머스 > SELECT > 흉부외과 또는 일반외과 의사 목록 출력하기](https://school.programmers.co.kr/learn/courses/30/lessons/132203)

<br/>

## 문제

`DOCTOR` 테이블은 종합병원에 속한 의사 정보를 담은 테이블입니다.

`DOCTOR` 테이블 구조는 다음과 같습니다.

| NAME     | TYPE        | NULLABLE | ALIAS    |
| -------- | ----------- | -------- | -------- |
| DR_NAME  | VARCHAR(20) | FALSE    | 의사이름 |
| DR_ID    | VARCHAR(10) | FALSE    | 의사ID   |
| LCNS_NO  | VARCHAR(30) | FALSE    | 면허번호  |
| HIRE_YMD | DATE        | FALSE    | 고용일자  |
| MCDP_CD  | VARCHAR(6)  | TRUE     | 진료과코드 |
| TLNO     | VARCHAR(50) | TRUE     | 전화번호  |

<br/>

**진료과가 흉부외과(CS)이거나 일반외과(GS)인 의사의 이름, 의사ID, 진료과, 고용일자를**

**조회하는 SQL문을 작성해주세요.**

<br/>

**이때 결과는 고용일자를 기준으로 내림차순 정렬하고,**

**고용일자가 같다면 이름을 기준으로 오름차순 정렬해주세요.**

<br/>

### 출력 예제

| DR_NAME | DR_ID      | MCDP_CD | HIRE_YMD   |
| ------- | ---------- | ------- | ---------- |
| 니모    | DR20200012 | CS      | 2020-03-01 |
| 뽀로로  | DR20170123 | GS      | 2017-03-01 |
| 벨      | DR20100039 | GS      | 2010-07-01 |
| 자스민  | DR20100032 | GS      | 2010-03-01 |
| 패티    | DR20090001 | CS      | 2009-07-01 |
| 루피    | DR20090029 | CS      | 2009-03-01 |

#### 주의사항
날짜 포맷은 예시와 동일하게 나와야합니다.

<br/>

## 풀이

```SQL
SELECT DR_NAME, DR_ID, MCDP_CD, DATE_FORMAT(HIRE_YMD, '%Y-%m-%d')
    FROM DOCTOR
    WHERE MCDP_CD = 'CS' OR MCDP_CD = 'GS'
    ORDER BY HIRE_YMD DESC, DR_NAME;
```
