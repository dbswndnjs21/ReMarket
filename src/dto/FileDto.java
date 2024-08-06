package dto;

public class FileDto {
	private String fileId;
	private int productId;
	private String fileName;
	private String saveFileName;
	
	public FileDto() {
		// TODO Auto-generated constructor stub
	}
	
	
	public FileDto(String fileId, String fileName, String saveFileName) {
		super();
		this.fileId = fileId;
		this.fileName = fileName;
		this.saveFileName = saveFileName;
	}


	public FileDto(int productId, String fileName, String saveFileName) {
		super();
		
		this.productId = productId;
		this.fileName = fileName;
		this.saveFileName = saveFileName;	
	}
	
	
	public FileDto(String fileId, int productId, String fileName, String saveFileName) {
		super();
		this.fileId = fileId;
		this.productId = productId;
		this.fileName = fileName;
		this.saveFileName = saveFileName;
	}


	public String getFileId() {
		return fileId;
	}

	public void setFileId(String fileId) {
		this.fileId = fileId;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getSaveFileName() {
		return saveFileName;
	}

	public void setSaveFileName(String saveFileName) {
		this.saveFileName = saveFileName;
	}

	 @Override
	    public String toString() {
	        return "FileDto{" +
	                "fileId='" + fileId + '\'' +
	                ", productId=" + productId +
	                ", fileName='" + fileName + '\'' +
	                ", saveFileName='" + saveFileName + '\'' +
	                '}';
	    }

	
	
	
}
