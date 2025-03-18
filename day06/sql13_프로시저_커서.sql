-- 커서를 이용해서 모든 emp 정보를 조회하는 프로시저
CREATE OR REPLACE PROCEDURE EMP_LIST
IS
	CURSOR cur_emp IS
		SELECT empno, ename, job
		  FROM emp;
BEGIN
	FOR emp_cnt IN cur_emp
	LOOP
		DBMS_OUTPUT.PUT_LINE(emp_cnt.empno || ',' || emp_cnt.ename || ',' || emp_cnt.job);
	END LOOP;
	
END EMP_LIST;
