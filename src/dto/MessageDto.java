package dto;

import java.sql.Timestamp;

public class MessageDto {
    private int msgId; // 추가
    private String user_id;
    private String sendId;
    private String receiveId;
    private String productName;
    private String content;
    private Timestamp sendDate;
    private int msgStatus;

    // Getters and setters for all fields
    public int getMsgId() { return msgId; }
    public void setMsgId(int msgId) { this.msgId = msgId; }
    public String getUser_id() { return user_id; }
    public void setUser_id(String user_id) { this.user_id = user_id; }
    public String getSendId() { return sendId; }
    public void setSendId(String sendId) { this.sendId = sendId; }
    public String getReceiveId() { return receiveId; }
    public void setReceiveId(String receiveId) { this.receiveId = receiveId; }
    public String getProductName() { return productName; }
    public void setProductName(String productName) { this.productName = productName; }
    public String getContent() { return content; }
    public void setContent(String content) { this.content = content; }
    public Timestamp getSendDate() { return sendDate; }
    public void setSendDate(Timestamp sendDate) { this.sendDate = sendDate; }
    public int getMsgStatus() { return msgStatus; }
    public void setMsgStatus(int msgStatus) { this.msgStatus = msgStatus; }
}