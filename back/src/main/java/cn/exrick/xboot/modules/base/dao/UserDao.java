package cn.exrick.xboot.modules.base.dao;

import cn.exrick.xboot.base.XbootBaseDao;
import cn.exrick.xboot.modules.base.entity.Role;
import cn.exrick.xboot.modules.base.entity.User;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

/**
 * 用户数据处理层
 * @author Exrickx
 */
public interface UserDao extends XbootBaseDao<User, String> {

    @Query("select u from User u where u.username =?1")
    List<User> findByJobnumber(String jobnumber);

    @Query("select u from User u where u.id =?1")
    User findByIdByZwz(String id);
    /**
     * 通过用户名获取用户
     * @param username
     * @return
     */
    User findByUsername(String username);

    /**
     * 通过手机获取用户
     * @param mobile
     * @return
     */
    User findByMobile(String mobile);

    /**
     * 通过邮件获取用户
     * @param email
     * @return
     */
    User findByEmail(String email);

    /**
     * 通过部门id获取
     * @param departmentId
     * @return
     */
    List<User> findByDepartmentId(String departmentId);

    /**
     * 通过用户名模糊搜索
     * @param key
     * @param status
     * @return
     */
    @Query("select u from User u where u.username like %?1% or u.nickname like %?1% and u.status = ?2")
    List<User> findByUsernameLikeAndStatus(String key, Integer status);

    /**
     * 更新部门名称
     * @param departmentId
     * @param departmentTitle
     */
    @Modifying
    @Query("update User u set u.departmentTitle=?2 where u.departmentId=?1")
    void updateDepartmentTitle(String departmentId, String departmentTitle);

    @Query(value = "select * from t_user u where u.del_flag = 1",nativeQuery = true)
    List<User> getAllByZwz();

    @Query(value = "SELECT * FROM t_user u , t_user_role r WHERE u.id = r.user_id AND r.role_id = ?1",nativeQuery = true)
    List<User> getUserByRoles(String roleId);

    @Query(value = "select r from Role r where r.id in (select ur.roleId from UserRole ur where ur.userId = ?1)")
    List<Role> getRoleByUserId(String userId);

    @Query(value = "select u from User u where u.id in(select ur.userId from UserRole ur where ur.roleId = ?1)")
    List<User> findByRolesId(String roleId);

    @Query(value = "select u from User u where u.id = ?1")
    User findByIdZwz(String id);
}
