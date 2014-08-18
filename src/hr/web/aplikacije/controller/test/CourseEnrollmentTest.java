package hr.web.aplikacije.controller.test;

import java.util.ArrayList;

import org.junit.Before;
import org.junit.Test;
import org.springframework.ui.ExtendedModelMap;
import org.springframework.ui.Model;

import hr.web.aplikacije.controller.CourseEnrollment;
import hr.web.aplikacije.domain.Kolegij;
import hr.web.aplikacije.domain.Korisnik;
import hr.web.aplikacije.service.CourseService;
import hr.web.aplikacije.service.mock.CourseServiceMock;
import static org.fest.assertions.Assertions.assertThat;

public class CourseEnrollmentTest {
	
	private CourseEnrollment courseEnrollment;
	
	private CourseService courseSerivce;
	
	@Before
	public void setupController(){
		courseEnrollment = new CourseEnrollment();
		this.courseSerivce = new CourseServiceMock();
		courseEnrollment.setCourseService(this.courseSerivce);
	}
	
	@Test
	public void testPrikaziUpisanePost(){
		Model model = new ExtendedModelMap();
		Korisnik korisnik = new Korisnik();
		assertThat(courseEnrollment.prikaziUpisane((ArrayList<Kolegij>)this.courseSerivce.fetchAllKolegijList(), 
				korisnik, model)).isEqualTo("enroll");
		assertThat(model.asMap().get("listaKolegijaUpisani")).isNotNull();
	}
	
	@Test
	public void testPrikaziUpisaneGet(){
		Model model = new ExtendedModelMap();
		Korisnik korisnik = new Korisnik();
		assertThat(courseEnrollment.prikaziUpisane(model, korisnik)).isEqualTo("enroll");
		assertThat(model.asMap().get("listaKolegijaUpisani")).isNotNull();
	}
	
}
