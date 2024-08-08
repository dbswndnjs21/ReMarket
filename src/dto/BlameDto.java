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
	private String blameUser; // 피신고자 아이디
	private int product_id; // product 테이블 참고키 fk
	
	private String userName; // user1 테이블에서 userName을 사용하기 위해 변수 생성.
	private String product_name; // product 테이블에서 product_name을 사용하기 위해 변수 생성. 
	
	public BlameDto(int blameId, String blameTitle, String blameCategory, Timestamp createdAt, int status, String blameContent) {
		this.blameId = blameId;
		this.blameTitle = blameTitle;
		this.blameCategory = blameCategory;
		this.createdAt = createdAt;
		this.status = status;
		this.blameContent = blameContent;
	}

	public BlameDto(int blameId, String pCode, String blameTitle, String blameCategory, String blameContent,
			Timestamp createdAt, int status, String userName, String blameUser, String product_name, int product_id) {
		
		this.blameId = blameId;
		this.pCode = pCode;
		this.blameTitle = blameTitle;
		this.blameCategory = blameCategory;
		this.blameContent = blameContent;
		this.createdAt = createdAt;
		this.status = status;
		this.userName = userName;
		this.blameUser = blameUser;
		this.product_name = product_name;
		this.product_id = product_id;
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

	public String getBlameUser() {
		return blameUser;
	}

	public void setBlameUser(String blameUser) {
		this.blameUser = blameUser;
	}

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}	
	
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	@Override
	public String toString() {
		return "BlameDto [blameId=" + blameId + ", blameTitle=" + blameTitle + ", blameCategory=" + blameCategory
				+ ", pCode=" + pCode + ", createdAt=" + createdAt + ", status=" + status + ", blameContent="
				+ blameContent + ", blameUser=" + blameUser + ", product_id=" + product_id + 
				", userName=" + userName + ", product_name=" + product_name + "]";
	}
	
	public String getFormattedCreatedAt() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        return sdf.format(createdAt);
    }
	
}
