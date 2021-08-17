package cn.exrick.xboot.modules.activiti.utils;

import cn.exrick.xboot.common.constant.SettingConstant;
import cn.exrick.xboot.common.exception.XbootException;
import cn.exrick.xboot.common.sms.SmsUtil;
import cn.exrick.xboot.common.utils.EmailUtil;
import cn.exrick.xboot.modules.activiti.dao.ActProcessDao;
import cn.exrick.xboot.modules.activiti.entity.ActBusiness;
import cn.exrick.xboot.modules.activiti.entity.ActProcess;
import cn.exrick.xboot.modules.activiti.vo.EmailMessage;
import cn.exrick.xboot.modules.base.entity.Message;
import cn.exrick.xboot.modules.base.entity.Setting;
import cn.exrick.xboot.modules.base.entity.User;
import cn.exrick.xboot.modules.base.service.MessageSendService;
import cn.exrick.xboot.modules.base.service.SettingService;
import cn.exrick.xboot.modules.base.service.UserService;
import cn.exrick.xboot.modules.base.vo.OtherSetting;
import cn.hutool.core.util.StrUtil;
import cn.hutool.http.HtmlUtil;
import com.google.gson.Gson;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.Map;

/**
 * @author Exrickx
 */
@Transactional
@Component
@Slf4j
public class MessageUtil {

    @Autowired
    private SmsUtil smsUtil;

    @Autowired
    private EmailUtil emailUtil;

    @Autowired
    private UserService userService;

    @Autowired
    private MessageSendService messageSendService;

    @Autowired
    private ActProcessDao actProcessDao;

    @Autowired
    private SettingService settingService;

    public OtherSetting getOtherSetting() {

        Setting setting = settingService.get(SettingConstant.OTHER_SETTING);
        if (StrUtil.isBlank(setting.getValue())) {
            throw new XbootException("系统未配置访问域名");
        }
        return new Gson().fromJson(setting.getValue(), OtherSetting.class);
    }

    /**
     * 发送工作流消息
     * @param userId      发送用户
     * @param messageId   消息ID
     * @param actBusiness 业务关联表
     * @param smsMessage  短信消息
     * @param sendMessage 是否发站内信息
     * @param sendSms     是否发短信
     * @param sendEmail   是否发邮件
     */
    @Async
    public void sendActMessage(String userId, String messageId, ActBusiness actBusiness, String smsMessage,
                               Boolean sendMessage, Boolean sendSms, Boolean sendEmail) {

        User user = userService.get(userId);
        if (user == null) {
            return;
        }

        Map<String, String> params = new HashMap<>();
        params.put("nickname", user.getNickname());
        if (StrUtil.isNotBlank(actBusiness.getUserId())) {
            User applyer = userService.get(actBusiness.getUserId());
            if (applyer != null) {
                params.put("applyer", applyer.getNickname());
            }
        }
        ActProcess actProcess = actProcessDao.findById(actBusiness.getProcDefId()).orElse(null);
        if (actProcess != null) {
            params.put("processName", actProcess.getName());
        }

        // 站内消息
        if (sendMessage) {
            messageSendService.sendTemplateMessage(userId, messageId, params);
        }

        // 短信消息
        if (StrUtil.isNotBlank(user.getMobile()) && sendSms) {
            try {
                smsUtil.sendActMessage(user.getMobile(), smsMessage);
            } catch (Exception e) {
                log.error(e.toString());
            }
        }

        // 邮件消息
        Message message = messageSendService.getTemplateMessage(messageId, params);
        // 填充模版消息 邮箱消息使用
        String title = message.getTitle(), content = HtmlUtil.cleanHtmlTag(message.getContent());
        if (StrUtil.isNotBlank(user.getEmail()) && sendEmail) {
            EmailMessage e = new EmailMessage().setContent(content).setFullUrl(getOtherSetting().getDomain());
            try {
                emailUtil.sendTemplateEmail(user.getEmail(), "【XBoot】" + title, "act-message-email", e);
            } catch (Exception ex) {
                log.error(ex.toString());
            }
        }
    }
}
