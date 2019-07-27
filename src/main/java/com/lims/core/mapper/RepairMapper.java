package com.lims.core.mapper;

import com.lims.core.pojo.Repair;
import com.lims.core.pojo.RepairExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface RepairMapper {
    int countByExample(RepairExample example);

    int deleteByExample(RepairExample example);

    int deleteByPrimaryKey(Integer repairId);

    int insert(Repair record);

    int insertSelective(Repair record);

    List<Repair> selectByExample(RepairExample example);

    Repair selectByPrimaryKey(Integer repairId);

    int updateByExampleSelective(@Param("record") Repair record, @Param("example") RepairExample example);

    int updateByExample(@Param("record") Repair record, @Param("example") RepairExample example);

    int updateByPrimaryKeySelective(Repair record);

    int updateByPrimaryKey(Repair record);
}