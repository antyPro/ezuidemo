package com.etong.aidic.controller;

import java.util.List;

import javax.json.JsonObject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.etong.aidic.domain.Player;
import com.etong.aidic.service.PlayerService;

@Controller
public class TestController {

	@Autowired
	private PlayerService playerService;
	
	@RequestMapping("/index")
	public String test() {
		
		
		return "index";
	}
	
	@RequestMapping("/add")
	@ResponseBody
	public JSONObject addPlayer(HttpServletRequest req) {
		
		String id = req.getParameter("id");
		String name = req.getParameter("name");
		String height = req.getParameter("height");
		String team = req.getParameter("team");
		Player p = new Player();
		p.setId(id);
		p.setHeight(Integer.valueOf(height));
		p.setName(name);
		p.setTeam(team);
		playerService.addPlayer(p);
		JSONObject obj = new JSONObject();
		obj.put("success", true);
		return obj;
		
	}
	
	
	@RequestMapping("/edit")
	@ResponseBody
	public JSONObject editPlayer(HttpServletRequest req) {
		
		String id = req.getParameter("id1");
		String name = req.getParameter("name");
		String height = req.getParameter("height");
		String team = req.getParameter("team");
		Player p = new Player();
		p.setId(id);
		p.setHeight(Integer.valueOf(height));
		p.setName(name);
		p.setTeam(team);
		playerService.edit(p);
		JSONObject obj = new JSONObject();
		obj.put("success", true);
		return obj;
		
	}
	
	
	@RequestMapping("/delete")
	@ResponseBody
	public JSONObject delPlayer(HttpServletRequest req) {
		
		String id = req.getParameter("id");
		playerService.delPlayer(id);
		JSONObject obj = new JSONObject();
		obj.put("success", true);
		return obj;
		
	}
	
	
	
	@RequestMapping("/get")
	@ResponseBody
	public List<Player> getPlayer() {
		List<Player> players = playerService.select();
		 //String json =JSON.toJSONString(players);
		
		return players;
	}
}
