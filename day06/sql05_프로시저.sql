CREATE OR REPLACE PROCEDURE INFO_EMP
(
	v_empno    	IN   emp.empno%TYPE,
	o_ename		OUT	 emp.ename%TYPE,
	o_sal      	OUT  emp.sal%TYPE
)
IS
BEGIN
	SELECT ename, sal INTO o_ename, o_sal
	  FROM emp
	 WHERE empno = v_empno;

END INFO_EMP;
