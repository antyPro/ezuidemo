package com.etong.aidic.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.etong.aidic.dao.PlayerMapper;
import com.etong.aidic.domain.Player;
import com.etong.aidic.service.PlayerService;

@Service("playerService")
public class PlayerServiceImpl implements PlayerService {

	@Autowired
	private PlayerMapper playerMapper;
	
	
	@Override
	public void addPlayer(Player p) {
		// TODO Auto-generated method stub
		playerMapper.insert(p);
	}

	@Override
	public void delPlayer(String id) {
		// TODO Auto-generated method stub
		playerMapper.deleteByPrimaryKey(id);
	}

	@Override
	public List<Player> select() {
		// TODO Auto-generated method stub
		return  playerMapper.select();
	}

	@Override
	public void edit(Player p) {
		// TODO Auto-generated method stub
		playerMapper.updateByPrimaryKey(p);
	}
	
	

}
