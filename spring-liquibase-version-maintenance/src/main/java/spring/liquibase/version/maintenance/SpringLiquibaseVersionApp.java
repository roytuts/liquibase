package spring.liquibase.version.maintenance;

import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class SpringLiquibaseVersionApp implements CommandLineRunner {

	public static void main(String[] args) {
		SpringApplication.run(SpringLiquibaseVersionApp.class, args);
	}

	@Override
	public void run(String... args) throws Exception {
		System.out.println("table successfully altered");
	}

}
