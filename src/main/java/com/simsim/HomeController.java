package com.simsim;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping
public class HomeController {

		private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
		
		/**
		 * Simply selects the home view to render by returning its name.
		 */
		@RequestMapping(value = "/eeee", method = RequestMethod.GET)
		public String home(Locale locale, Model model) {
			logger.info("Welcome home! The client locale is {}.", locale);
			
			Date date = new Date();
			DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
			
			String formattedDate = dateFormat.format(date);
			
			model.addAttribute("serverTime", formattedDate );
			
			return "home";
		}
		
		@RequestMapping(value = "/test/accomodationList")
		public String accomodationList(Model model) throws Exception {
			
			System.out.println("asdfasdfasdf");
			
			String apiUrl = "https://thegoodnight.daegu.go.kr/ajax/api/total_accomm.html?mode=json";
			
			URL url = new URL(apiUrl);
			HttpURLConnection httpURLConnection = (HttpURLConnection) url.openConnection();
			httpURLConnection.setRequestMethod("GET");
			
			BufferedReader bufferedReader;
			if (httpURLConnection.getResponseCode() >= 200 && httpURLConnection.getResponseCode() <= 300) {
				bufferedReader = new BufferedReader(new InputStreamReader(httpURLConnection.getInputStream()));
			} else {
				bufferedReader = new BufferedReader(new InputStreamReader(httpURLConnection.getErrorStream()));
			}
			
			StringBuilder stringBuilder = new StringBuilder();
			String line;
			while ((line = bufferedReader.readLine()) != null) {
				System.out.println("line: " + line);
				stringBuilder.append(line);
			}

			bufferedReader.close();
			httpURLConnection.disconnect();

			System.out.println("stringBuilder.toString(): " + stringBuilder.toString());
			
//			json object + array string -> java map
			
	        ObjectMapper objectMapper = new ObjectMapper();
	        Map<String, Object> map = objectMapper.readValue(stringBuilder.toString(), Map.class);
	        
	        System.out.println("######## Map");
			for (String key : map.keySet()) {
				String value = String.valueOf(map.get(key));	// ok
				System.out.println("[key]:" + key + ", [value]:" + value);
			}
			
			List<Home> data = new ArrayList<Home>();
			data = (List<Home>) map.get(data);
			
//			String aaa = (String) header.get("resultCode");
			
//			System.out.println("header.get(\"resultCode\"): " + header.get("resultCode"));
//			System.out.println("header.get(\"resultMsg\"): " + header.get("resultMsg"));
			
	//		Map<String, Object> body = new HashMap<String, Object>();
	//		body = (Map<String, Object>) map.get("body");
			
	//		List<Home> items = new ArrayList<Home>();
	//		items = (List<Home>) body.get("items");
	//		
	//		
	//		System.out.println("items.size(): " + items.size());
			
//			for(Home item : items) {
//				System.out.println(item.getMM());
//			}
			
	//		model.addAllAttributes(header);
	//		model.addAllAttributes(body);
			model.addAllAttributes(data);
			
			return "accomodationList";
		}
		
		@RequestMapping(value = "/a", method = RequestMethod.GET)
		public String a(Locale locale, Model model) {
			return "a";
		}
		
		@RequestMapping(value = "/b", method = RequestMethod.GET)
		public String b(Locale locale, Model model) {
			return "b";
		}
		
		@RequestMapping(value = "/c", method = RequestMethod.GET)
		public String c(Locale locale, Model model) {
			return "c";
		}
		
		@RequestMapping(value = "/d", method = RequestMethod.GET)
		public String d(Locale locale, Model model) {
			return "d";
		}
		
		@RequestMapping(value = "/e", method = RequestMethod.GET)
		public String e(Locale locale, Model model) {
			return "e";
		}
		
		@RequestMapping(value = "/SimsimAdminCodegroup", method = RequestMethod.GET)
		public String SimsimAdminCodegroup(Locale locale, Model model) {
			return "SimsimAdminCodegroup";
		}
		
		@RequestMapping(value = "/SimsimAdminCode", method = RequestMethod.GET)
		public String SimsimAdminCode(Locale locale, Model model) {
			return "SimsimAdminCode";
		}
		
		@RequestMapping(value = "/SimsimMain", method = RequestMethod.GET)
		public String SimsimMain(Locale locale, Model model) {
			return "SimsimMain";
		}
}
