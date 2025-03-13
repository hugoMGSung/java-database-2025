/*
 * 복수행 함수 마무리
 * 24.7.365 - 서버
 */
-- GROUP BY, HAVING
-- 그룹핑시 GROUP BY에 들어가는 컬럼만 SELECT 절에 사용가능
-- WHERE 절은 일반적 조건만 비교, HAVING 집계함수를 조건에 사용할 때
SELECT department_id
     , sum(salary)
  FROM employees
 WHERE department_id <= 70
 GROUP BY department_id
HAVING sum(salary) <= 20000
 ORDER BY 2 ASC;  -- sum(salary)와 동일. select절 순서에 따라서 
 
-- RANK() -  1, 2, 2, 4 순
-- DENSE_RANK() - 1, 2, 2, 3 순
-- ROW_NUMBER() - 행번호
-- 전에 employees에서 급여가 높은 사람부터 순위매길때
SELECT first_name || ' ' || last_name AS "full_name"
     , salary
     , department_id
     , rank() OVER (ORDER BY salary desc) AS "RANK"
     , dense_rank() OVER (ORDER BY salary desc) AS "DENSE_RANK" -- 일상에서 DENSE_RANK 더 많이 사용
     , row_number() OVER (ORDER BY salary desc) AS "ROW_NUM"
  FROM employees 
 WHERE salary IS NOT NULL;

-- 부서별(department_id), 급여높은 사람부터 랭킹을 매길때
SELECT first_name || ' ' || last_name AS "full_name"
     , salary
     , department_id
     , rank() OVER (PARTITION BY department_id ORDER BY salary desc) AS "RANK"
     , dense_rank() OVER (PARTITION BY department_id ORDER BY salary desc) AS "DENSE_RANK" -- 일상에서 DENSE_RANK 더 많이 사용
     , row_number() OVER (PARTITION BY department_id ORDER BY salary desc) AS "ROW_NUM" -- PARTITION BY 잘 사용안함
  FROM employees 
 WHERE salary IS NOT NULL
 ORDER BY department_id;


