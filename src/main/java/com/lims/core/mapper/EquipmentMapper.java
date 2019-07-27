package com.lims.core.mapper;

import com.lims.core.pojo.Equipment;
import com.lims.core.pojo.EquipmentExample;
import com.lims.core.pojo.EquipmentType;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface EquipmentMapper {
    int countByExample(EquipmentExample example);

    int deleteByExample(EquipmentExample example);

    int deleteByPrimaryKey(Integer eId);

    int insert(Equipment record);

    int insertSelective(Equipment record);

    List<Equipment> selectByExample(EquipmentExample example);
    
    List<EquipmentType> selectByType();

    Equipment selectByPrimaryKey(Integer eId);

    int updateByExampleSelective(@Param("record") Equipment record, @Param("example") EquipmentExample example);

    int updateByExample(@Param("record") Equipment record, @Param("example") EquipmentExample example);

    int updateByPrimaryKeySelective(Equipment record);

    int updateByPrimaryKey(Equipment record);
}