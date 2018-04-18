package com.etong.aidic.service;

import java.util.List;

import com.etong.aidic.domain.Player;

public interface PlayerService {

	
	public void addPlayer(Player p);
	
	public void delPlayer(String id);
	
	public List<Player> select();
	
	public void edit(Player p);
}
