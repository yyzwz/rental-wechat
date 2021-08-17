package cn.exrick.xboot.modules.your.serviceimpl;

import cn.exrick.xboot.modules.your.mapper.GetFileAuditMapper;
import cn.exrick.xboot.modules.your.entity.GetFileAudit;
import cn.exrick.xboot.modules.your.service.IGetFileAuditService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * 文件获取审批接口实现
 * @author 郑为中
 */
@Slf4j
@Service
@Transactional
public class IGetFileAuditServiceImpl extends ServiceImpl<GetFileAuditMapper, GetFileAudit> implements IGetFileAuditService {

    @Autowired
    private GetFileAuditMapper getFileAuditMapper;
}