package cn.exrick.xboot.modules.your.controller;

import cn.exrick.xboot.common.utils.PageUtil;
import cn.exrick.xboot.common.utils.ResultUtil;
import cn.exrick.xboot.common.utils.SecurityUtil;
import cn.exrick.xboot.common.vo.PageVo;
import cn.exrick.xboot.common.vo.Result;
import cn.exrick.xboot.modules.base.entity.Department;
import cn.exrick.xboot.modules.base.entity.DepartmentHeader;
import cn.exrick.xboot.modules.base.entity.User;
import cn.exrick.xboot.modules.base.service.DepartmentHeaderService;
import cn.exrick.xboot.modules.base.service.DepartmentService;
import cn.exrick.xboot.modules.base.service.mybatis.IUserService;
import cn.exrick.xboot.modules.your.entity.Audit;
import cn.exrick.xboot.modules.your.service.IAuditService;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * @author 郑为中
 */
@Slf4j
@RestController
@Api(tags = "审批单管理接口")
@RequestMapping("/xboot/audit")
@Transactional
public class AuditController {

    @Autowired
    private IAuditService iAuditService;

    @Autowired
    private DepartmentService departmentService;

    @Autowired
    private IUserService iUserService;

    @Autowired
    private DepartmentHeaderService departmentHeaderService;

    @RequestMapping(value = "/getOne", method = RequestMethod.GET)
    @ApiOperation(value = "通过id获取")
    public Result<Audit> get(@RequestParam String id) {
        Audit audit = iAuditService.getById(id);
        return new ResultUtil<Audit>().setData(audit);
    }


    @RequestMapping(value = "/auditOne", method = RequestMethod.GET)
    public Result<Audit> auditOne(@RequestParam String id,@RequestParam int status,@RequestParam String userName,@RequestParam(required = false) String msg) {
        User user = iUserService.getById(userName);
        if(user != null) {
            Audit audit = iAuditService.getById(id);
            if(audit != null) {
                audit.setStatus(status);
                if(msg == null || msg.equals("") || msg.equals("undefinded")) {
                    if(status == 1) {
                        msg = "同意";
                    } else {
                        msg = "不同意";
                    }
                }
                audit.setAuditMsg(msg);
                audit.setShrr(user.getNickname());
                iAuditService.saveOrUpdate(audit);
                return new ResultUtil<Audit>().setData(audit);
            }
        }
        return new ResultUtil<Audit>().setErrorMsg("NULL");
    }

    @RequestMapping(value = "/getAll", method = RequestMethod.GET)
    @ApiOperation(value = "获取全部数据")
    public Result<List<Audit>> getAll() {

        List<Audit> list = iAuditService.list();
        return new ResultUtil<List<Audit>>().setData(list);
    }

    @RequestMapping(value = "/getByPage", method = RequestMethod.GET)
    @ApiOperation(value = "分页获取")
    public Result<IPage<Audit>> getByPage(PageVo page) {

        IPage<Audit> data = iAuditService.page(PageUtil.initMpPage(page));
        List<Audit> records = data.getRecords();
        for (Audit record : records) {
            Department department = departmentService.get(record.getYcbm());
            if(department != null) {
                record.setYcbm(department.getTitle());
            }
        }
        return new ResultUtil<IPage<Audit>>().setData(data);
    }

    @RequestMapping(value = "/insertOrUpdate", method = RequestMethod.POST)
    @ApiOperation(value = "编辑或更新数据")
    public Result<Audit> saveOrUpdate(Audit audit) {

        if (iAuditService.saveOrUpdate(audit)) {
            return new ResultUtil<Audit>().setData(audit);
        }
        return new ResultUtil<Audit>().setErrorMsg("操作失败");
    }

    @RequestMapping(value = "/delByIds", method = RequestMethod.POST)
    @ApiOperation(value = "批量通过id删除")
    public Result<Object> delAllByIds(@RequestParam String[] ids) {

        for (String id : ids) {
            iAuditService.removeById(id);
        }
        return ResultUtil.success("批量通过id删除数据成功");
    }

    @RequestMapping(value = "/addOnApp", method = RequestMethod.GET)
    public Result<Audit> addOnApp(@RequestParam String userId,@RequestParam String car,@RequestParam String carOwner,
                                   @RequestParam String jcr,@RequestParam String kssj,
                                   @RequestParam String jssj,@RequestParam String ccdd,
                                   @RequestParam String mdd,@RequestParam String reason,@RequestParam String image) {
        User user = iUserService.getById(userId);
        if(user!= null) {
            Audit audit = new Audit();
            audit.setCar(car);
            audit.setCarOwner(carOwner);
            audit.setJcr(jcr);
            audit.setShrr("");
            audit.setSqr(user.getNickname());
            audit.setYcbm(user.getDepartmentId());
            audit.setKssj(kssj);
            audit.setJssj(jssj);
            audit.setStatus(0);
            audit.setCcdd(ccdd);
            audit.setMdd(mdd);
            audit.setReason(reason);
            audit.setImage(image);
            audit.setAuditMsg("");
            iAuditService.saveOrUpdate(audit);
            return new ResultUtil<Audit>().setSuccessMsg("OK");
        }
        return new ResultUtil<Audit>().setErrorMsg("NULL");
    }

    /**
     * 获取审核单
     */
    @RequestMapping(value = "/getAuditDan", method = RequestMethod.GET)
    public Result<List<Audit>> getAuditDan(@RequestParam String userId) {
        List<DepartmentHeader> dhList = departmentHeaderService.getAll();
        List<String> departmentIdList = new ArrayList<>();
        for (DepartmentHeader departmentHeader : dhList) {
            if(departmentHeader.getUserId().equals(userId)) {
                departmentIdList.add(departmentHeader.getDepartmentId());
            }
        }
        List<Audit> ans = new ArrayList<>();
        for (String s : departmentIdList) {
            QueryWrapper<Audit> qw = new QueryWrapper<>();
            qw.eq("ycbm",s);
            List<Audit> list = iAuditService.list(qw);
            ans.addAll(list);
        }
        return new ResultUtil<List<Audit>>().setData(ans);
    }
}
