package cn.exrick.xboot.modules.autochat.serviceimpl;

import cn.exrick.xboot.common.vo.SearchVo;
import cn.exrick.xboot.modules.autochat.dao.AutoChatDao;
import cn.exrick.xboot.modules.autochat.entity.AutoChat;
import cn.exrick.xboot.modules.autochat.service.AutoChatService;
import cn.hutool.core.date.DateUtil;
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
import java.util.Date;
import java.util.List;

/**
 * 问答助手客服接口实现
 * @author Exrick
 */
@Slf4j
@Service
@Transactional
public class AutoChatServiceImpl implements AutoChatService {

    @Autowired
    private AutoChatDao autoChatDao;

    @Override
    public AutoChatDao getRepository() {
        return autoChatDao;
    }

    @Override
    public Page<AutoChat> findByCondition(AutoChat autoChat, SearchVo searchVo, Pageable pageable) {

        return autoChatDao.findAll(new Specification<AutoChat>() {
            @Nullable
            @Override
            public Predicate toPredicate(Root<AutoChat> root, CriteriaQuery<?> cq, CriteriaBuilder cb) {

                Path<String> titleField = root.get("title");
                Path<String> keywordsField = root.get("keywords");
                Path<String> contentField = root.get("content");
                Path<Date> createTimeField = root.get("createTime");

                List<Predicate> list = new ArrayList<>();

                // 模糊搜素
                if (StrUtil.isNotBlank(autoChat.getTitle())) {
                    list.add(cb.like(titleField, '%' + autoChat.getTitle() + '%'));
                }
                if (StrUtil.isNotBlank(autoChat.getKeywords())) {
                    list.add(cb.like(keywordsField, '%' + autoChat.getKeywords() + '%'));
                }
                if (StrUtil.isNotBlank(autoChat.getContent())) {
                    list.add(cb.like(contentField, '%' + autoChat.getContent() + '%'));
                }
                // 创建时间
                if (StrUtil.isNotBlank(searchVo.getStartDate()) && StrUtil.isNotBlank(searchVo.getEndDate())) {
                    Date start = DateUtil.parse(searchVo.getStartDate());
                    Date end = DateUtil.parse(searchVo.getEndDate());
                    list.add(cb.between(createTimeField, start, DateUtil.endOfDay(end)));
                }

                Predicate[] arr = new Predicate[list.size()];
                cq.where(list.toArray(arr));
                return null;
            }
        }, pageable);
    }

    @Override
    public AutoChat findByTitle(String title) {

        List<AutoChat> list = autoChatDao.findByTitle(title);
        if (list != null && !list.isEmpty()) {
            return list.get(0);
        }
        return null;
    }

}