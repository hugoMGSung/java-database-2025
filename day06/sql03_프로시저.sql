CREATE OR REPLACE PROCEDURE UP_SAL
(
	v_empno     emp.empno%TYPE
)
IS
	cnt_emp		number(1,0);
BEGIN
	SELECT count(*) INTO cnt_emp
	  FROM emp
	 WHERE empno = v_empno;

	IF cnt_emp > 0 THEN
		UPDATE emp SET
		   sal = sal + (sal * 0.1)
		 WHERE empno = v_empno;
	
		DBMS_OUTPUT.PUT_LINE('업데이트 성공!');		
	ELSE
		DBMS_OUTPUT.PUT_LINE('업데이트 불가');
	END IF;
END UP_SAL;

COMMIT;
