package cn.exrick.xboot.modules.activiti.controller;

import cn.exrick.xboot.common.constant.CommonConstant;
import cn.exrick.xboot.common.exception.XbootException;
import cn.exrick.xboot.common.redis.RedisTemplateHelper;
import cn.exrick.xboot.common.utils.CommonUtil;
import cn.exrick.xboot.common.utils.ResultUtil;
import cn.exrick.xboot.common.vo.Result;
import cn.exrick.xboot.modules.activiti.entity.ActCategory;
import cn.exrick.xboot.modules.activiti.entity.ActProcess;
import cn.exrick.xboot.modules.activiti.service.ActCategoryService;
import cn.exrick.xboot.modules.activiti.service.ActProcessService;
import cn.hutool.core.util.StrUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author Exrick
 */
@Slf4j
@RestController
@Api(tags = "流程分类管理接口")
@RequestMapping("/xboot/actCategory")
@CacheConfig(cacheNames = "actCategory")
@Transactional
public class ActCategoryController {

    @Autowired
    private ActCategoryService actCategoryService;

    @Autowired
    private ActProcessService actProcessService;

    @Autowired
    private RedisTemplateHelper redisTemplate;

    @RequestMapping(value = "/getByParentId/{parentId}", method = RequestMethod.GET)
    @ApiOperation(value = "通过id获取")
    @Cacheable(key = "#parentId")
    public Result<List<ActCategory>> getByParentId(@PathVariable String parentId) {

        List<ActCategory> list = actCategoryService.findByParentIdOrderBySortOrder(parentId);
        setInfo(list);
        return new ResultUtil<List<ActCategory>>().setData(list);
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ApiOperation(value = "添加")
    public Result<Object> add(ActCategory actCategory) {

        actCategoryService.save(actCategory);
        // 如果不是添加的一级 判断设置上级为父节点标识
        if (!CommonConstant.PARENT_ID.equals(actCategory.getParentId())) {
            ActCategory parent = actCategoryService.get(actCategory.getParentId());
            if (parent.getIsParent() == null || !parent.getIsParent()) {
                parent.setIsParent(true);
                actCategoryService.update(parent);
            }
        }
        // 更新缓存
        redisTemplate.deleteByPattern("actCategory::*");
        return ResultUtil.success("添加成功");
    }

    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    @ApiOperation(value = "编辑")
    public Result<Object> edit(ActCategory actCategory) {

        if (actCategory.getId().equals(actCategory.getParentId())) {
            return ResultUtil.error("上级节点不能为自己");
        }
        ActCategory old = actCategoryService.get(actCategory.getId());
        String oldParentId = old.getParentId();
        actCategoryService.update(actCategory);
        // 若修改了分类名称
        if (!old.getTitle().equals(actCategory.getTitle())) {
            actProcessService.updateCategoryTitle(actCategory.getId(), actCategory.getTitle());
        }
        // 如果该节点不是一级节点 且修改了级别 判断上级还有无子节点
        if (!CommonConstant.PARENT_ID.equals(oldParentId) && !oldParentId.equals(actCategory.getParentId())) {
            ActCategory parent = actCategoryService.get(oldParentId);
            List<ActCategory> children = actCategoryService.findByParentIdOrderBySortOrder(parent.getId());
            if (parent != null && (children == null || children.isEmpty())) {
                parent.setIsParent(false);
                actCategoryService.update(parent);
            }
        }
        // 手动删除所有分类缓存
        redisTemplate.deleteByPattern("actCategory:*");
        return ResultUtil.success("编辑成功");
    }

    @RequestMapping(value = "/delByIds", method = RequestMethod.POST)
    @ApiOperation(value = "批量通过id删除")
    public Result<Object> delByIds(@RequestParam String[] ids) {

        for (String id : ids) {
            deleteRecursion(id, ids);
        }
        // 手动删除所有缓存
        redisTemplate.deleteByPattern("actCategory:*");
        return ResultUtil.success("批量通过id删除数据成功");
    }

    public void deleteRecursion(String id, String[] ids) {

        List<ActProcess> list = actProcessService.findByCategoryId(id);
        if (list != null && list.size() > 0) {
            throw new XbootException("删除失败，包含正被流程使用关联的分类");
        }
        // 获得其父节点
        ActCategory cat = actCategoryService.get(id);
        ActCategory parent = null;
        if (cat != null && StrUtil.isNotBlank(cat.getParentId())) {
            parent = actCategoryService.get(cat.getParentId());
        }
        actCategoryService.delete(id);
        // 判断父节点是否还有子节点
        if (parent != null) {
            List<ActCategory> children = actCategoryService.findByParentIdOrderBySortOrder(parent.getId());
            if (children == null || children.isEmpty()) {
                parent.setIsParent(false);
                actCategoryService.update(parent);
            }
        }
        // 递归删除
        List<ActCategory> categories = actCategoryService.findByParentIdOrderBySortOrder(id);
        for (ActCategory c : categories) {
            if (!CommonUtil.judgeIds(c.getId(), ids)) {
                deleteRecursion(c.getId(), ids);
            }
        }
    }

    @RequestMapping(value = "/search", method = RequestMethod.GET)
    @ApiOperation(value = "名称模糊搜索")
    public Result<List<ActCategory>> searchByTitle(@RequestParam String title) {

        List<ActCategory> list = actCategoryService.findByTitleLikeOrderBySortOrder("%" + title + "%");
        setInfo(list);
        return new ResultUtil<List<ActCategory>>().setData(list);
    }

    public void setInfo(List<ActCategory> list) {

        // lambda表达式
        list.forEach(item -> {
            if (!CommonConstant.PARENT_ID.equals(item.getParentId())) {
                ActCategory parent = actCategoryService.get(item.getParentId());
                item.setParentTitle(parent.getTitle());
            } else {
                item.setParentTitle("一级节点");
            }
        });
    }
}
