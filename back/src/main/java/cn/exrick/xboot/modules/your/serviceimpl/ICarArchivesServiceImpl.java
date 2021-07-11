package cn.exrick.xboot.modules.your.serviceimpl;

import cn.exrick.xboot.modules.your.mapper.CarArchivesMapper;
import cn.exrick.xboot.modules.your.entity.CarArchives;
import cn.exrick.xboot.modules.your.service.ICarArchivesService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * 车辆档案接口实现
 * @author 郑为中
 */
@Slf4j
@Service
@Transactional
public class ICarArchivesServiceImpl extends ServiceImpl<CarArchivesMapper, CarArchives> implements ICarArchivesService {

    @Autowired
    private CarArchivesMapper carArchivesMapper;
}