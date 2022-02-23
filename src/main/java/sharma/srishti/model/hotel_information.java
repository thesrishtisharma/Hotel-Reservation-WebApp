package sharma.srishti.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class hotel_information {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int room_id;
    private int hotel_id;
    private String room_type;
    private double price;
    private double gst;
    private double total;

    public int getRoom_id() {
        return room_id;
    }

    public void setRoom_id(int room_id) {
        this.room_id = room_id;
    }

    public int getHotel_id() {
        return hotel_id;
    }

    public void setHotel_id(int hotel_id) {
        this.hotel_id = hotel_id;
    }

    public String getRoom_type() {
        return room_type;
    }

    public void setRoom_type(String room_type) {
        this.room_type = room_type;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getGst() {
        return gst;
    }

    public void setGst(double gst) {
        this.gst = gst;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public hotel_information(int room_id, int hotel_id, String room_type, double price, double gst, double total) {
        this.room_id = room_id;
        this.hotel_id = hotel_id;
        this.room_type = room_type;
        this.price = price;
        this.gst = gst;
        this.total = total;
    }

    public hotel_information() {
        super();
    }

    @Override
    public String toString() {
        return "hotel_information{" +
                "room_id=" + room_id +
                ", hotel_id=" + hotel_id +
                ", room_type='" + room_type + '\'' +
                ", price=" + price +
                ", gst=" + gst +
                ", total=" + total +
                '}';
    }
}
