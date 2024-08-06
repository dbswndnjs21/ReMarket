package dto;

import java.util.Date;

public class UserDto {
    private String pCode;
    private String userId;
    private String password;
    private String name;
    private String email;
    private String phone;
    private String addr;
    private Date joinDate;
    private int grade;
    private String birth;

    public UserDto() {
    }

    public UserDto(String pCode, String userId, String password, String name, String email, String phone, String addr, Date joinDate, int grade, String birth) {
        this.pCode = pCode;
        this.userId = userId;
        this.password = password;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.addr = addr;
        this.joinDate = joinDate;
        this.grade = grade;
        this.birth = birth;
    }

    public UserDto(String userId, String name, String email, String phone, String addr, String birth) {
        this.userId = userId;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.addr = addr;
        this.birth = birth;
    }

    public String getpCode() {
        return pCode;
    }

    public void setpCode(String pCode) {
        this.pCode = pCode;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr;
    }

    public Date getJoinDate() {
        return joinDate;
    }

    public void setJoinDate(Date joinDate) {
        this.joinDate = joinDate;
    }

    public int getGrade() {
        return grade;
    }

    public void setGrade(int grade) {
        this.grade = grade;
    }

    public String getBirth() {
        return birth;
    }

    public void setBirth(String birth) {
        this.birth = birth;
    }

    @Override
    public String toString() {
        return "UserDto{" +
                "pCode='" + pCode + '\'' +
                ", userId='" + userId + '\'' +
                ", password='" + password + '\'' +
                ", name='" + name + '\'' +
                ", email='" + email + '\'' +
                ", phone='" + phone + '\'' +
                ", addr='" + addr + '\'' +
                ", joinDate=" + joinDate +
                ", grade=" + grade +
                ", birth='" + birth + '\'' +
                '}';
    }
}
