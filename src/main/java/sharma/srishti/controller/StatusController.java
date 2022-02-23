package sharma.srishti.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import sharma.srishti.dao.hotel_mgt;
import sharma.srishti.service.checkStatus;

@Controller
@RequestMapping("/checkAvailability")
public class StatusController {
    @RequestMapping(method = RequestMethod.POST)
    public String checkAvailability(@RequestParam String hotel, @RequestParam String state){

        System.out.println(state);
        System.out.println(hotel);

        checkStatus checkStatus = new checkStatus();
        String choice = checkStatus.checkStatus(hotel);

        String jsp="";

        //Create a switch case for referring to the variables
        switch (choice){
            case "A":
                jsp = "room-info";
                System.out.println("room-info.jsp");
                break;

            case "B":
                jsp ="error";
                System.out.println("error.jsp");
                break;

            default:
                jsp = "invalid";
                System.out.println("invalid request");
                break;
        }
        return jsp;
    }
}
