# 3월에 태어난 여성 회원 목록 출력하기

[프로그래머스 > SELECT > 3월에 태어난 여성 회원 목록 출력하기](https://school.programmers.co.kr/learn/courses/30/lessons/131120)

<br/>

## 문제

`MEMBER_PROFILE` 테이블은 식당 리뷰 사이트의 회원 정보를 담은 테이블입니다.

`MEMBER_PROFILE` 테이블 구조는 다음과 같습니다.

| NAME          | TYPE         | NULLABLE | ALIAS      |
| ------------- | ------------ | -------- | ---------- |
| MEMBER_ID     | VARCHAR(100) | FALSE    | 회원 ID    |
| MEMBER_NAME   | VARCHAR(50)  | FALSE    | 회원 이름   |
| TLNO          | VARCHAR(50)  | TRUE     | 회원 연락처 |
| GENDER        | VARCHAR(1)   | TRUE     | 성별       |
| DATE_OF_BIRTH | DATE         | TRUE     | 생년월일    |

<br/>

**생일이 3월인 여성 회원의 ID, 이름, 성별, 생년월일을 조회하는 SQL문을 작성해주세요.**

**이때 전화번호가 NULL인 경우는 출력대상에서 제외시켜 주시고,**

**결과는 회원ID를 기준으로 오름차순 정렬해주세요.**

<br/>

### 출력 예제

| MEMBER_ID          | MEMBER_NAME | GENDER | DATE_OF_BIRTH |
| ------------------ | ----------- | ------ | ------------- |
| seoyeons@naver.com | 박서연       | W      | 1993-03-16    |

<br/>

## 풀이

```SQL
SELECT MEMBER_ID, MEMBER_NAME, GENDER, DATE_OF_BIRTH
    FROM MEMBER_PROFILE
    WHERE TLNO IS NOT NULL AND (GENDER = 'W' AND MONTH(DATE_OF_BIRTH) = 3)
    ORDER BY MEMBER_ID;
```
