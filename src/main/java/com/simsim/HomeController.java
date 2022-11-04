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
			
			String apiUrl = "https://thegoodnight.daegu.go.kr/ajax/api/total_accomm.html?mode=json&item_count=20";
			
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
			
//			Map<String, Object> header = new HashMap<String, Object>();
//			header = (Map<String, Object>) map.get("header");
			
//			System.out.println("######## Header");
//			for (String key : header.keySet()) {
//				String value = String.valueOf(header.get(key));	// ok
//				System.out.println("[key]:" + key + ", [value]:" + value);
//			}
			
//			String aaa = (String) header.get("resultCode");
			
//			System.out.println("header.get(\"resultCode\"): " + header.get("resultCode"));
//			System.out.println("header.get(\"resultMsg\"): " + header.get("resultMsg"));
			
//			Map<String, Object> body = new HashMap<String, Object>();
//			body = (Map<String, Object>) map.get("body");
			
			List<Home> data = new ArrayList<Home>();
			data = (List<Home>) map.get("data");
			
			
			System.out.println("data.size(): " + data.size());
			
//			for(Home item : items) {
//				System.out.println(item.getMM());
//			}
			
//			model.addAllAttributes(header);
			model.addAttribute("data",data);
			
			return "accomodationList";
		}
		
		@RequestMapping(value = "/test/dnfMyCharactor")
		public String dnfMyCharactor(Model model) throws Exception {
			
			System.out.println("asdfasdfasdf");
			
			String apiUrl = "https://api.neople.co.kr/df/servers/bakal/characters/00091d665bc6ddb5249b86b7daa32a39/status?apikey=HabDVPFcuXegFznsnEb77LSAiLm4cvr4";
			
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
			System.out.println("aaaa");
			Map<String, Object> buff = new HashMap<String, Object>();
			buff = (Map<String, Object>) map.get("buff");
			
			System.out.println("######## buff");
			for (String key : buff.keySet()) {
				String value = String.valueOf(buff.get(key));	// ok
				System.out.println("[key]:" + key + ", [value]:" + value);
			}
			
//			String aaa = (String) header.get("resultCode");
			
//			System.out.println("header.get(\"resultCode\"): " + header.get("resultCode"));
//			System.out.println("header.get(\"resultMsg\"): " + header.get("resultMsg"));
			
	//		Map<String, Object> status = new HashMap<String, Object>();
	//		status = (Map<String, Object>) map.get("status");
			
			List<Home> status = new ArrayList<Home>();
			status = (List<Home>) buff.get("status");
			
			
			System.out.println("status.size(): " + status.size());
			
			Map<String, Object> status2 = new HashMap<String, Object>();
			status2 = (Map<String, Object>) buff.get("status");
			
			System.out.println("######## status2");
			for (String key : status2.keySet()) {
				String value = String.valueOf(status2.get(key));	// ok
				System.out.println("[key]:" + key + ", [value]:" + value);
			}
			
			List<Home> status3 = new ArrayList<Home>();
			status3 = (List<Home>) status2.get("status");
			
//			for(Home item : items) {
//				System.out.println(item.getMM());
//			}
			
//			model.addAllAttributes(header);
			model.addAttribute("status",status);
			model.addAttribute("status2",status2);
			model.addAttribute("status3", status3);
			
			return "dnfMyCharactor";
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
