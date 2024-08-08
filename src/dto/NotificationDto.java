package dto;

import java.sql.Timestamp;
import java.util.Date;

public class NotificationDto {
    private int Id;
    private String receiverId;
    private String senderId;
    private int type;
    private String content;
    private Date createdAt;
    private int notiStatus;

    public int getNotiStatus() {
        return notiStatus;
    }

    public void setNotiStatus(int notiStatus) {
        this.notiStatus = notiStatus;
    }

    public int getId() {
        return Id;
    }

    public void setId(int id) {
        Id = id;
    }

    public String getReceiverId() {
        return receiverId;
    }

    public void setReceiverId(String receiverId) {
        this.receiverId = receiverId;
    }

    public String getSenderId() {
        return senderId;
    }

    public void setSenderId(String senderId) {
        this.senderId = senderId;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }
}
