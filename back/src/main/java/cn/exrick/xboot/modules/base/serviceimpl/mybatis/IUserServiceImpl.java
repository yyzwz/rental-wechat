package cn.exrick.xboot.modules.base.serviceimpl.mybatis;

import cn.exrick.xboot.modules.base.dao.UserDao;
import cn.exrick.xboot.modules.base.dao.mapper.UserMapper;
import cn.exrick.xboot.modules.base.dao.mapper.UserRoleMapper;
import cn.exrick.xboot.modules.base.entity.Role;
import cn.exrick.xboot.modules.base.entity.User;
import cn.exrick.xboot.modules.base.entity.UserRole;
import cn.exrick.xboot.modules.base.service.mybatis.IUserRoleService;
import cn.exrick.xboot.modules.base.service.mybatis.IUserService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 郑为中
 */
@Service
public class IUserServiceImpl extends ServiceImpl<UserMapper, User> implements IUserService {

    @Autowired
    private UserDao userDao;

    @Autowired
    private UserMapper userMapper;

    @Override
    public List<User> findByRolesId(String roleId) {
        return userDao.findByRolesId(roleId);
    }

    @Override
    public User findByIdZwz(String id) {
        return userDao.findByIdZwz(id);
    }

    @Override
    public User findByZwzHua(String id) {
        return userMapper.findByZwzHua(id);
    }
}
