JAVA / JSP 기반 차량관리 시스템
=======
목차
- [프로젝트 소개](#프로젝트-소개)
- [사용(가능)한 기술 및 툴](#사용(가능)한-기술-및-툴)
- [주요 기능 설명](#주요-기능-설명)
- [구동 참고](#구동-참고)

프로젝트 소개
--------
차량관리 시스템은 사용자가 개인 계정을 가지고 자신의 차량 정보를 등록하여 정비 및 주유 등의 지출내역을 관리하는 시스템이다.
추가적으로 사용자는 지도 검색을 통해 주유소 정보를 찾을 수 있으며, 자유게시판을 이용하여 사용자들 간에 차량정보 공유가 가능하다.

사용(가능)한 기술 및 툴
--------
jre1.8.0, mysql-connector-java-8.0.18.jar, activation.jar, mail.jar, cos.jar, JDBC, JSP2.3, Servlet3.1, HTML5, CSS3, Javascript1.8.5, EL3.0, JSTL1.2, jQuery3.2.1, XML, Ajax, JSON, Bootstrap3.3.7, OpenApi (KakaoMap) etc, Eclipse 4.11.0, apache-tomcat-9.0.29, MYSQL Workbench 8.0CE etc.

김다솔, 이승욱 2명으로 프로젝트를 공동 진행했습니다.

주요 기능 설명
------
<img src="https://github.com/maedoong2/mong_Prj/blob/master/TeamPrj/images/1.png">
<br>
<img src="https://github.com/maedoong2/mong_Prj/blob/master/TeamPrj/images/2.png">
<br>
<img src="https://github.com/maedoong2/mong_Prj/blob/master/TeamPrj/images/3.png">
<br>
<img src="https://github.com/maedoong2/mong_Prj/blob/master/TeamPrj/images/4.png">
<br>
<img src="https://github.com/maedoong2/mong_Prj/blob/master/TeamPrj/images/5.png">
<br>
<img src="https://github.com/maedoong2/mong_Prj/blob/master/TeamPrj/images/6.png">
<br>
<img src="https://github.com/maedoong2/mong_Prj/blob/master/TeamPrj/images/7.png">
<br>
<img src="https://github.com/maedoong2/mong_Prj/blob/master/TeamPrj/images/8.png">
<br>
<img src="https://github.com/maedoong2/mong_Prj/blob/master/TeamPrj/images/9.png">
<br>
<img src="https://github.com/maedoong2/mong_Prj/blob/master/TeamPrj/images/10.png">
<br>
<img src="https://github.com/maedoong2/mong_Prj/blob/master/TeamPrj/images/11.png">
<br>
<img src="https://github.com/maedoong2/mong_Prj/blob/master/TeamPrj/images/12.png" width="300px">&nbps
<img src="https://github.com/maedoong2/mong_Prj/blob/master/TeamPrj/images/13.png" width="300px">
<br>
<img src="https://github.com/maedoong2/mong_Prj/blob/master/TeamPrj/images/14.png">
<br>

#### ▷ 회원가입
* ##### user.java
회원정보 객체, DTO(Data transfer Object)로써 계층간 데이터 교환을 위한 자바빈즈
* ##### userDAO.java
회원정보 기능 구현 메서드, DAO(Data Access Obejct)로써 데이터를 조화하거나 조작하는 기능을 담당하는 오브젝트
* ##### join.jsp
회원가입을 위한 페이지, 폼을 통해 회원정보 입력
* ##### joinAction.jsp
Join.jsp에서 넘어온 회원정보를 user.java , userDAO.java를 통해 Database에 정보 입력

#### ▷ 회원가입 이메일 인증
* ##### Gmail.java
인증 이메일 전송을 위한 객체 생성을 위한 클래스
* ##### SHA256.java
SHA(secure Hash Algorithm, 안전한 해시 알고리즘)으로 이메일을 암호화한 해시함수들의 모음
* ##### emailCheckAction.jsp
회원가입 시 이메일 인증을 하였는지 확인, SHA256.java 클래스를 통해 체크
* ##### emailSendAction.jsp
회원가입 시 이메일 인증이 보내지는 페이지, 이용자에게 이메일을 확인하고 인증하도록 한다.
* ##### emailSendConfirm.jsp
이메일 인증을 하지 않은 이용자가 로그인 할 때 뜨는 페이지, 인증 메일을 다시 보낼 수 있다.

#### ▷ 로그인
* ##### login.jsp
ID와 Password를 통해 회원 로그인을 제공 하는 페이지
* ##### loginAction.jsp
login.jsp에서 받아온 ID와 Password를 DB의 회원정보와 비교하여 로그인을 실행하게 한다.
#### ▷ 로그아웃
* ##### logoutAction.jsp
현재 세션에 저장된 로그인 회원 정보를 초기화 한다.

#### ▷ 차량정보등록
* ##### UserCar.java
회원 차량정보 객체, DTO(Data transfer Object)로써 계층간 데이터 교환을 위한 자바빈즈
* ##### UserCarDAO.java
회원 차량정보 기능 구현 메서드, DAO(Data Access Obejct)로써 데이터를 조화하거나 조작하는 기능을 담당하는 오브젝트
* ##### userCar.jsp
회원 차량정보 입력을 위한 페이지, 입력된 차량정보를 userCarAction.jsp로 보낸다.
* ##### userCarAction.jsp
userCar.jsp에서 넘어온 차량정보를 UserCar.java , UserCarDAO.java를 통해 Database에 정보 입력
#### ▷ 차량정비기록
* ##### Repair.java
차량 정비정보 객체, DTO(Data transfer Object)로써 계층간 데이터 교환을 위한 자바빈즈
* ##### RepairDAO.java
차량 정비정보 기능 구현 메서드, DAO(Data Access Obejct)로써 데이터를 조화하거나 조작하는 기능을 담당하는 오브젝트
* ##### repair.jsp
차량 정비정보를 입력하여 repairAction.jsp로 보내는 페이지
* ##### repairAction.jsp
repair.jsp에서 보낸 차량 정비정보를 Repair.java, RepairDAO.java를 통해 Database에 정보 입력
#### ▷ 차계부
* ##### repairbbs.jsp
Database에 저장된 차량 정비정보를 보여주고, 수정 및 삭제 기능이 구현된 페이지
* ##### repairbbsDeleteAction.jsp
repairbbs.jsp에서 삭제 버튼을 누르면 실행되며, 해당 차량 정비정보를 Databse에서 지운다.
* ##### repairbbsUpdateAction.jsp
repairbbs.jsp에서 삭제 버튼을 누르면 실행되며, 해당 차량 정비정보를 Databse에서 수정한다.

#### ▷ 게시판
* ##### Bbs.java
게시정보 객체, DTO(Data transfer Object)로써 계층간 데이터 교환을 위한 자바빈즈
* ##### BbsDAO.java
게시정보 기능 구현 메서드, DAO(Data Access Obejct)로써 데이터를 조화하거나 조작하는 기능을 담당하는 오브젝트
* ##### bbs.jsp
게시글을 정리하여 보여주는 페이지, 검색, 페이지 전환 등의 기능이 있다.

#### ▷ 게시판 글 작성
* ##### write.jsp
이용자가 입력한 게시 정보를 writeAction.jsp로 보내는 페이지 
* ##### writeAction.jsp
write.jsp에서 보내온 정보를 Database에 기록한다.

#### ▷ 게시판 글 수정
* ##### update.jsp
게시글이 현 세션의 이용자와 일치할 경우, 게시글 수정이 가능하도록 작성이 가능한 페이지
updateAction.jsp로 정보를 보낸다.
* ##### updateAction.jsp
Update.jsp에서 받은 정보를 Database에 기록한다.
#### ▷ 게시판 글 삭제
* ##### deleteAction.jsp
게시글이 현 세션의 이용자와 일치할 경우, 게시글을 삭제하는 기능을 한다.

#### ▷ 게시판 댓글 작성 및 삭제
* ##### view.jsp
클릭된 게시글의 내용과 댓글을 확인, 댓글 작성이 가능할 수 있게 하는 페이지
* ##### bbsReplyAction.jsp
View.jsp에서 댓글을 작성할 시 해당 정보를 Database에 기록한다.
* ##### bbsReplyDeleteAction.jsp
View.jsp에서 현 세션의 회원정보와 댓글기록 회원이 일치할 경우 댓글 삭제가 가능하도록 하는 기능

#### ▷ 게시판 조회수
#### ▷ 카카오맵API
* ##### kakaomap.jsp
카카오맵API를 가져와서 키워드 검색을 통해 정보를 보여주는 지도API를 구현한 페이지

구동 참고 
--------
- Eclipse 및 Tomcat 설치를 통한 구동이 필요합니다. jdk환경변수 설정이 필요 합니다.

- /util/Gmail.java의 구글아이디와 비밀번호 기입이 필요합니다. 
구글 계정의 보안설정에서 제3자 액서스가 필요합니다. emailSendAction.jsp에 from 변수 설정이 필요합니다.

- /util/DatabaseUtil.java, /usercar/UserCarDAO.java, /user/UserDAO.java, /repair/RepairDAO.java, /BbsDAO/BbsDAO.java 
5개의 클래스 코드에 dbID와 dbPassword 변수의 데이터베이스 계정이 필요합니다.

- TeamPrj.sql의 query 실행을 통한 table 생성이 필요 합니다.

- 서버 구동 이후 크롬에서 실행하길 권장 합니다.
