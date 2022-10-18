# 조건에 맞는 회원수 구하기

[프로그래머스 > SELECT > 조건에 맞는 회원수 구하기](https://school.programmers.co.kr/learn/courses/30/lessons/131535)

<br/>

## 문제

`USER_INFO` 테이블은 어느 의류 쇼핑몰에 가입한 회원 정보를 담은 테이블입니다.

`USER_INFO` 테이블 구조는 다음과 같습니다.

| NAME    | TYPE       | NULLABLE | ALIAS  |
| ------- | ---------- | -------- | ------ |
| USER_ID | INTEGER    | FALSE    | 회원 ID |
| GENDER  | TINYINT(1) | TRUE     | 성별    |
| AGE     | INTEGER    | TRUE     | 나이    |
| JOINED  | DATE       | FALSE    | 가입일  |

`GENDER` 컬럼은 비어있거나 0 또는 1의 값을 가지며 0인 경우 남자를, 1인 경우는 여자를 나타냅니다.

<br/>

**2021년에 가입한 회원 중 나이가 20세 이상 29세 이하인 회원이 몇 명인지**

**출력하는 SQL문을 작성해주세요.**

<br/>

### 출력 예제

| USERS |
| ----- |
| 3     |

<br/>

## 풀이

```SQL
SELECT COUNT(*) AS "USERS"
    FROM (SELECT * FROM USER_INFO WHERE YEAR(JOINED) = 2021) T
    WHERE AGE BETWEEN 20 AND 29;
```
