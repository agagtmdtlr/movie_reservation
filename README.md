# movie_reservation
movie_webservice
### main
![main show](https://user-images.githubusercontent.com/55948026/87554905-b38bfa00-c6ef-11ea-8600-a185b008a4ee.PNG)
### reservation_main
![영화_예매1](https://user-images.githubusercontent.com/55948026/87554913-b555bd80-c6ef-11ea-97ef-d55ead7655d1.PNG)
### reservation_check
![영화_예매확인](https://user-images.githubusercontent.com/55948026/87554914-b555bd80-c6ef-11ea-833f-ce3d66f99248.PNG)
### movie_search
![영화_보기](https://user-images.githubusercontent.com/55948026/87554915-b5ee5400-c6ef-11ea-8d8c-20f805e350a8.PNG)
### movie_detail
![상세보기1](https://user-images.githubusercontent.com/55948026/87554916-b686ea80-c6ef-11ea-90db-63f87becc4f7.PNG)
![상세보기2](https://user-images.githubusercontent.com/55948026/87554920-b71f8100-c6ef-11ea-9121-e754b65f48df.PNG)
![상세보기3](https://user-images.githubusercontent.com/55948026/87554922-b71f8100-c6ef-11ea-8014-1d0025f3ef10.PNG)

## Environment
### script   
  Java EE   
  JSP(자바 서버 페이지) JSP 파일을 JVM을 통해 어셈블리 파일로 변환해줌   
  HTML   
  javascript   
  css   
### server   
  aphach tomcat 9   
### database    
  oracle 11g
  user : javaproject , password : oracle
### sql file
  테이블.txt
### jar
cos.jar
javax.servlet.jar
jstl-1.2.jar
ojdbc6.jar ( oracle version과 맞추기 )
standard.jar

## 실행
WebContent/common/Main.jsp
## 특징
MVC 패턴으로 jsp 구축  
client_request -> __to.jsp -> __.jsp   
login을 통해 접근 권한 관리 : 예매,리뷰 작성
영화 예매/정보 보기 작업을 하나의 페이지에서 동적처리 가능하도록 구현  
영화 예매 절차 어느 구간에서도 선택 변경가능/ 정보 최신화 가능하도록 구현
영화 리뷰 페이징 처리
영화 장르별 검색 가능
