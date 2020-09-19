# P7-Online_Shopping_Site
Spring과 jsp를 사용한 쇼핑몰 베타버전입니다.
## 목차
* 프로젝트 설명
* 프로젝트 기술 설명
* 포함 목록
* 동작 과정
* 기능 소개
* 예상 시나리오
* 결과 화면
* 세부 정보

## 프로젝트 설명
이 프로젝트는 JAVA, JSP, Spring, Mybatis. html 위주로 만든 쇼핑몰 페이지입니다. 앞으로도 계속 기능을 추가하여 제작할 예정입니다.


## 프로젝트 주요 기술 설명
<h3>Controller</h3>  
3개의 컨트롤러 파일(관리자, 유저 정보, 유저 쇼핑)로 나눠서 관리하도록 만들었다. 직접 테스트 해봤을 때 이렇게 나누는 게 안 헷갈리고 가장 효율적이였다.
![controller](https://user-images.githubusercontent.com/52438368/93668303-86c8da00-fac6-11ea-8b9c-ba21b82d714d.PNG)
<h3>Mybatis</h3>  
Mybatis를 사용하여 데이터베이스로의 불필요한 접근을 간소화 하였고 직관성있게 데이베베이스에 접근하도록 하였다.
![mybits](https://user-images.githubusercontent.com/52438368/93668309-8b8d8e00-fac6-11ea-97fb-67470fce2cd5.PNG) 
<h3>Intreceptor</h3>  
Interceptor를 통해서 기본 유저의 관리자 모드의 접속을 금지시켰다. admin이 들어가는 주소는 모두 기본 메뉴로 돌아도로록 하였다.
![Interceptor](https://user-images.githubusercontent.com/52438368/93668304-87fa0700-fac6-11ea-8dc4-bdd7898db3fe.PNG) 
<h3>ckEditor</h3>  
ckEditor를 통해서 상품의 설명을 작성할 때 보다 이쁘게 작성할 수 있도록 하였다.
![ckEditor](https://user-images.githubusercontent.com/52438368/93668308-8a5c6100-fac6-11ea-95ba-23d42e26fa69.PNG) 
<h3>기타 기술</h3>
Spring, jsp, html, css, Ajax, JavaScript를 통한 유효성 검사, Oracle사의 SqlDevelop를 통한 DB 접근, mapper분리, 이미지 업로드 후 출력, include 파일 분리 작성..  


## 포함 목록
다운로드 목록에는 다음과 같은 디렉토리와 파일이 있으며 공통 에셋을 논리적으로 그룹화하고 유사 및 축소 변형을 모두 제공합니다.  
볼 수 있는 목록:

* P7-Onlide_Shopping_Site
   * .setting
      * ...
   * captures
      * ...
   * src
      * main
        * java/com/shopping
           * controller
              * AdminController.java
              * MemberController.java
              * ShopController.java
           * domain
              * CartListVO.java
              * ...
           * interceptor
              * AdminIntreceptor
           * persistance
              * AdminDAO.java
              * AdminDAOImp.java
              * ...
           * service
              * AdminService.java
              * AdminServiceImp.java
              * ...
           * utils
              * UploadFileUtiles.java
        * resources
           * mappers
              * adminMapper.xml
              * ...
           * spring
              * root-context.xml
              * spring-security.xml
           * mybatis-config.xml
           * servlet-context.xml
           * ...
        * webapp
           * WEB-INF
              * views
                  * admin
                      * ...
                  * include
                      * ...
                  * member
                      * ...
                  * shop
                      * ...
              * web.xml
           * resources
              * assets
                  * ...
              * ckeditor
                  * ...
              * images
                  * ...
              * imgUpload
                  * ...
      * test/resources
        * ...
   * Shopping_DB.txt
   * ...

## 동작 과정
1. Clone the repo: `git clone https://github.com/LeeKiJong/P7-Online_Shopping_Site.git` 
2. apache-tomcat execute
3. Enter Website: 'http://localhost:8181/shopping/member/signin'

## 기능 소개
1. 로그인
2. 로그아웃
3. 회원가입
4. 상품 목록 조회
5. 상품 정보 상세조회
6. 상품 장바구니에 넣기
7. 상품 주문
8. 댓글 달기
9. 상품 정보 수정
10. 상품 등록
11. 모든 댓글 조회
12. 모든 주문 목록 보기
13. 주문 정보 상세조회

## 예상 시나리오
1. 관리자 회원가입
2. 관리자 로그인
3. 상품 등록
4. 상품 수정
5. 로그아웃
6. 유저 회원가입
7. 유저 로그인
8. 상품 보기
9. 상품 장바구니에 담기
10. 상품 주문
11. 주소 입력
12. 상품 배송준비 확인
13. 관리자의 배송완료 표시
14. 유저 배송완료 확인


**`위의 예상 시나리오가 오류없이 진행되고 결과도 정상적으로 나온다면 정상 작동으로 볼 수 있습니다.`**

## 결과 화면  


### 1. 메인 페이지
![관리자메인페이지](https://user-images.githubusercontent.com/52438368/93668280-5d0fb300-fac6-11ea-8fa2-1ae877e5cc44.PNG)
### 2. 기타 페이지
다른 페이지는 captures 폴더 안에 있습니다.

