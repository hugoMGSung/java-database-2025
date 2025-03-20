# Oracle 콘솔 연동 예제
# 모듈 설치
# pip install cx_Oracle 
import cx_Oracle as oci

# DB연결 설정변수 선언
sid = 'XE'
host = 'localhost' # 127.0.0.1 localhost와 동일
# DB서버가 외부에 있다면. oracle.pknuprd.net 또는 211.12.119.45 식으로 입력필요
port = 1521
username = 'madang'
password = 'madang'

# DB연결 시작
conn = oci.connect(f'{username}/{password}@{host}:{port}/{sid}')
cursor = conn.cursor() # DB 커서와 동일한 역할을 하는 개체

query = 'SELECT * FROM Students'  # 파이썬에서 쿼리호출시는 ; 삭제
cursor.execute(query)

# 불러온 데이터처리
for i, item in enumerate(cursor, start=1):
    print(item)

cursor.close()
conn.close()
# DB는 연결하면 마지막 close(), 파일은 오픈하면 마지막 닫아줘야 함.
