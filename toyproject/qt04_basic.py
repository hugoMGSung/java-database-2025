## PyQt5 첫 윈도우앱 개발
import sys
from PyQt5.QtWidgets import *
from PyQt5.QtGui import *

class DevWindow(QMainWindow):
    def __init__(self):
        super().__init__()
        self.initUI() 

    def initUI(self):
        self.setWindowTitle('My First App')
        self.setWindowIcon(QIcon('./image/database.png'))        
        self.resize(600, 350)

        
        lbl1 = QLabel('버튼클릭', self)        
        
        btn1 = QPushButton('Click', self)                
        btn1.clicked.connect(self.btn1click)   

        hbox = QHBoxLayout() # 가로로 구성하는 레이아웃
        # self.setLayout(hbox) # 윈도우에 레이아웃 추가         

        vbox = QVBoxLayout() # 세로로 구성하눈 레이아웃  
        self.setLayout(vbox) # 윈도우에 레이아웃 추가  
        vbox.addWidget(lbl1)
        vbox.addWidget(btn1)       
        
        qr = self.frameGeometry()
        cp = QDesktopWidget().availableGeometry().center()
        qr.moveCenter(cp)
        self.move(qr.topLeft())

        self.show()

    def btn1click(self):        
        QMessageBox.about(self, '알림', '버튼을 클릭했습니다!')

if __name__ == '__main__':
    app = QApplication(sys.argv)
    win = DevWindow()
    app.exec_()
