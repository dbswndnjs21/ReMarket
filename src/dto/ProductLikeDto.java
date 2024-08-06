package dto;

import java.util.Date;

public class ProductLikeDto {

    private String likeId;
    private Date createdAt;
    private int likeStatus;
    private String user_id;
    private String productId;

    public ProductLikeDto() {
    }

    public ProductLikeDto(String likeId, Date createdAt, int likeStatus, String user_id, String productId) {
        this.likeId = likeId;
        this.createdAt = createdAt;
        this.likeStatus = likeStatus;
        this.user_id = user_id;
        this.productId = productId;
    }

    public String getLikeId() {
        return likeId;
    }

    public void setLikeId(String likeId) {
        this.likeId = likeId;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public int getLikeStatus() {
        return likeStatus;
    }

    public void setLikeStatus(int likeStatus) {
        this.likeStatus = likeStatus;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }
}
