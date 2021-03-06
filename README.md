# JDBC_FinalPro
JDBC 기말 프로젝트
### 실행 화면
## 1. 위의 login.html과 입력폼이 동일한 login 페이지로 사용자가 접속하여 ID와 PW를 입력하여 "로그인"을 누를 수 있다.
    1.1) 기 저장된 ID와 PW가 일치하지 않으면 output.html 페이지를 참고하여 비밀번호가 일치하지 않 거나 존재하지 않는 ID임을 말해준다.
![1 1](https://user-images.githubusercontent.com/63589323/85506090-a9179c80-b62a-11ea-89e7-5759054939c9.png)

    1.2) ID와 PW가 일치하면 list.html을 참고하여 현재 DB에 저장된 학생 정보들을 모두 받아와 list 를 보여준다.
![1 2](https://user-images.githubusercontent.com/63589323/85506093-aa48c980-b62a-11ea-8448-ac8aefc34b57.png)
    
    1.2.1) 위의 list 페이지에서 사용자가 학생들을 (디폴트는 전체 보여주기) 학과별로 볼 수 있도록 학과를 선택해서 검색을 누르면 
    그 학과에 해당하는 학생들 정보만 list 화면에 보여주도록 한다.
![1 2 1](https://user-images.githubusercontent.com/63589323/85506097-ab79f680-b62a-11ea-84ae-5eb362ac1e15.png)

    1.2.2) 위의 list 페이지에서 사용자가 특정 학생 ID를 클릭하면 detail.html을 참고하여 해당 학생 의 정보를 PW를 제외하고 모두 보여주도록 한다.
![1 2 2](https://user-images.githubusercontent.com/63589323/85506099-ac128d00-b62a-11ea-801c-a659fca17722.png)
 
    1.2.2.1) 위의 detail 페이지에서 "목록" 버튼 클릭 시, 다시 list 페이지로 돌아가고 
    "수정" 버튼 클릭시 pwcheck.html 페이지를 참고하여 해당 학생의 PW를 확인하는 페이지를 보여주도록 한다.
![1 2 2 1](https://user-images.githubusercontent.com/63589323/85506100-acab2380-b62a-11ea-9175-323228b3bd97.png)    
    
    1.2.2.1.1) 위의 pwcheck 페이지에서 옳바른 pw를 입력했다면 member.html 페이지를 참고하 여 ID와 학생 이름은 변경할 수 없고 (이미 저장되어 있는 DB 정보를 그대로 이용하고), 
    나머지 모 든 정보들을 수정할 수 있도록 한다.
![1 2 2 1 1](https://user-images.githubusercontent.com/63589323/85506102-acab2380-b62a-11ea-94d5-363ec1882b21.png)

    1.2.2.1.1.1) 수정 완료후 제출하면 DB에 업데이트 한 후 다시 detail 페이지를 보여주도록 한다.
![1 2 2 1 1 1](https://user-images.githubusercontent.com/63589323/85506103-ad43ba00-b62a-11ea-8967-e0c9331ed640.png)    
    
    1.2.2.1.2) 위의 pwcheck 페이지에서 틀린 pw를 입력했다면 output.html 페이지를 참고하여 pw가 틀려서 수정할 수 없음을 말해준다.
![1 2 2 1 2](https://user-images.githubusercontent.com/63589323/85506105-addc5080-b62a-11ea-91c8-023291cf9ca3.png)    
    
## 2. 위의 login.html과 입력폼이 동일한 login 페이지로 사용자가 접속하여 "가입"을 누를 수 있다. 
    2.1) 사용자가 모든 정보를 입력 후 전송 버튼을 클릭 했을 때, ID가 기 존재하는 ID이면
         output.html 페이지를 참고해서 사용자에게 ID가 이미 존재한다는 것을 말해준다.
![2 1](https://user-images.githubusercontent.com/63589323/85506106-addc5080-b62a-11ea-874a-48b000c47754.png) 

    2.2) 사용자가 모든 정보 입력 후 전송 버튼을 클릭하면 DB에 해당 학생 정보를 저장하고, 
         output.html 페이지를 참고해서 저장이 완료되었음을 말해준다.
![2 2](https://user-images.githubusercontent.com/63589323/85506107-ae74e700-b62a-11ea-9f1c-1c68f2e71302.png)
![2 2 1](https://user-images.githubusercontent.com/63589323/85506108-ae74e700-b62a-11ea-82d7-e258f623bc02.png)
         
         
     
         
