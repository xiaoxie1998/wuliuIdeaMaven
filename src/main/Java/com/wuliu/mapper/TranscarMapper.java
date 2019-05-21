package com.wuliu.mapper;

import com.wuliu.entity.Transcar;
import com.wuliu.entity.TranscarExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TranscarMapper {
    int countByExample(TranscarExample example);

    int deleteByExample(TranscarExample example);

    int deleteByPrimaryKey(Integer transid);

    int insert(Transcar record);

    int insertSelective(Transcar record);

    List<Transcar> selectByExample(TranscarExample example);

    Transcar selectByPrimaryKey(Integer transid);

    int updateByExampleSelective(@Param("record") Transcar record, @Param("example") TranscarExample example);

    int updateByExample(@Param("record") Transcar record, @Param("example") TranscarExample example);

    int updateByPrimaryKeySelective(Transcar record);

    int updateByPrimaryKey(Transcar record);
}