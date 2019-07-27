package com.lims.core.mapper;

import com.lims.core.pojo.Apply;
import com.lims.core.pojo.ApplyExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ApplyMapper {
    int countByExample(ApplyExample example);

    int deleteByExample(ApplyExample example);

    int deleteByPrimaryKey(Integer applyId);

    int insert(Apply record);

    int insertSelective(Apply record);

    List<Apply> selectByExample(ApplyExample example);

    Apply selectByPrimaryKey(Integer applyId);

    int updateByExampleSelective(@Param("record") Apply record, @Param("example") ApplyExample example);

    int updateByExample(@Param("record") Apply record, @Param("example") ApplyExample example);

    int updateByPrimaryKeySelective(Apply record);

    int updateByPrimaryKey(Apply record);
}