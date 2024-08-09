package dto;

import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class BoardDto {
	// 자유게시판 DTO (Board 테이블) 
	private int id; // 게시글 순번, 기본키 
	private String userId; // user1 테이블 참조 키 pcode
	private String title; // 게시글 제목 
	private String content; // 게시글 내용
	private int hit; // 게시글 조회수
	private Timestamp createdAt; // 게시글 생성일자
	private Timestamp updatedAt; // 게시글 수정일자
	private int status; // 게시글 삭제 버튼 클릭 시, status -> 0으로 변환, 기본 값 1
	
	private String userName; // user1 테이블에서 userName을 사용하기 위해 변수 생성.
	
	private int commentCount; // 댓글 개수 저장
	
	

	public String getFormattedCreatedAt() {
       DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("HH:mm");
       DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
       
       LocalDateTime createdDateTime = createdAt.toLocalDateTime();
       
       LocalDateTime now = LocalDateTime.now();
       // 같은 날인지 확인
       if(now.toLocalDate().isEqual(createdDateTime.toLocalDate())) {
    	   // 당일 -> 시간만 표시
    	   return createdDateTime.format(timeFormatter);
       } else {
    	   // 하루 이상 지났으면 yyyy-MM-dd 형식으로 표시
    	   return createdDateTime.format(dateFormatter);
       }
       
    }
	
	public BoardDto() {
	}

	public BoardDto(int id, String userId, String title, String content, int hit, Timestamp createdAt,
			Timestamp updatedAt, int status, String userName) {
		this.id = id;
		this.userId = userId;
		this.title = title;
		this.content = content;
		this.hit = hit;
		this.createdAt = createdAt;
		this.updatedAt = updatedAt;
		this.status = status;
		this.userName = userName;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public Timestamp getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Timestamp createdAt) {
		this.createdAt = createdAt;
	}
	public Timestamp getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(Timestamp updatedAt) {
		this.updatedAt = updatedAt;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getCommentCount() {
		return commentCount;
	}

	public void setCommentCount(int commentCount) {
		this.commentCount = commentCount;
	}
	
}
