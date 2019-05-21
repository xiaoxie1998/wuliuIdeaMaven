package com.wuliu.mapper;

import com.wuliu.entity.Carroad;
import com.wuliu.entity.CarroadExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CarroadMapper {
    int countByExample(CarroadExample example);

    int deleteByExample(CarroadExample example);

    int deleteByPrimaryKey(Integer roadid);

    int insert(Carroad record);

    int insertSelective(Carroad record);

    List<Carroad> selectByExample(CarroadExample example);

    Carroad selectByPrimaryKey(Integer roadid);

    int updateByExampleSelective(@Param("record") Carroad record, @Param("example") CarroadExample example);

    int updateByExample(@Param("record") Carroad record, @Param("example") CarroadExample example);

    int updateByPrimaryKeySelective(Carroad record);

    int updateByPrimaryKey(Carroad record);
}