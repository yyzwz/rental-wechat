package cn.exrick.xboot.modules.your.controller;

import cn.exrick.xboot.common.constant.SettingConstant;
import cn.exrick.xboot.common.utils.PageUtil;
import cn.exrick.xboot.common.utils.ResultUtil;
import cn.exrick.xboot.common.utils.SecurityUtil;
import cn.exrick.xboot.common.vo.PageVo;
import cn.exrick.xboot.common.vo.Result;
import cn.exrick.xboot.modules.base.entity.Department;
import cn.exrick.xboot.modules.base.entity.DepartmentHeader;
import cn.exrick.xboot.modules.base.entity.User;
import cn.exrick.xboot.modules.base.entity.UserRole;
import cn.exrick.xboot.modules.base.service.DepartmentHeaderService;
import cn.exrick.xboot.modules.base.service.DepartmentService;
import cn.exrick.xboot.modules.base.service.SettingService;
import cn.exrick.xboot.modules.base.service.mybatis.IUserRoleService;
import cn.exrick.xboot.modules.base.vo.OssSetting;
import cn.exrick.xboot.modules.file.entity.File;
import cn.exrick.xboot.modules.file.service.FileService;
import cn.exrick.xboot.modules.your.entity.GetFileAudit;
import cn.exrick.xboot.modules.your.service.IGetFileAuditService;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.google.gson.Gson;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

/**
 * @author 郑为中
 */
@Slf4j
@RestController
@Api(tags = "文件获取审批管理接口")
@RequestMapping("/xboot/getFileAudit")
@Transactional
public class GetFileAuditController {

    @Autowired
    private IGetFileAuditService iGetFileAuditService;

    @Autowired
    private SecurityUtil securityUtil;

    @Autowired
    private IUserRoleService iUserRoleService;

    @Autowired
    private DepartmentHeaderService departmentHeaderService;

    @Autowired
    private DepartmentService departmentService;

    @Autowired
    private FileService fileService;

    @Autowired
    private SettingService settingService;

    @PersistenceContext
    private EntityManager entityManager;

    @RequestMapping(value = "/getByPage", method = RequestMethod.GET)
    @ApiOperation(value = "分页获取")
    public Result<IPage<GetFileAudit>> getByPage(@ModelAttribute GetFileAudit audit,@ModelAttribute PageVo page) {
        QueryWrapper<GetFileAudit> qw = new QueryWrapper<>();
        User currUser = securityUtil.getCurrUser();
        String id = currUser.getId();
        if(id.equals("682265633886208")) {

        } else if(id.equals("1427143647157161989")) {
            // 董事长
            qw.eq("file_type",1);
            qw.eq("step4",0);
            qw.eq("step3",1);
        } else if(id.equals("1427143661631705089")) {
            // 法务
            qw.eq("file_type",1);
            qw.eq("step3",0);
            qw.eq("step2",1);
        } else if(id.equals("1427143651024310272")) {
            // 行政总监
            qw.eq("file_type",1);
            qw.eq("step2",0);
            qw.eq("step1",1);
        } else {
            qw.eq("step1",0);
            // 部门领导
            List<DepartmentHeader> headerList = departmentHeaderService.getAll();
            if(headerList.size() == 0) {

            } else if(headerList.size() == 1) {
                qw.eq("department_id",headerList.get(0).getDepartmentId());
            } else if(headerList.size() > 1) {
                qw.and(wrapper -> wrapper.eq("department_id", headerList.get(0).getDepartmentId()).or().eq("department_id",headerList.get(1).getDepartmentId()));
            }
        }
        IPage<GetFileAudit> data = iGetFileAuditService.page(PageUtil.initMpPage(page),qw);
        return new ResultUtil<IPage<GetFileAudit>>().setData(data);
    }

