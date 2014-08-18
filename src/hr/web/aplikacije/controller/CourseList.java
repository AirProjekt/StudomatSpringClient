package hr.web.aplikacije.controller;

import hr.web.aplikacije.domain.Kolegij;
import hr.web.aplikacije.domain.Korisnik;
import hr.web.aplikacije.service.CourseService;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

@SessionAttributes({"listaKolegija","korisnik"})
@Controller
public class CourseList {
	
	@ModelAttribute("listaKolegija")
	public List<Kolegij> getListaKolegija() {
		return courseService.fetchAllKolegijList();
	}
	
	@ModelAttribute("korisnik")
	public Korisnik getKorisnikId(Principal principal) {
		String userName = principal.getName();
		Korisnik korisnik = new Korisnik(courseService.retriveKorisnikId(userName), userName);
		return korisnik;
	}
	
	@Autowired
	private CourseService courseService;
	
	@RequestMapping(value="/kolegij.html",method=RequestMethod.GET)
	public String dohvatiKolegije(){
		return "enrollment";
	}
	
	@RequestMapping(value="/kolegij.html",method=RequestMethod.POST)
	public String oznaciKolegij(@ModelAttribute("listaKolegija") List<Kolegij> listaKolegija,
			@RequestParam("idOdabrKolegija") String idOdabranogKolegija){
		int id = Integer.parseInt(idOdabranogKolegija);
		for (Kolegij kolegij : listaKolegija) {
			if (kolegij.getId() == id) {
				kolegij.setOdabran(true);
			}
		}
		return "enrollment";
	}
	
	@RequestMapping(value="/delete.html",method=RequestMethod.POST)
	public String obrisiKolegij(@ModelAttribute("listaKolegija") List<Kolegij> listaKolegija,
			@RequestParam("idOdabrKolegija") String idOdabranogKolegija){
		int id = Integer.parseInt(idOdabranogKolegija);
		Kolegij kol = null;
		for (Kolegij kolegij : listaKolegija) {
			if (kolegij.getId() == id) {
				courseService.deleteKolegij(kolegij);
				kol = kolegij;
				break;
			}
		}
		if(kol != null) listaKolegija.remove(kol);
		return "enrollment";
	}
	
	@RequestMapping(value="/delete.html", method=RequestMethod.GET)
	public String obrisiKolegij(){
		return "enrollment";
	}
	
	public void setCourseService(CourseService courseService){
		this.courseService = courseService;
	}
	

}
