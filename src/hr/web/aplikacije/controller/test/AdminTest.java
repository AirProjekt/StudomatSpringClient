package hr.web.aplikacije.controller.test;

import java.util.ArrayList;

import org.junit.Before;
import org.junit.Test;
import org.springframework.ui.ExtendedModelMap;
import org.springframework.ui.Model;
import org.springframework.validation.BeanPropertyBindingResult;
import org.springframework.validation.BindingResult;

import hr.web.aplikacije.controller.Admin;
import hr.web.aplikacije.domain.Kolegij;
import hr.web.aplikacije.domain.VrstaKolegija;
import hr.web.aplikacije.service.CourseService;
import hr.web.aplikacije.service.mock.CourseServiceMock;
import static org.junit.Assert.assertTrue;

public class AdminTest {
	
	private Admin admin;
	
	@Before
	public void setupController(){
		admin = new Admin();
		CourseService courseService = new CourseServiceMock();
		admin.setCourseService(courseService);
	}
	
	@Test
	public void testAdminGetForm(){
		Model model = new ExtendedModelMap();
		Kolegij kolegij = new Kolegij();
		model.asMap().put("Kolegij", kolegij);
		assertTrue(admin.adminGetForm(model).equals("admin"));
	}
	
	@Test
	public void testAdminInsertCourse(){
		Kolegij noviKolegij = new Kolegij();
		noviKolegij.setNazivKolegija("Tehnièka kultura");
		noviKolegij.setEcts(5);
		noviKolegij.setVrstaKolegija(VrstaKolegija.IZBORNI);
		BindingResult bindingResult = new BeanPropertyBindingResult(noviKolegij, "kolegij");
		Model model = new ExtendedModelMap();
		model.asMap().put("Kolegij", noviKolegij);
		assertTrue(admin.adminInsertCourse(noviKolegij, bindingResult,
				model, new ArrayList<Kolegij>()).equals("admin"));
	}
	
}
