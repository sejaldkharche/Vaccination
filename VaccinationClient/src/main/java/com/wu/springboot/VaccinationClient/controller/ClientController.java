package com.wu.springboot.VaccinationClient.controller;

import java.util.ArrayList;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import com.wu.springboot.VaccinationClient.dto.UserDTO;
import com.wu.springboot.VaccinationClient.dto.VaccineDoseDTO;
import com.wu.springboot.VaccinationClient.services.ClientService;

@Controller
@RequestMapping("/citizen")
public class ClientController {

    @Autowired
    private ClientService clientService;

    @GetMapping("/citizenDetails")
    public String getCitizenDetails(Model model) {
        String url = "http://localhost:8989/vaccine/userDetails/10"; // Assuming userId 10
        RestTemplate restTemplate = new RestTemplate();
        
        // Fetch a single UserDTO object
        UserDTO user = restTemplate.getForObject(url, UserDTO.class);
        System.out.println(user);

//        
//        // Add the user data to the model to be rendered in JSP
        model.addAttribute("user", user);
        
        return "list-citizen";  // Your JSP view name
    }
    
    @GetMapping("/getAll")
    public String getAll(Model model)
    {
    	String url =  "http://localhost:8989/vaccine/userDetails";
    	RestTemplate restTemplate = new RestTemplate();
    	
    	ArrayList<UserDTO> dtos =  restTemplate.getForObject(url, ArrayList.class);
    	
    	System.out.println(dtos);
    	
    	model.addAttribute("all", dtos);
    	
    	return "get-all";
    	
    }
    
    @GetMapping("/details/{id}")
    public String getUserDetails(@PathVariable int id, Model model)
    {
    	String url = "http://localhost:8989/vaccine/userDetails/" + id; // Use the actual id value // Assuming userId 10
         RestTemplate restTemplate = new RestTemplate();
         
         // Fetch a single UserDTO object
         UserDTO user = restTemplate.getForObject(url, UserDTO.class);
         System.out.println(user);

//         
//         // Add the user data to the model to be rendered in JSP
         model.addAttribute("user", user);
         
         return "list-citizen";  // Your JSP view name
    }
    
    @GetMapping("/addCitizen")
    public String addCitizenForm(Model model)
    {
    	UserDTO dto = new UserDTO();
    	
    	model.addAttribute("citizen", dto);
    	
    	return "addCitizen";
    }
    
    @PostMapping("/saveCitizen")
    public String saveCustomer(@ModelAttribute UserDTO dto)
    {
    	System.out.println(dto + "dard");
    	
    	RestTemplate restTemplate = new RestTemplate();
    	
    	String url =  "http://localhost:8989/vaccine/register";
    	
    	 HttpHeaders headers = new HttpHeaders();
    	    headers.setContentType(MediaType.APPLICATION_JSON);
    	    HttpEntity<UserDTO> entity = new HttpEntity<>(dto,headers);
    	
    	UserDTO response = restTemplate.postForObject(url, entity, UserDTO.class);
    	
    	System.out.println(response);
    	
    	return "redirect:/citizen/getAll";
    }
    
    @GetMapping("/addDose/{id}")
    public String getAddDoseForm(@PathVariable Long id , Model model)
    {
    	VaccineDoseDTO doseDTO = new VaccineDoseDTO();
    	doseDTO.setUserId(id);
    	
    	String url = "http://localhost:8989/vaccine/userDetails/" + id;
    	  RestTemplate restTemplate = new RestTemplate();
        
        // Fetch a single UserDTO object
        UserDTO user = restTemplate.getForObject(url, UserDTO.class);
        
        Optional<Integer> maxiDose = user.getVaccineDoses().size() > 0 ?  user.getVaccineDoses().stream().map(VaccineDoseDTO::getDoseNumber).max(Integer::compare) : Optional.of(0);
        
        doseDTO.setDoseNumber(maxiDose.get() + 1);
    	
    	model.addAttribute("vaccineDto", doseDTO);
    	
    	return "add-dose-form";
    }
    
    @PostMapping("/addDoseforUser")
    public String addDose(@ModelAttribute VaccineDoseDTO dto)
    {
    	
RestTemplate restTemplate = new RestTemplate();
    	
    	String url =  "http://localhost:8989/vaccine/addDose";
    	
    	 HttpHeaders headers = new HttpHeaders();
    	    headers.setContentType(MediaType.APPLICATION_JSON);
    	    HttpEntity<VaccineDoseDTO> entity = new HttpEntity<>(dto,headers);
    	
    VaccineDoseDTO response = restTemplate.postForObject(url, entity, VaccineDoseDTO.class);
    	
//    	System.out.println(response);
    	
    	return "redirect:/citizen/getAll";
    }
    
    @GetMapping("/delete/{id}")
    public String deleteCitizen(@PathVariable Long id, Model model) {
        String url = "http://localhost:8989/vaccine/deleteUser/" + id;
        RestTemplate restTemplate = new RestTemplate();
        
        try {
            restTemplate.delete(url);
            model.addAttribute("message", "Citizen deleted successfully");
        } catch (RestClientException e) {
            model.addAttribute("message", "Failed to delete citizen: " + e.getMessage());
        }

        // Redirect to the list page after deletion
        return "redirect:/citizen/getAll";
    }
    
}
