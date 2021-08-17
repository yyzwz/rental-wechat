package cn.exrick.xboot.modules.activiti.vo;

import cn.exrick.xboot.common.constant.ActivitiConstant;
import cn.hutool.core.util.StrUtil;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import lombok.experimental.Accessors;
import org.activiti.engine.history.HistoricTaskInstance;

import java.util.Date;
import java.util.List;

/**
 * @author Exrickx
 */
@Data
@Accessors(chain = true)
public class HistoricTaskVo {

    private String id;

    private String name;

    private String key;

    private String description;

    private String executionId;

    private String assignee;

    private String owner;

    private String ownerUsername;

    private String procDefId;

    private String procInstId;

    private String applyer;

    private String applyerUsername;

    private String category;

    private Integer priority;

    private String deleteReason;

    private String comment;

    private Long duration;

    private Long workTime;

    @JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;

    @JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
    private Date startTime;

    @JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
    private Date endTime;

    @JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
    private Date dueTime;

    private String processName;

    private String routeName;

    private String businessKey;

    private String tableId;

    private List<Assignee> assignees;

    private Integer version;

    public HistoricTaskVo(HistoricTaskInstance hTask) {

        this.id = hTask.getId();
        this.name = hTask.getName();
        this.key = hTask.getTaskDefinitionKey();
        this.description = hTask.getDescription();
        this.executionId = hTask.getExecutionId();
        this.assignee = hTask.getAssignee();
        this.owner = hTask.getOwner();
        this.procDefId = hTask.getProcessDefinitionId();
        this.procInstId = hTask.getProcessInstanceId();
        this.priority = hTask.getPriority();
        this.category = hTask.getCategory();
        this.deleteReason = getMyDeleteReason(hTask.getDeleteReason());
        this.duration = hTask.getDurationInMillis();
        this.workTime = hTask.getWorkTimeInMillis();
        this.createTime = hTask.getCreateTime();
        this.startTime = hTask.getStartTime();
        this.endTime = hTask.getEndTime();
        this.dueTime = hTask.getDueDate();
    }

    public String getMyDeleteReason(String deleteReason) {

        if (StrUtil.isBlank(deleteReason)) {
            return "";
        }
        if (ActivitiConstant.PASSED_FLAG.equals(deleteReason)) {
            deleteReason = "审批通过";
        } else if (ActivitiConstant.BACKED_FLAG.equals(deleteReason)) {
            deleteReason = "审批驳回";
        } else if (deleteReason.contains(ActivitiConstant.DELETE_PRE)) {
            String reason = "";
            if (ActivitiConstant.DELETE_PRE.equals(deleteReason)) {
                reason = "未填写";
            } else if (deleteReason.length() > 8) {
                reason = deleteReason.substring(8);
            }
            deleteReason = "删除撤回-原因" + reason;
        } else if (deleteReason.contains(ActivitiConstant.CANCEL_PRE)) {
            String reason = "";
            if (ActivitiConstant.CANCEL_PRE.equals(deleteReason)) {
                reason = "未填写";
            } else if (deleteReason.length() > 9) {
                reason = deleteReason.substring(9);
            }
            deleteReason = "发起人撤回-原因" + reason;
        } else {
            deleteReason = "已删除-原因" + deleteReason;
        }
        return deleteReason;
    }
}
