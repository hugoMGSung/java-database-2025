-- TRIGGER 학습
-- DEPT테이블 복사 DEPT_BACKUP 
CREATE TABLE DEPT_BACKUP
AS
	SELECT * FROM dept;

-- dept_backup 테이블에 log_date컬럼 추가
ALTER TABLE DEPT_BACKUP 
 	ADD(log_date DATE);

-- 트리거 작성
CREATE OR REPLACE TRIGGER trg_deptback
AFTER INSERT OR UPDATE ON dept  -- dept테이블 트리거메뉴에 저장확인.
FOR EACH ROW
BEGIN
	IF inserting THEN  -- dept테이블에 데이터가 추가되면
		INSERT INTO dept_backup 
		VALUES (:NEW.deptno, :NEW.dname, :NEW.loc, sysdate);
	ELSIF updating THEN  -- dept테이블에 데이터가 수정되면
		/*UPDATE dept_backup
		   SET dname = :NEW.dname
		     , loc = :NEW.loc
		     , log_date = sysdate
		 WHERE deptno = :OLD.deptno;*/
		INSERT INTO dept_backup 
		VALUES (:OLD.deptno, :NEW.dname, :NEW.loc, sysdate);
	/*ELSIF deleting THEN
		DELETE FROM dept_backup
		 WHERE deptno = :OLD.deptno;*/
	END IF;	
END;

-- 원본확인
SELECT * FROM dept;

-- 백업테이블 확인
SELECT * FROM dept_backup;

-- 삽입
INSERT INTO dept VALUES (50, 'R&D', 'SEOUL');

-- 수정. BOSTON에서 LOS ANGELES로 변경.
UPDATE dept SET 
       loc = 'LOS ANGELES'
 WHERE deptno = 40;


ROLLBACK;
COMMIT;