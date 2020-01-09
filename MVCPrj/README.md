
# MVCPrj
## JSP MVC Model1 & MVC Model2 기반 회원제 게시판 웹사이트

목차
- [프로젝트 소개](#프로젝트-소개)
- [사용(가능)한 기술 및 툴](#사용(가능)한-기술-및-툴)
- [주요 기능 설명](#주요-기능-설명)
- [구동 참고](#구동-참고)

프로젝트 소개
--------
회원제 게시판 웹사이트는 로그인을 통해 회원으로 접속한 사용자만 게시판에 접근할 수 있는 사이트 이다. 아이디가 없을 시 회원가입이 가능하며, 마이페이지를 통해 회원비밀번호 변경, 회원 정보 수정, 회원탈퇴 등 회원관리가 가능하다. 기존의 JSP프로젝트에서 유지보수 및 관리가 어려운 다소 복잡하고 정돈되지 않은 코드들에 대한 아쉬움이 있어 MVC model1과 MVCmodel2의 이해를 돕는 간단한 프로젝트를 구성해보았다.

사용(가능)한 기술 및 툴
--------
-	jre1.8, mysql-connector-java-8.0.18, JDBC, JSP2.3, Servlet3.1, HTML5, CSS3, Javascript1.8.5, EL3.0, JSTL1.2, jQuery3.2.1, XML, Ajax, JSON, Bootstrap3.3.7, etc.
-	Eclipse 4.11.0, apache-tomcat-9.0.29, MYSQL Workbench 8.0CE etc.

주요 기능 설명
------
<img src="https://github.com/maedoong2/mong_Prj/blob/master/MVCPrj/images/1.JPG">
<br>
<img src="https://github.com/maedoong2/mong_Prj/blob/master/MVCPrj/images/2.JPG">
<br>
<img src="https://github.com/maedoong2/mong_Prj/blob/master/MVCPrj/images/3.JPG">
<br>
<img src="https://github.com/maedoong2/mong_Prj/blob/master/MVCPrj/images/4.JPG">
<br>
<img src="https://github.com/maedoong2/mong_Prj/blob/master/MVCPrj/images/5.JPG">
<br>
<img src="https://github.com/maedoong2/mong_Prj/blob/master/MVCPrj/images/6.JPG">
<br>
<img src="https://github.com/maedoong2/mong_Prj/blob/master/MVCPrj/images/7.JPG">
<br>
<img src="https://github.com/maedoong2/mong_Prj/blob/master/MVCPrj/images/8.JPG">
<br>

일부 코드 및 파일 명세
------
#### ▷ JDBC 연동
* ##### context.xml
```java
<!-- Connection Pool 설정 -->
    <Resource
    			auth="Container"
    			driverClassName = "com.mysql.jdbc.Driver"
    			url = "jdbc:mysql://localhost:3306/myfirstweb?useUnicode=true&amp;characterEncoding=utf8"
    			username = "root"
    			password = "1234"
    			name = "jdbc/mysql"
    			type = "javax.sql.DataSource"
    			maxActive = "300"
    			maxWait = "1000"
     />
```
* ##### JdbcUtil.java
finally 안에서 close를 하기 위해 try catch 할 필요없이 메서드만 부르도록.

* ##### BoardDAO.java
```java
public class BoardDAO {
	//싱글톤
	private static BoardDAO dao = new BoardDAO();
	private DataSource ds;
	
	private BoardDAO() {
		try {
			Context ct = new InitialContext();
			ds = (DataSource)ct.lookup("java:comp/env/jdbc/mysql");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	 }
	 
	 public static BoardDAO getInstance() {
		 if(dao == null) {
			 dao = new BoardDAO();
		 }
		 return dao;
	 }
```
* ##### BoardVO.java(자바빈)
```java
public class BoardVO {

	private int bId;
	private String bName;
	private String bTitle;
	private String bContent;
	private Timestamp bDate;
	private int bHit;
	...
```
* ##### BoardController.java
```java
@WebServlet("*.do")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  public BoardController() {}
    
	protected void doGet(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		doRequest(request, response);
	}
	
	protected void doPost(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		doRequest(request, response);
	}

	//단순히 경로를 숨기기 위함이면, get이든  post든 doRquest()에서 받도록 한다.
	private void doRequest(HttpServletRequest request, HttpServletResponse response) 
												throws ServletException, IOException{
		request.setCharacterEncoding("utf-8");
		
		String uri = request.getRequestURI();
		
		//컨트롤러가 안내해줄 UI페이지의 경로정보를 담을 변수.
		String viewPage = null;
		//인터페이스 다형성
		IBoardService sv = null;
		
		//게시글리스트보여주기
		if(uri.equals("/MVCPrj/board/BList.do")) {
			sv = new BoardListService();
			sv.execute(request, response);
			viewPage = "/board/board_list.jsp";
		} //게시글작성페이지
		else if(uri.equals("/MVCPrj/board/BWriteView.do")) {
			viewPage = "/board/board_write_view.jsp";
		} //게시글작성처리(등록)부분
		else if(uri.equals("/MVCPrj/board/BWrite.do")) {
			sv = new BoardWriteService();
			sv.execute(request, response);
			viewPage="/board/BList.do";
		} //게시글 내용 보여주기
		else if(uri.equals("/MVCPrj/board/BContent.do")) {
			sv = new BoardContentService();
			sv.execute(request, response);
			viewPage = "/board/board_content_view.jsp";
		}//게시글 수정 페이지
		else if(uri.equals("/MVCPrj/board/BUpdateView.do")) {
			sv = new BoardContentService();
			sv.execute(request, response);
			viewPage = "/board/board_update_view.jsp";
		}//게시글 수정 처리
		else if(uri.equals("/MVCPrj/board/BUpdate.do")) {
			sv =  new BoardUpdateService();
			sv.execute(request, response);
			viewPage="/board/BList.do";
		}//게시글 삭제 처리
		else if(uri.equals("/MVCPrj/board/BDelete.do")) {
			sv = new BoardDeleteService();
			sv.execute(request, response);
			viewPage="/board/BList.do";
		}
		
		//페이지 강제이동 forward
		//<jsp:forward page="">
		RequestDispatcher dp = request.getRequestDispatcher(viewPage);
		dp.forward(request, response);

```

#### ▷ 게시글작성
* ##### BoardDAO.java
```java
//게시글 내용을 DB에 저장하는 메서드.
public void write(String bName, String bTitle, String bContent) {
	
String sql = "insert into board (board_name, board_title, board_content) values (?, ?, ?)";
		 
		 Connection conn = null;
		 PreparedStatement pstmt = null;
		 
		 try {
			 conn = ds.getConnection();
			 pstmt = conn.prepareStatement(sql);
			 pstmt.setString(1, bName);
			 pstmt.setString(2, bTitle);
			 pstmt.setString(3, bContent);
			 pstmt.executeUpdate();
		
		 }catch(Exception e) 
		 {
			 e.printStackTrace();
		 }finally {
			 JdbcUtil.close(conn);
			 JdbcUtil.close(pstmt);
		 }
	 }
```
* ##### BoardWriteService.java
```java
public class BoardWriteService implements IBoardService{
	
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		BoardDAO dao = BoardDAO.getInstance();
		String bName = request.getParameter("bName");
		String bTitle = request.getParameter("bTitle");
		String bContent = request.getParameter("bContent");

		dao.write(bName, bTitle, bContent);
	}
}
```

#### ▷ 게시글 내용보기
* ##### BoardDAO.java
```java
//게시글 내용을 보여주는 메서드
	 public BoardVO getBoardContent(String BId) {
		 
		 upHit(BId); //조회수 증가 메서드
		 
		 BoardVO contents = new BoardVO();
		 String sql = "SELECT * FROM board WHERE board_id = ?";
		 
		 Connection conn = null;
		 PreparedStatement pstmt = null;
		 ResultSet rs = null;
		 
		 try {
			 conn = ds.getConnection();
			 pstmt = conn.prepareStatement(sql);
			 pstmt.setInt(1, Integer.parseInt(BId));
			 
			 rs = pstmt.executeQuery();
			 
			 if(rs.next()) {
				 contents = new BoardVO(
						 rs.getInt("board_id"), 
						 rs.getString("board_name"), 
						 rs.getString("board_title"), 
						 rs.getString("board_content"), 
						 rs.getTimestamp("board_date"), 
						 rs.getInt("board_hit"));
			 }
		 }catch(Exception e) {
			 e.printStackTrace();
		 }finally {
			 JdbcUtil.close(conn);
			 JdbcUtil.close(pstmt);
			 JdbcUtil.close(rs);
		 }		 
		 return contents;
	 }

```
* ##### BoardContentService.java
```java
public class BoardContentService implements IBoardService{
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		BoardDAO dao = BoardDAO.getInstance();
		String bId = request.getParameter("bId");
		BoardVO contents = new BoardVO();
		contents = dao.getBoardContent(bId);
		request.setAttribute("contents", contents);
	}
}

```
#### ▷ 게시글 수정
* ##### board_update_view.jsp
게시글 수정화면
* ##### boardDAO.java
```java
//글 수정 처리
	 public void UpdateArticle(String bId, String bTitle, String bContent) {
		 
		 String sql = "UPDATE board SET board_title=?, board_content=? WHERE board_id=?";
		 
		 Connection conn = null;
		 PreparedStatement pstmt = null;
		 
		 try {
			 conn = ds.getConnection();
			 pstmt = conn.prepareStatement(sql);
			 pstmt.setString(1, bTitle);
			 pstmt.setString(2, bContent);
			 pstmt.setInt(3, Integer.parseInt(bId));
			 pstmt.executeUpdate();
		 }catch(Exception e) {
			 e.printStackTrace();
		 }finally {
			 JdbcUtil.close(conn);
			 JdbcUtil.close(pstmt);
		 }
	 }
```
* ##### BoardUpdateService.java
```java
public class BoardUpdateService implements IBoardService{
	
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		BoardDAO dao = BoardDAO.getInstance();
		
		String bId = request.getParameter("bId");
		String bTitle = request.getParameter("bTitle");
		String bContent = request.getParameter("bContent");
		
		dao.UpdateArticle(bId, bTitle, bContent);
	}
}
```
#### ▷ 게시글 삭제
* ##### BoardDAO.java
* ##### BoardDeleteService.java

#### ▷ 게시글 조회수
* ##### BoardDAO.java
``java
	 private void upHit(String BId) { 
		 String sql = "UPDATE board SET board_hit = board_hit+1 WHERE board_id = ?";
		 Connection conn = null;
		 PreparedStatement pstmt = null;
		 try {
			 conn = ds.getConnection();
			 pstmt = conn.prepareStatement(sql);
			 pstmt.setInt(1, Integer.parseInt(BId));
			 pstmt.executeUpdate();
		 }catch(Exception e) {
			 e.printStackTrace();
		 }finally {
			 JdbcUtil.close(conn);
			 JdbcUtil.close(pstmt);
``

#### ▷ 게시글 페이징처리 및 리스트보기
* ##### board_list.jsp
전체 게시글 리스트를 보여주고, 페이징처리화면을 보여준다.
* ##### BoardDAO.java
총 게시물의 개수 조회 메서드
게시글 목록을 DB로 부터 받아올 메서드
* ##### BoardPageService.java
총 페이지의 수를 계산한다.
* ##### BoardListService.java

#### ▷ 회원가입, 로그인(MVC Model1)
* ##### login_modal.jspf
회원가입과 로그인 모달창을 보여준다.
* ##### join_ok.jsp
회원가입 처리를 도와준다.
* ##### check_login.jsp
로그인 처리를 해준다.

#### ▷ 비밀번호 변경(MVC Model1)
* ##### mypage_change_pw.jsp
비밀번호 변경 페이지 뷰를 보여준다.
* ##### change_pw_ok.jsp
올바른 비밀번호를 입력 시, 비밀번호 변경처리를 해준다.

#### ▷ 회원정보 변경(MVC Model1)
* ##### mypage_update.jsp
회원정보수정 페이지 뷰를 보여준다.
* ##### user_update_ok.jsp
회원정보 변경 처리를 해준다.

#### ▷ 회원탈퇴(MVC Model1)
* ##### mypage_delete_check.jsp
회원정보 삭제 화면을 보여준다.
* ##### user_delete.jsp 
회원정보 삭제 여부를 되묻는 화면을 보여준다.
* ##### user_delete_ok.jsp 
회원정보 삭제를 처리하며 로그아웃을 시킨다.

구동 참고 
--------
- Eclipse 및 Tomcat 설치를 통한 구동이 필요합니다. jdk환경변수 설정이 필요 합니다.

- context.xml 데이터베이스 계정이 필요합니다.

- TeamPrj.sql의 query 실행을 통한 table 생성이 필요 합니다.

- 서버 구동 이후 크롬에서 실행하길 권장 합니다.
