package sharma.srishti.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.view.RedirectView;
import sharma.srishti.dao.hotel_mgt;
import sharma.srishti.model.hotel;
import sharma.srishti.model.state;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class WelcomeController {

    @Autowired
    private hotel_mgt hotelMgt;

    @RequestMapping("/")
    public String welcome(Model m){
        List<state> states = hotelMgt.getStates();
        m.addAttribute("states", states);
        List<hotel> hotels = hotelMgt.getHotels();
        m.addAttribute("hotels", hotels);
        return "welcome";
    }

    @RequestMapping("/fetchRecords")
    public String AddRecords(){
        return "room-info";
    }

    @RequestMapping("/check")
    public String Check(){
        return "checkFile";
    }

    @RequestMapping("/reservation")
    public  String reserve(){
        return "reservationForm";
    }

    @RequestMapping("/confirm")
    public String confirm(){
        return "confirmReservation";
    }
}
