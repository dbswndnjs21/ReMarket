package dto;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ProductDto {
   private int productId;
   private String productName;
   private String user_id;
   private String price;
   private Date productDate;
   private Date modifyDate;
   private int wishNum;
   private String dong;
   private String productStatus;
   private String category;
   private int hit;
   private String content;
   
    // 추가된 필드
    private List<FileDto> files = new ArrayList<>(); // 초기화된 빈 리스트로 설정

   FileDto fileDto=null;

   public FileDto getFileDto() {
      return fileDto;
   }

   public void setFileDto(FileDto fileDto) {
      this.fileDto = fileDto;
   }
// 생성자 및 기타 필드들

    // Getter 및 Setter
    public List<FileDto> getFiles() {
        return files;
    }

    public void setFiles(List<FileDto> files) {
        this.files = files;   
    }
   
   public ProductDto() {
      // TODO Auto-generated constructor stub
   }

   public ProductDto(int productId, String productName, String user_id, String price, Date productDate,
         Date modifyDate, int wishNum, String dong, String productStatus, String category, int hit, String content) {
      super();
      this.productId = productId;
      this.productName = productName;
      this.user_id = user_id;
      this.price = price;
      this.productDate = productDate;
      this.modifyDate = modifyDate;
      this.wishNum = wishNum;
      this.dong = dong;
      this.productStatus = productStatus;
      this.category = category;
      this.hit = hit;
      this.content = content;
   }
   
   

   public ProductDto(String productName, String user_id, String price,String dong,String productStatus, String category,  String content) {
      super();
      this.productName = productName;
      this.user_id = user_id;
      this.price = price;
      this.category = category;
      this.content = content;
      this.dong = dong;
      this.productStatus = productStatus;
   }

   public int getProductId() {
      return productId;
   }

   public void setProductId(int productId) {
      this.productId = productId;
   }

   public String getProductName() {
      return productName;
   }

   public void setProductName(String productName) {
      this.productName = productName;
   }

   public String getUser_id() {
      return user_id;
   }

   public void setUser_id(String user_id) {
      this.user_id = user_id;
   }

   public String getPrice() {
      return price;
   }

   public void setPrice(String price) {
      this.price = price;
   }

   public Date getProductDate() {
      return productDate;
   }

   public void setProductDate(Date productDate) {
      this.productDate = productDate;
   }

   public Date getModifyDate() {
      return modifyDate;
   }

   public void setModifyDate(Date modifyDate) {
      this.modifyDate = modifyDate;
   }

   public int getWishNum() {
      return wishNum;
   }

   public void setWishNum(int wishNum) {
      this.wishNum = wishNum;
   }

   public String getDong() {
      return dong;
   }

   public void setDong(String dong) {
      this.dong = dong;
   }

   public String getProductStatus() {
      return productStatus;
   }

   public void setProductStatus(String productStatus) {
      this.productStatus = productStatus;
   }

   public String getCategory() {
      return category;
   }

   public void setCategory(String category) {
      this.category = category;
   }

   public int getHit() {
      return hit;
   }

   public void setHit(int hit) {
      this.hit = hit;
   }

   public String getContent() {
      return content;
   }

   public void setContent(String content) {
      this.content = content;
   }
   
     @Override
       public String toString() {
           return "ProductDto{" +
                   "productId=" + productId +
                   ", productName='" + productName + '\'' +
                   ", category='" + category + '\'' +
                   ", price=" + price +
                   ", files=" + files +
                   '}';
       }
   
   
}
