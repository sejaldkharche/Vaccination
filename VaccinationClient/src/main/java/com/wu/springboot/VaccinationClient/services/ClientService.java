package com.wu.springboot.VaccinationClient.services;

import java.util.Arrays;
import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.wu.springboot.VaccinationClient.dto.UserDTO;

@Service
public class ClientService {
	
	 private static final String API_URL = "http://localhost:9090/vaccine/userDetails";
	 
	 
	
	public List<UserDTO> getDetails()
	{
		RestTemplate restTemplate = new RestTemplate();
	
		UserDTO[] response = restTemplate.getForObject(API_URL, UserDTO[].class);
        return Arrays.asList(response);
	}

}
