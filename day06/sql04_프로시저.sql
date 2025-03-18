CREATE OR REPLACE PROCEDURE ENAME_SAL
(
	v_empno 		emp.empno%TYPE
)
IS
	v_ename			emp.ename%TYPE;
	v_sal			emp.sal%TYPE;
BEGIN
	SELECT ename, sal INTO v_ename, v_sal
	  FROM emp
	 WHERE empno = v_empno;

	DBMS_OUTPUT.PUT_LINE('Name is ' || v_ename);
	DBMS_OUTPUT.PUT_LINE('Salary is ' || v_sal);
END ENAME_SAL;
