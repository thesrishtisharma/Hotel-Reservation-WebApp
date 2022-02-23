package sharma.srishti.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class hotel {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int hotel_id;
    private int state_id;
    private String hotel_name;
    private boolean hotel_status;

    public int getHotel_id() {
        return hotel_id;
    }

    public void setHotel_id(int hotel_id) {
        this.hotel_id = hotel_id;
    }

    public int getState_id() {
        return state_id;
    }

    public void setState_id(int state_id) {
        this.state_id = state_id;
    }

    public String getHotel_name() {
        return hotel_name;
    }

    public void setHotel_name(String hotel_name) {
        this.hotel_name = hotel_name;
    }

    public boolean isHotel_status() {
        return hotel_status;
    }

    public void setHotel_status(boolean hotel_status) {
        this.hotel_status = hotel_status;
    }

    public hotel(int hotel_id, int state_id, String hotel_name, boolean hotel_status) {
        this.hotel_id = hotel_id;
        this.state_id = state_id;
        this.hotel_name = hotel_name;
        this.hotel_status = hotel_status;
    }

    public hotel() {
        super();
    }

    @Override
    public String toString() {
        return "hotel{" +
                "hotel_id=" + hotel_id +
                ", state_id=" + state_id +
                ", hotel_name='" + hotel_name + '\'' +
                ", hotel_status=" + hotel_status +
                '}';
    }
}