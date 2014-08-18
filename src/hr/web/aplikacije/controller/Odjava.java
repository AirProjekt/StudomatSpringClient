package hr.web.aplikacije.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class Odjava {
	
	@RequestMapping(value="/odjava.html", method=RequestMethod.GET)
	public String odjavi(){
		return "odjava";
	}
	
}
