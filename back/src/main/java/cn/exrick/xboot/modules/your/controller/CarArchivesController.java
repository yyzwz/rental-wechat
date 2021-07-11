package cn.exrick.xboot.modules.your.controller;

import cn.exrick.xboot.common.annotation.SystemLog;
import cn.exrick.xboot.common.enums.LogType;
import cn.exrick.xboot.common.utils.PageUtil;
import cn.exrick.xboot.common.utils.ResultUtil;
import cn.exrick.xboot.common.vo.PageVo;
import cn.exrick.xboot.common.vo.Result;
import cn.exrick.xboot.modules.your.entity.CarArchives;
import cn.exrick.xboot.modules.your.service.ICarArchivesService;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author 郑为中
 */
@Slf4j
@RestController
@Api(tags = "车辆档案管理接口")
@RequestMapping("/xboot/carArchives")
@Transactional
public class CarArchivesController {

    @Autowired
    private ICarArchivesService iCarArchivesService;


    @RequestMapping(value = "/getAll", method = RequestMethod.GET)
    @ApiOperation(value = "获取全部数据")
    public Result<List<CarArchives>> getAll() {
        List<CarArchives> list = iCarArchivesService.list();
        return new ResultUtil<List<CarArchives>>().setData(list);
    }

    @RequestMapping(value = "/getByPage", method = RequestMethod.GET)
    @ApiOperation(value = "分页获取")
    public Result<IPage<CarArchives>> getByPage(PageVo page) {

        IPage<CarArchives> data = iCarArchivesService.page(PageUtil.initMpPage(page));
        return new ResultUtil<IPage<CarArchives>>().setData(data);
    }

    @RequestMapping(value = "/insertOrUpdate", method = RequestMethod.POST)
    @ApiOperation(value = "编辑或更新数据")
    public Result<CarArchives> saveOrUpdate(CarArchives carArchives) {
        carArchives.setLabel(carArchives.getTitle());
        carArchives.setValue(carArchives.getTitle());
        if (iCarArchivesService.saveOrUpdate(carArchives)) {
            return new ResultUtil<CarArchives>().setData(carArchives);
        }
        return new ResultUtil<CarArchives>().setErrorMsg("操作失败");
    }

    @RequestMapping(value = "/delByIds", method = RequestMethod.POST)
    @ApiOperation(value = "批量通过id删除")
    public Result<Object> delAllByIds(@RequestParam String[] ids) {

        for (String id : ids) {
            iCarArchivesService.removeById(id);
        }
        return ResultUtil.success("批量通过id删除数据成功");
    }
}
