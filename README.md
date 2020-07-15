# movie_reservation
movie_webservice

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
