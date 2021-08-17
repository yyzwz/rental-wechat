package cn.exrick.xboot.modules.autochat.dao.mapper;

import cn.exrick.xboot.modules.autochat.entity.AutoChat;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AutoChatMapper extends BaseMapper<AutoChat> {

    /**
     * 查询
     * @param question
     * @param pageSize
     * @return
     */
    List<AutoChat> find(@Param("question") String question, @Param("pageSize") int pageSize);
}