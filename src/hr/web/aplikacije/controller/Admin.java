package hr.web.aplikacije.controller;

import java.util.ArrayList;



import javax.validation.Valid;

import hr.web.aplikacije.domain.Kolegij;
import hr.web.aplikacije.service.CourseService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

@SessionAttributes({"listaKolegija"})
@Controller
public class Admin {
	
	@Autowired
	private CourseService courseService;
	
	
	@RequestMapping(value = "/noviKolegij.html", method = RequestMethod.GET)
	public String adminGetForm(Model model) {
		model.addAttribute("kolegij", new Kolegij());
		return "admin";
	}
	
	@RequestMapping(value = "/noviKolegij.html", method = RequestMethod.POST)
	public String adminInsertCourse(@Valid @ModelAttribute Kolegij kolegij, BindingResult results, Model model
			,@ModelAttribute("listaKolegija") ArrayList<Kolegij> listaKolegija) {
		if (results.hasErrors())
		return "admin";
		courseService.insertKolegij(kolegij);
		listaKolegija.add(kolegij);
		model.addAttribute("kolegij", new Kolegij());
		model.addAttribute("uneseno", "Podaci su uspješno uneseni.");
		return "admin";
	}
	
	public void setCourseService(CourseService courseService){
		this.courseService = courseService;
	}

}
