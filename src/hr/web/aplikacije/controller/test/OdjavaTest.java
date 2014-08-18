package hr.web.aplikacije.controller.test;

import org.junit.Before;
import org.junit.Test;

import hr.web.aplikacije.controller.Odjava;
import static org.fest.assertions.Assertions.assertThat;

public class OdjavaTest {
	
	private Odjava odjava;
	
	@Before
	public void setupController(){
		odjava = new Odjava();
	}
	
	@Test
	public void testOdjavi(){
		assertThat(odjava.odjavi()).isEqualTo("odjava");
	}
	
}
