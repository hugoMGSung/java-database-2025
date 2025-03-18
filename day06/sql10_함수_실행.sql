-- 함수 실행
SELECT max_sal(10) FROM dual;

SELECT * FROM emp
 WHERE deptno = 10;

-- 스칼라 서브쿼리 
SELECT e.empno, e.name, e.deptno
     , (SELECT dname FROM dept2 WHERE dcode = e.deptno) AS "부서명"
     , (SELECT area FROM dept2 WHERE dcode = e.deptno) AS "지역"
  FROM emp2 e;

SELECT 1 FROM dual;

-- 함수로 변경.
SELECT e.empno, e.name, e.deptno
     , get_dname(e.deptno) AS "부서명"
     , get_area(e.deptno) AS "지역"
  FROM emp2 e;

-- 조인으로 가능
SELECT e.empno, e.name, e.deptno
     , d.dname, d.area
  FROM emp2 e, dept2 d
 WHERE e.deptno = d.dcode;

COMMIT;