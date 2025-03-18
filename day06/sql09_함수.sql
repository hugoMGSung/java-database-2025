CREATE OR REPLACE FUNCTION GET_AREA(
	v_deptno 	emp2.deptno%TYPE
) RETURN VARCHAR2
IS
	darea	dept2.area%TYPE;
BEGIN
	SELECT area INTO darea 
	  FROM dept2 WHERE dcode = v_deptno;

	RETURN darea; -- 빼먹음 안되요.
END GET_AREA;
