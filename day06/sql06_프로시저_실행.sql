-- INFO_EMP 프로시저 실행 PL/SQL
DECLARE
	v_empno		emp.empno%TYPE;
	o_ename   	emp.ename%TYPE;
	o_sal		emp.sal%TYPE;
BEGIN
	v_empno := 7900;

	info_emp(v_empno, o_ename, o_sal); -- 저장프로시저 실행 후 o_ename, o_sal로 값을 돌려받음
	DBMS_OUTPUT.PUT_LINE(v_empno || '는 이름은 ' || o_ename || '이고, 급여는 ' || o_sal);
END;


COMMIT;