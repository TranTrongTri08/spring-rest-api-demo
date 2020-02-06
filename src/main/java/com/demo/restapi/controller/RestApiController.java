package com.demo.restapi.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController("/helloWorld")
public class RestApiController {

	@GetMapping
	public String helloWorld() {
		return "Hello world";
	}
}