    @RequestMapping(value = "/getMyPage", method = RequestMethod.GET)
    @ApiOperation(value = "分页获取")
    public Result<IPage<GetFileAudit>> getMyPage(@ModelAttribute GetFileAudit audit,@ModelAttribute PageVo page) {
        QueryWrapper<GetFileAudit> qw = new QueryWrapper<>();
        User currUser = securityUtil.getCurrUser();
        String id = currUser.getId();
        qw.eq("user_id",id);
        IPage<GetFileAudit> data = iGetFileAuditService.page(PageUtil.initMpPage(page),qw);
        OssSetting os = new Gson().fromJson(settingService.get(SettingConstant.LOCAL_OSS).getValue(), OssSetting.class);
        for (GetFileAudit record : data.getRecords()) {
            String fileUrl = record.getFileUrl();
            String url = os.getHttp() + os.getEndpoint() + "/";
            entityManager.detach(record);
            record.setFileUrl(url + record.getFileId());
        }
        return new ResultUtil<IPage<GetFileAudit>>().setData(data);
    }

    @RequestMapping(value = "/insertOrUpdate", method = RequestMethod.POST)
    @ApiOperation(value = "编辑或更新数据")
    public Result<GetFileAudit> saveOrUpdate(GetFileAudit getFileAudit) {

        if (iGetFileAuditService.saveOrUpdate(getFileAudit)) {
            return new ResultUtil<GetFileAudit>().setData(getFileAudit);
        }
        return new ResultUtil<GetFileAudit>().setErrorMsg("操作失败");
    }

    @RequestMapping(value = "/delByIds", method = RequestMethod.POST)
    @ApiOperation(value = "批量通过id删除")
    public Result<Object> delAllByIds(@RequestParam String[] ids) {

        for (String id : ids) {
            iGetFileAuditService.removeById(id);
        }
        return ResultUtil.success("批量通过id删除数据成功");
    }

    @RequestMapping(value = "/shenQing", method = RequestMethod.POST)
    public Result<Object> shenQing(@RequestParam String id,@RequestParam String reason,@RequestParam int type) {
        GetFileAudit audit = new GetFileAudit();
        User currUser = securityUtil.getCurrUser();
        audit.setUserId(currUser.getId());
        audit.setUserName(currUser.getNickname());
        audit.setFileType(type);
        String departmentId = currUser.getDepartmentId();
        if(departmentId != null) {
            Department department = departmentService.get(departmentId);
            if(department != null) {
                audit.setDepartmentId(departmentId);
                audit.setDepartmentTitle(department.getTitle());
            }
        }
        audit.setPosition(currUser.getPosition());
        audit.setReason(reason);
        File file = fileService.get(id);
        if(file != null) {
            audit.setFileId(file.getId());
            audit.setFileName(file.getName());
            audit.setFileUrl(file.getUrl());
        }
        iGetFileAuditService.saveOrUpdate(audit);
        return ResultUtil.success("OK");
    }

    @RequestMapping(value = "/passOrDis", method = RequestMethod.POST)
    public Result<Object> passOrDis(@RequestParam String id,@RequestParam int ans) {
        GetFileAudit getFileAudit = iGetFileAuditService.getById(id);
        if(getFileAudit != null) {
            if(ans == 1) {
                if(getFileAudit.getStep1() == 0) {
                    getFileAudit.setStep1(1);
                } else if(getFileAudit.getStep2() == 0) {
                    getFileAudit.setStep2(1);
                } else if(getFileAudit.getStep3() == 0) {
                    getFileAudit.setStep3(1);
                } else if(getFileAudit.getStep4() == 0) {
                    getFileAudit.setStep4(1);
                }
                if(getFileAudit.getFileType() == 0 && getFileAudit.getStep1() == 1) {
                    getFileAudit.setFlag(1);
                }
                if(getFileAudit.getFileType() == 1 && getFileAudit.getStep4() == 1) {
                    getFileAudit.setFlag(1);
                }
            } else if(ans == 2) {
                if(getFileAudit.getStep1() == 0) {
                    getFileAudit.setStep1(2);
                } else if(getFileAudit.getStep2() == 0) {
                    getFileAudit.setStep2(2);
                } else if(getFileAudit.getStep3() == 0) {
                    getFileAudit.setStep3(2);
                } else if(getFileAudit.getStep4() == 0) {
                    getFileAudit.setStep4(2);
                }
                getFileAudit.setFlag(2);
            }
            iGetFileAuditService.saveOrUpdate(getFileAudit);
        }
        return ResultUtil.success("OK");
    }
}
