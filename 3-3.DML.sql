-- 테스트용 테이블 생성
CREATE TABLE TB_SUBWAY_STATN_TMP(
    SUBWAY_STATN_NO CHAR(6) NOT NULL,
    LN_NM VARCHAR2(50) NOT NULL, 
    STATN_NM VARCHAR2(50) NOT NULL,
    CONSTRAINT PK_TB_SUBWAY_STATN_TMP PRIMARY KEY (SUBWAY_STATN_NO)
);

-- 데이터 입력(INSERT)
INSERT INTO TB_SUBWAY_STATN_TMP T (T.SUBWAY_STATN_NO, T.LN_NM, T.STATN_NM)
VALUES ('000032', '2호선', '강남');

COMMIT;

SELECT A.SUBWAY_STATN_NO, A.LN_NM, A.STATN_NM
FROM TB_SUBWAY_STATN_TMP A
WHERE A.STATN_NM = '강남';

-- 데이터 수정(UPDATE)
UPDATE TB_SUBWAY_STATN_TMP A
SET A.LN_NM = '녹색선', A.STATN_NM = '강남스타일'
WHERE A.SUBWAY_STATN_NO = '000032';

SELECT A.SUBWAY_STATN_NO, A.LN_NM, A.STATN_NM
FROM TB_SUBWAY_STATN_TMP A
WHERE A.SUBWAY_STATN_NO = '000032';

COMMIT;

-- 데이터 삭제(DELETE)
DELETE FROM TB_SUBWAY_STATN_TMP A 
WHERE A.SUBWAY_STATN_NO = '000032';

SELECT A.SUBWAY_STATN_NO, A.LN_NM, A.STATN_NM
FROM TB_SUBWAY_STATN_TMP A
WHERE A.SUBWAY_STATN_NO = '000032';

COMMIT;

-- 데이터 조회(SELECT)
SELECT A.INDUTY_CL_CD, A.INDUTY_CL_NM, A.INDUTY_CL_SE_CD,
       NVL(A.UPPER_INDUTY_CL_CD, '(Null)') AS UPPER_INDUTY_CL_CD
FROM TB_INDUTY_CL A
WHERE INDUTY_CL_SE_CD = 'ICS001';

SELECT * -- 모든 칼럼 출력
FROM TB_INDUTY_CL_SE;

-- 중복된 행 제거(DISTINCT)
SELECT DISTINCT INDUTY_CL_SE_CD
FROM TB_INDUTY_CL;

SELECT DISTINCT POPLTN_SE_CD, AGRDE_SE_CD
FROM TB_POPLTN;

-- 앨리어스(별칭)
-- 테이블, 칼럼, 뷰, 인라인뷰에서 사용 가능
SELECT A.INDUTY_CL_CD AS 업종분류코드,
       A.INDUTY_CL_NM AS 업종분류명,
       A.INDUTY_CL_SE_CD AS 업종분류구분코드,
       NVL(A.UPPER_INDUTY_CL_CD, '(Null)') AS 상위업종분류코드
FROM TB_INDUTY_CL A
WHERE INDUTY_CL_SE_CD = 'ICS001';

-- 합성 연산자
SELECT SUBWAY_STATN_NO || '-' || STATN_NM || '(' || LN_NM || ')' AS "지하철엳번호-역명(노선명)"
FROM TB_SUBWAY_STATN
WHERE LN_NM = '9호선';

-- DUAL 테이블 (단 1건의 데이터가 저장되어 있고, 칼럼은 DUMMY 칼럼 1개이며, 저장되어 있는 칼럼 값은 X)
SELECT ((1+1)*3) / 6 AS "연산결과 값" FROM DUAL;
