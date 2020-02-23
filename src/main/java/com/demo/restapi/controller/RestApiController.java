package com.demo.restapi.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController("/helloWorld")
public class RestApiController {
	
	@Value("${app.env}")
    private String env;

	@GetMapping
	public String helloWorld() {
		return "Hello world. " + env;
	}
}
