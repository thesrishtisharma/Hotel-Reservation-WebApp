package sharma.srishti.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;
import sharma.srishti.model.hotel;
import sharma.srishti.model.hotel_information;
import sharma.srishti.model.state;

import java.util.List;

@Component
public class hotel_mgt {

    @Autowired
    private HibernateTemplate hibernateTemplate;

    public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
        this.hibernateTemplate = hibernateTemplate;
    }

    //Get all creations (SELECT *)
    public List<state> getStates(){
        List<state> states = this.hibernateTemplate.loadAll(state.class);
        return states;
    }

    /*public state getState(int id){
        return this.hibernateTemplate.get(state.class, id);
    }*/

    public List<hotel> getHotels(){
        List<hotel> hotels = this.hibernateTemplate.loadAll(hotel.class);
        return hotels;
    }

    /*public state getHotel(int id){
        return this.hibernateTemplate.get(state.class, id);
    }*/

    public List<hotel_information> getRooms(){
        List<hotel_information> hotel_informations = this.hibernateTemplate.loadAll(hotel_information.class);
        return hotel_informations;
    }

    public void saveInfo(hotel_information hotel_information){
        hibernateTemplate.save(hotel_information);
    }

    public hotel_information getRoom(int id){
        hotel_information hotel_information = (hotel_information)hibernateTemplate.get(hotel_information.class, id);
        return hotel_information;
    }

}
