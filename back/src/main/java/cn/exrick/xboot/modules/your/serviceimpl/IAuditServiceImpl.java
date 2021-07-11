package cn.exrick.xboot.modules.your.serviceimpl;

import cn.exrick.xboot.modules.your.mapper.AuditMapper;
import cn.exrick.xboot.modules.your.entity.Audit;
import cn.exrick.xboot.modules.your.service.IAuditService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * 审批单接口实现
 * @author 郑为中
 */
@Slf4j
@Service
@Transactional
public class IAuditServiceImpl extends ServiceImpl<AuditMapper, Audit> implements IAuditService {

    @Autowired
    private AuditMapper auditMapper;
}