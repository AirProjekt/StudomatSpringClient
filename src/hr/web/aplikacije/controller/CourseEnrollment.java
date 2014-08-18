package hr.web.aplikacije.controller;

import java.util.ArrayList;

import hr.web.aplikacije.domain.Kolegij;
import hr.web.aplikacije.domain.Korisnik;
import hr.web.aplikacije.service.CourseService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

@SessionAttributes({"listaKolegija","korisnik"})
@Controller
public class CourseEnrollment {
	
	@Autowired
	private CourseService courseService;
	
	@RequestMapping(value="/upis.html",method=RequestMethod.POST)
	public String prikaziUpisane(@ModelAttribute("listaKolegija") ArrayList<Kolegij> listaKolegija,
			@ModelAttribute("korisnik") Korisnik korisnik, Model model){
		for (Kolegij kolegij : listaKolegija) {
			if (kolegij.isOdabran()) {
				courseService.insertKolegijResults(korisnik.getId(), kolegij.getId());
			}
		}
		
		
		model.addAttribute("listaKolegijaUpisani", courseService.fetchAllKolegijListUpisani(korisnik.getId()));
		return "enroll";
	}
	
	@RequestMapping(value="/upis.html",method=RequestMethod.GET)
	public String prikaziUpisane(Model model, @ModelAttribute("korisnik") Korisnik korisnik){
		model.addAttribute("listaKolegijaUpisani", courseService.fetchAllKolegijListUpisani(korisnik.getId()));
		return "enroll";
	}
	
	public void setCourseService(CourseService courseService){
		this.courseService = courseService;
	}

}
