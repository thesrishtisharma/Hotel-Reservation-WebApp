package sharma.srishti.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class state {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    private String state_name;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getState_name() {
        return state_name;
    }

    public void setState_name(String state_name) {
        this.state_name = state_name;
    }

    public state(int id, String state_name) {
        this.id = id;
        this.state_name = state_name;
    }

    public state() {
        super();
    }

    @Override
    public String toString() {
        return "state{" +
                "id=" + id +
                ", state_name='" + state_name + '\'' +
                '}';
    }
}
