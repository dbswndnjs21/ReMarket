package dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class CommentDto {
	private int id;
	private int boardId;
	private String userId;
	private String content;
	private Timestamp createdAt;
	private Timestamp updatedAt;
	private int status;
	
	private String userName; // user1 테이블 조인해서 id에 해당하는 유저 이름 가져오기
	
	public String getFormattedCreatedAt() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        return sdf.format(createdAt);
    }
	
	public CommentDto(int id, int boardId, String userId, String content, Timestamp createdAt, Timestamp updatedAt,
			int status, String userName) {
		this.id = id;
		this.boardId = boardId;
		this.userId = userId;
		this.content = content;
		this.createdAt = createdAt;
		this.updatedAt = updatedAt;
		this.status = status;
		this.userName = userName;
	}

	public CommentDto() {
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getBoardId() {
		return boardId;
	}

	public void setBoardId(int boardId) {
		this.boardId = boardId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
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

}
