package cn.exrick.xboot.modules.activiti.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import lombok.experimental.Accessors;
import org.activiti.engine.history.HistoricProcessInstance;

import java.util.Date;

/**
 * @author Exrickx
 */
@Data
@Accessors(chain = true)
public class HistoricProcessInsVo {

    private String id;

    private String name;

    private String key;

    private Integer version;

    private String description;

    private String businessKey;

    private String tableId;

    private String procDefId;

    private String tenantId;

    private String deployId;

    @JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
    private Date startTime;

    @JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
    private Date endTime;

    private Long duration;

    private String routeName;

    private String applyer;

    private String applyerUsername;

    private Integer result;

    private String deleteReason;

    public HistoricProcessInsVo(HistoricProcessInstance hpi) {

        this.id = hpi.getId();
        this.name = hpi.getName();
        this.key = hpi.getProcessDefinitionKey();
        this.version = hpi.getProcessDefinitionVersion();
        this.description = hpi.getDescription();
        this.businessKey = hpi.getBusinessKey();
        this.procDefId = hpi.getProcessDefinitionId();
        this.tenantId = hpi.getTenantId();
        this.deployId = hpi.getDeploymentId();
        this.startTime = hpi.getStartTime();
        this.endTime = hpi.getEndTime();
        this.duration = hpi.getDurationInMillis();
        this.deleteReason = hpi.getDeleteReason();
    }
}
