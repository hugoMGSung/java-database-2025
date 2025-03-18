-- 
SELECT * FROM emp;

-- 커서로 반복하는 프로시저 실행
CALL emp_list();

-- 프로시저 연습 실행
CALL professor_info(2001);

CALL emp_info(7934);

-- FOR문
DECLARE
	v_sum 	NUMBER;
BEGIN
	v_sum := 0;
	FOR i IN 1..100 LOOP
		v_sum := v_sum + i;
	END LOOP;	

	DBMS_OUTPUT.PUT_LINE(v_sum);
END;
/

COMMIT;


