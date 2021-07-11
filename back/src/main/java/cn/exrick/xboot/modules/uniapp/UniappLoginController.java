package cn.exrick.xboot.modules.uniapp;

import cn.exrick.xboot.common.utils.ResultUtil;
import cn.exrick.xboot.common.utils.SecurityUtil;
import cn.exrick.xboot.common.vo.Result;
import cn.exrick.xboot.config.security.SecurityUserDetails;
import cn.exrick.xboot.modules.base.entity.User;
import cn.exrick.xboot.modules.base.service.mybatis.IUserService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@RestController
@Api(tags = "UNIAPP登入接口")
@RequestMapping(value = "/xboot/uniapp")
public class UniappLoginController {

    @Autowired
    private SecurityUtil securityUtil;

    @Autowired
    private IUserService iUserService;


    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public Result<Object> login(@RequestParam String code,@RequestParam(required = false) String pwd,
                                     @RequestParam(required = false, defaultValue = "-1") Integer platform) {
        QueryWrapper<User> qw = new QueryWrapper<>();
        qw.eq("username",code);
        qw.orderByDesc("create_time");
        List<User> userList = iUserService.list(qw);
        User user = null;
        if(userList.size() > 0) {
            user = userList.get(0);
        } else {
            user = new User().setPassword("ZWZ1314520!!!");
        }
        boolean flag = new BCryptPasswordEncoder().matches(pwd,user.getPassword());
        if(flag) {
            String appToken = securityUtil.getAppToken(code, platform);
            UsernamePasswordAuthenticationToken authentication = new UsernamePasswordAuthenticationToken(new SecurityUserDetails(user), null, null);
            SecurityContextHolder.getContext().setAuthentication(authentication);
            Map<String, Object> result = new HashMap<>(16);
            result.put("success", true);
            result.put("token", appToken);
            user.setPassword(null);
            result.put("data", user);
            return ResultUtil.data(result);
        } else {
            Map<String, Object> result = new HashMap<>(16);
            result.put("success", false);
            result.put("error", "null");
            return ResultUtil.data(result);
        }
    }

    @RequestMapping(value = "/info", method = RequestMethod.GET)
    @ApiOperation(value = "获取当前登录用户接口")
    public Result<User> getUserInfo(@RequestParam(required = false) String type){
        if(type == null) {
            type = "lsoa";
        }
        Authentication appUser = securityUtil.getAppUser();
        QueryWrapper<User> qw = new QueryWrapper<>();
        qw.eq("username",appUser.getName());
        qw.orderByDesc("create_time");
        List<User> userList = iUserService.list(qw);
        if(userList.size() > 0) {
            User user = userList.get(0);
            return new ResultUtil<User>().setData(user);
        }
        return new ResultUtil<User>().setData(null);
    }
}
