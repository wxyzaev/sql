# 그룹별 조건에 맞는 식당 목록 출력하기

[프로그래머스 > JOIN > 그룹별 조건에 맞는 식당 목록 출력하기](https://school.programmers.co.kr/learn/courses/30/lessons/131124)

<br/>

## 문제

`MEMBER_PROFILE` 테이블은 회원의 정보를 담은 테이블입니다.

`MEMBER_PROFILE` 테이블 구조는 다음과 같습니다.

| NAME          | TYPE         | NULLABLE | ALIAS      |
| ------------- | ------------ | -------- | ---------- |
| MEMBER_ID     | VARCHAR(100) | FALSE    | 회원 ID    |
| MEMBER_NAME   | VARCHAR(50)  | FALSE    | 회원 이름   |
| TLNO          | VARCHAR(50)  | TRUE     | 회원 연락처 |
| GENDER        | VARCHAR(1)   | TRUE     | 성별       |
| DATE_OF_BIRTH | DATE         | TRUE     | 생년월일    |

<br/>

`REST_REVIEW` 테이블은 식당의 리뷰 정보를 담은 테이블입니다.

`REST_REVIEW` 테이블 구조는 다음과 같습니다.

| NAME         | TYPE          | NULLABLE | ALIAS      |
| ------------ | ------------- | -------- | ---------- |
| REVIEW_ID    | VARCHAR(10)   | FALSE    | 리뷰 ID    |
| REST_ID      | VARCHAR(10)   | TRUE     | 식당 ID    |
| MEMBER_ID    | VARCHAR(100)  | TRUE     | 회원 ID    |
| REVIEW_SCORE | NUMBER        | TRUE     | 점수       |
| REVIEW_TEXT  | VARCHAR(1000) | TRUE     | 리뷰 텍스트 |
| REVIEW_DATE  | DATE          | TRUE     | 리뷰 작성일 |

<br/>

**`MEMBER_PROFILE`와 `REST_REVIEW` 테이블에서**

**리뷰를 가장 많이 작성한 회원의 리뷰들을 조회하는 SQL문을 작성해주세요.**

<br/>

**회원 이름, 리뷰 텍스트, 리뷰 작성일이 출력되도록 작성해주시고,**

**결과는 리뷰 작성일을 기준으로 오름차순,**

**리뷰 작성일이 같다면 리뷰 텍스트를 기준으로 오름차순 정렬해주세요.**

<br/>

### 출력 예제

| MEMBER_NAME | REVIEW_TEXT       | REVIEW_DATE |
| ----------- | ----------------- | ----------- |
| 조예린      | 김치찌개 최곱니다.  | 2022-02-12  |
| 조예린      | 햄이 많아서 좋아요. | 2022-02-22  |

- `REVIEW_DATE`의 데이트 포맷이 예시와 동일해야 정답처리 됩니다.
<br/>

## 풀이

```SQL
SELECT M.MEMBER_NAME, R.REVIEW_TEXT, DATE_FORMAT(R.REVIEW_DATE, '%Y-%m-%d') AS "REVIEW_DATE"
    FROM MEMBER_PROFILE M INNER JOIN REST_REVIEW R
    ON M.MEMBER_ID = R.MEMBER_ID
    WHERE M.MEMBER_ID = (SELECT MEMBER_ID FROM REST_REVIEW
                            GROUP BY MEMBER_ID
                            ORDER BY COUNT(REVIEW_TEXT) DESC
                            LIMIT 1)
    ORDER BY R.REVIEW_DATE, R.REVIEW_TEXT;
```
