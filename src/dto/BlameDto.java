package dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;


public class BlameDto {
	// 신고게시판 DTO (BLAME 테이블)
	private int blameId; // 신고 게시글 순번, pk
	private String blameTitle; // 신고 게시글 제목
	private String blameCategory; // 신고 유형
	private String pCode; // user1 테이블 참조키 fk
	private Timestamp createdAt; // 신고 게시글 생성일자
	private int status; // 신고 처리 버튼 클릭 시, status -> 0으로 변환, 기본 값 1
	private String blameContent; // 신고 내용
	
	private String userName; // user1 테이블에서 userName을 사용하기 위해 변수 생성.
	
	public String getFormattedCreatedAt() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        return sdf.format(createdAt);
    }
	
	public BlameDto(int blameId, String blameTitle, String blameCategory, Timestamp createdAt, int status, String blameContent) {
		
	}
	
	public BlameDto() {
		// TODO Auto-generated constructor stub
	}

	public BlameDto(int blameId, String pCode, String blameTitle, String blameCategory, String blameContent,
			Timestamp createdAt, int status, String userName) {
		
		this.blameId = blameId;
		this.pCode = pCode;
		this.blameTitle = blameTitle;
		this.blameCategory = blameCategory;
		this.blameContent = blameContent;
		this.createdAt = createdAt;
		this.status = status;
		this.userName = userName;
		// TODO Auto-generated constructor stub
	}

	public int getBlameId() {
		return blameId;
	}

	public void setBlameId(int blameId) {
		this.blameId = blameId;
	}

	public String getBlameTitle() {
		return blameTitle;
	}

	public void setBlameTitle(String blameTitle) {
		this.blameTitle = blameTitle;
	}

	public String getBlameCategory() {
		return blameCategory;
	}

	public void setBlameCategory(String blameCategory) {
		this.blameCategory = blameCategory;
	}

	public String getpCode() {
		return pCode;
	}

	public void setpCode(String pCode) {
		this.pCode = pCode;
	}

	public Timestamp getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Timestamp createdAt) {
		this.createdAt = createdAt;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getBlameContent() {
		return blameContent;
	}

	public void setBlameContent(String blameContent) {
		this.blameContent = blameContent;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	@Override
	public String toString() {
		return "BlameDto [blameId=" + blameId + ", blameTitle=" + blameTitle + ", blameCategory=" + blameCategory
				+ ", pCode=" + pCode + ", createdAt=" + createdAt + ", status=" + status + ", blameContent="
				+ blameContent + ", userName=" + userName + "]";
	}
	
	
}
