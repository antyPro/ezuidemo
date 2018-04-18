package com.etong.aidic.dao;

import java.util.List;

import com.etong.aidic.domain.Player;

public interface PlayerMapper {
    int deleteByPrimaryKey(String id);

    int insert(Player record);

    int insertSelective(Player record);

    Player selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Player record);

    int updateByPrimaryKey(Player record);
    
    List<Player> select();
}