package com.wuliu.mapper;

import com.wuliu.entity.Cardetail;
import com.wuliu.entity.CardetailExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CardetailMapper {
    int countByExample(CardetailExample example);

    int deleteByExample(CardetailExample example);

    int deleteByPrimaryKey(String detailid);

    int insert(Cardetail record);

    int insertSelective(Cardetail record);

    List<Cardetail> selectByExample(CardetailExample example);

    Cardetail selectByPrimaryKey(String detailid);

    int updateByExampleSelective(@Param("record") Cardetail record, @Param("example") CardetailExample example);

    int updateByExample(@Param("record") Cardetail record, @Param("example") CardetailExample example);

    int updateByPrimaryKeySelective(Cardetail record);

    int updateByPrimaryKey(Cardetail record);
}