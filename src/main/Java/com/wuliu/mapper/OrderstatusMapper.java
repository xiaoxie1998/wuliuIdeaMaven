package com.wuliu.mapper;

import com.wuliu.entity.Orderstatus;
import com.wuliu.entity.OrderstatusExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface OrderstatusMapper {
    int countByExample(OrderstatusExample example);

    int deleteByExample(OrderstatusExample example);

    int deleteByPrimaryKey(Integer orderid);

    int insert(Orderstatus record);

    int insertSelective(Orderstatus record);

    List<Orderstatus> selectByExample(OrderstatusExample example);

    Orderstatus selectByPrimaryKey(Integer orderid);

    int updateByExampleSelective(@Param("record") Orderstatus record, @Param("example") OrderstatusExample example);

    int updateByExample(@Param("record") Orderstatus record, @Param("example") OrderstatusExample example);

    int updateByPrimaryKeySelective(Orderstatus record);

    int updateByPrimaryKey(Orderstatus record);
}