## PyQt5 첫 윈도우앱 개발
import sys
from PyQt5.QtWidgets import *

# PyQt의 모든 컨트롤은 Widget(위젯)이라고 부름.
class DevWindow(QMainWindow):    # 클래스 선언
    def __init__(self): # 클래스 초기화 스페셜메서드
        super().__init__()  # 부모클래스 QMainWindow도 초기화


app = QApplication(sys.argv)    # 애플리케이션 인스턴스 생성
win = DevWindow()   # PyQt로 만들어진 클래스 인스턴스 생성
win.show()  # 윈도우 바탕화면에 띄워라!
app.exec_()  # 애플리케이션이 X버튼을 눌러서 종료되기 전까지 실행하라
