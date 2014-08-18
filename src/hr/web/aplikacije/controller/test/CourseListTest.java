package hr.web.aplikacije.controller.test;

import static org.fest.assertions.Assertions.assertThat;
import static org.junit.Assert.assertTrue;
import hr.web.aplikacije.controller.CourseList;
import hr.web.aplikacije.service.CourseService;
import hr.web.aplikacije.service.mock.CourseServiceMock;

import org.junit.Before;
import org.junit.Test;

public class CourseListTest {
	
	private CourseList courseList;
	
	@Before
	public void setupController(){
		courseList = new CourseList();
		CourseService courseService = new CourseServiceMock();
		courseList.setCourseService(courseService);
	}
	
	@Test
	public void testDohvatiKolegije(){
		assertTrue(courseList.dohvatiKolegije().equals("enrollment"));
		assertThat(courseList.getListaKolegija()).isNotEmpty();
	}
	
	@Test
	public void testOznaciKolegij(){
		assertThat(courseList.oznaciKolegij(courseList.getListaKolegija(), "2")).isEqualTo("enrollment");
	}
	
	@Test
	public void testObrisiKolegij(){
		assertThat(courseList.obrisiKolegij(courseList.getListaKolegija(), "2")).isEqualTo("enrollment");
	}
	
}
