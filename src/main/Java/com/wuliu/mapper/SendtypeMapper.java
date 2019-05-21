package com.wuliu.mapper;

import com.wuliu.entity.Sendtype;
import com.wuliu.entity.SendtypeExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SendtypeMapper {
    int countByExample(SendtypeExample example);

    int deleteByExample(SendtypeExample example);

    int deleteByPrimaryKey(Integer sendtypeid);

    int insert(Sendtype record);

    int insertSelective(Sendtype record);

    List<Sendtype> selectByExample(SendtypeExample example);

    Sendtype selectByPrimaryKey(Integer sendtypeid);

    int updateByExampleSelective(@Param("record") Sendtype record, @Param("example") SendtypeExample example);

    int updateByExample(@Param("record") Sendtype record, @Param("example") SendtypeExample example);

    int updateByPrimaryKeySelective(Sendtype record);

    int updateByPrimaryKey(Sendtype record);
}