-- emp테이블 조회해서 사원번호, 이름, 급여, 부서번호, 인상급여
CREATE OR REPLACE PROCEDURE EMP_INFO 
(
	v_empno		emp.empno%TYPE
)
IS
	o_ename		emp.ename%TYPE;
	o_sal		emp.sal%TYPE;
	o_deptno	emp.deptno%TYPE;
	o_upsal		emp.sal%TYPE;
BEGIN
	
	SELECT ename, sal, deptno
	  INTO o_ename, o_sal, o_deptno
	  FROM emp
	 WHERE empno = v_empno;
	
	o_upsal := CASE
					WHEN o_deptno = 10 THEN o_sal * 1.3
					WHEN o_deptno IN (20, 30) THEN o_sal * 1.5
					WHEN o_deptno > 30 THEN o_sal * 1.2
					ELSE o_sal
				END;
	
	DBMS_OUTPUT.PUT_LINE(v_empno || '=>' || o_ename || ',' || o_sal || ',' || o_deptno || ',' || o_upsal);
END EMP_INFO;
