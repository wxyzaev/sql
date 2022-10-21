# 12세 이하인 여자 환자 목록 출력하기

[프로그래머스 > SELECT > 12세 이하인 여자 환자 목록 출력하기](https://school.programmers.co.kr/learn/courses/30/lessons/132201)

<br/>

## 문제

`PATIENT` 테이블은 종합병원에 등록된 환자 정보를 담은 테이블입니다.

`PATIENT` 테이블 구조는 다음과 같습니다.

| NAME    | TYPE        | NULLABLE | ALIAS  |
| ------- | ----------- | -------- | ------ |
| PT_NO   | VARCHAR(10) | FALSE    | 환자번호 |
| PT_NAME | VARCHAR(20) | FALSE    | 환자이름 |
| GEND_CD | VARCHAR(1)  | FALSE    | 성별코드 |
| AGE     | INTEGER     | FALSE    | 나이    |
| TLNO    | VARCHAR(50) | TRUE     | 전화번호 |

<br/>

**12세 이하인 여자환자의 이름, 번호, 성별코드, 나이, 전화번호를 조회하는 SQL문을 작성해주세요.**

<br/>

**이때 전화번호가 없는 경우 'NONE'으로 출력시켜 주시고,**

**결과는 나이를 기준으로 내림차순 정렬하고**

**나이가 같다면 환자 번호를 기준으로 오름차순 정렬해주세요.**

<br/>

### 출력 예제

| PT_NAME | PT_NO      | GEND_CD | AGE | TLNO        |
| ------- | ---------- | ------- | --- | ----------- |
| 한나    | PT22000009 | W       | 12  | 01032323117 |
| 안나    | PT22000018 | W       | 11  | NONE        |
| 바라    | PT22000019 | W       | 10  | 01079068799 |
| 뽀뽀    | PT22000006 | W       | 8   | NONE        |

<br/>

## 풀이

```SQL
SELECT PT_NAME, PT_NO, GEND_CD, AGE, IFNULL(TLNO, 'NONE') AS "TLNO"
    FROM PATIENT
    WHERE GEND_CD = 'W' AND AGE <= 12
    ORDER BY AGE DESC, PT_NO;
```
