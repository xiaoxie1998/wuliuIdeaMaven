package com.wuliu.mapper;

import com.wuliu.entity.Accmodule;
import com.wuliu.entity.AccmoduleExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface AccmoduleMapper {
    int countByExample(AccmoduleExample example);

    int deleteByExample(AccmoduleExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Accmodule record);

    int insertSelective(Accmodule record);

    int insertBatch(@Param("modules") String[] modules,@Param("userID") Integer userID);

    List<Accmodule> selectByExample(AccmoduleExample example);

    Accmodule selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Accmodule record, @Param("example") AccmoduleExample example);

    int updateByExample(@Param("record") Accmodule record, @Param("example") AccmoduleExample example);

    int updateByPrimaryKeySelective(Accmodule record);

    int updateByPrimaryKey(Accmodule record);
}