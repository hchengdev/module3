package model;

import java.math.BigDecimal;
import java.util.Date;

public class Premises {
    private int id;
    private String premisesCode;    // Mã mặt bằng
    private String status;          // Trạng thái
    private BigDecimal area;        // Diện tích
    private int floor;              // Tầng
    private String type;            // Loại mặt bằng
    private BigDecimal price;       // Giá tiền
    private Date startDate;         // Ngày bắt đầu
    private Date endDate;

    @Override
    public String toString() {
        return "Premises{" +
                "premisesCode='" + premisesCode + '\'' +
                ", status='" + status + '\'' +
                ", area=" + area +
                ", floor=" + floor +
                ", type='" + type + '\'' +
                ", price=" + price +
                ", startDate=" + startDate +
                ", endDate=" + endDate +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPremisesCode() {
        return premisesCode;
    }

    public void setPremisesCode(String premisesCode) {
        this.premisesCode = premisesCode;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public BigDecimal getArea() {
        return area;
    }

    public void setArea(BigDecimal area) {
        this.area = area;
    }

    public int getFloor() {
        return floor;
    }

    public void setFloor(int floor) {
        this.floor = floor;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public Premises(String premisesCode, String status, BigDecimal area, int floor, String type, BigDecimal price, Date startDate, Date endDate) {
        this.premisesCode = premisesCode;
        this.status = status;
        this.area = area;
        this.floor = floor;
        this.type = type;
        this.price = price;
        this.startDate = startDate;
        this.endDate = endDate;
    }

    public Premises() {
    }
}



