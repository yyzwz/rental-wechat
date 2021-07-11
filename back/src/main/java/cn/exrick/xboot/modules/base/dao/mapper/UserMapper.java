package cn.exrick.xboot.modules.base.dao.mapper;

import cn.exrick.xboot.modules.base.entity.Role;
import cn.exrick.xboot.modules.base.entity.User;
import cn.exrick.xboot.modules.base.entity.UserRole;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author 齐鸣鸣
 */
@Repository
public interface UserMapper extends BaseMapper<User> {

    List<User> findByDepartmentIdZWZ(@Param("departmentId") String departmentId);

    List<User> findByZwz(@Param("name") String name);

    List<User> findAllByZwz();

    List<User> findByNickname(@Param("nickname") String nickname);

    User findByZwzHua(@Param("id") String id);
}
