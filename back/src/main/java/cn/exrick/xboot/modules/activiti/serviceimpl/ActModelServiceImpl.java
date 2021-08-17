package cn.exrick.xboot.modules.activiti.serviceimpl;

import cn.exrick.xboot.modules.activiti.dao.ActModelDao;
import cn.exrick.xboot.modules.activiti.entity.ActModel;
import cn.exrick.xboot.modules.activiti.service.ActModelService;
import cn.hutool.core.util.StrUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.criteria.*;
import java.util.ArrayList;
import java.util.List;

/**
 * 模型管理接口实现
 * @author Exrick
 */
@Slf4j
@Service
@Transactional
public class ActModelServiceImpl implements ActModelService {

    @Autowired
    private ActModelDao actModelDao;

    @Override
    public ActModelDao getRepository() {
        return actModelDao;
    }

    @Override
    public Page<ActModel> findByCondition(ActModel actModel, Pageable pageable) {

        return actModelDao.findAll(new Specification<ActModel>() {
            @Nullable
            @Override
            public Predicate toPredicate(Root<ActModel> root, CriteriaQuery<?> cq, CriteriaBuilder cb) {

                Path<String> nameField = root.get("name");
                Path<String> modelKeyField = root.get("modelKey");

                List<Predicate> list = new ArrayList<>();

                // 模糊搜素
                if (StrUtil.isNotBlank(actModel.getName())) {
                    list.add(cb.like(nameField, '%' + actModel.getName() + '%'));
                }
                if (StrUtil.isNotBlank(actModel.getModelKey())) {
                    list.add(cb.like(modelKeyField, '%' + actModel.getModelKey() + '%'));
                }

                Predicate[] arr = new Predicate[list.size()];
                cq.where(list.toArray(arr));
                return null;
            }
        }, pageable);
    }
}