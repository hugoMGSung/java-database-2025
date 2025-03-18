-- 교수번호로 교수의 이름과 보너스를 출력하는 프로시저
CREATE OR REPLACE PROCEDURE PROFESSOR_INFO
(
	v_profno	professor.profno%TYPE
)
IS
	o_name		professor.name%TYPE;
	o_bonus		professor.bonus%TYPE;
BEGIN
	-- 1. 교수테이블 조회해서 컬럼값을 변수에 할당
	SELECT name, bonus INTO o_name, o_bonus
	  FROM professor
	 WHERE profno = v_profno;

	-- 2. 보너스값의 여부로 분기
	IF o_bonus > 0 THEN
		DBMS_OUTPUT.PUT_LINE(o_name || '교수의 보너스 -> ' || o_bonus);
	ELSE
		DBMS_OUTPUT.PUT_LINE(o_name || '교수의 보너스는 없습니다.');
	END IF;
END PROFESSOR_INFO;
