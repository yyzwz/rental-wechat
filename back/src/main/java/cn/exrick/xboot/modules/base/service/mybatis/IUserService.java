package cn.exrick.xboot.modules.base.service.mybatis;

import cn.exrick.xboot.modules.base.entity.Role;
import cn.exrick.xboot.modules.base.entity.User;
import cn.exrick.xboot.modules.base.entity.UserRole;
import com.baomidou.mybatisplus.extension.service.IService;
import org.apache.ibatis.annotations.Param;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.Cacheable;

import java.util.List;

/**
 * @author 齐鸣鸣
 */
public interface IUserService extends IService<User> {
    List<User> findByRolesId(String roleId);

    User findByIdZwz(String id);

    User findByZwzHua(String id);
}