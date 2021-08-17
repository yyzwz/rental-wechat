package cn.exrick.xboot.modules.your.entity;

import cn.exrick.xboot.base.XbootBaseEntity;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModelProperty;
import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.experimental.Accessors;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * @author 郑为中
 */
@Data
@Accessors(chain = true)
@Entity
@DynamicInsert
@DynamicUpdate
@Table(name = "t_get_file_audit")
@TableName("t_get_file_audit")
@ApiModel(value = "文件获取审批")
public class GetFileAudit extends XbootBaseEntity {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "申请人")
    private String userId;

    @ApiModelProperty(value = "申请人")
    private String userName;

    @ApiModelProperty(value = "文件")
    private String fileId;

    @ApiModelProperty(value = "文件名")
    private String fileName;

    @ApiModelProperty(value = "文件URL")
    private String fileUrl;

    @ApiModelProperty(value = "文件类型")
    private Integer fileType;

    @ApiModelProperty(value = "申请人部门")
    private String departmentId;

    @ApiModelProperty(value = "申请人部门")
    private String departmentTitle;

    @ApiModelProperty(value = "申请人职位")
    private String position;

    @ApiModelProperty(value = "通过情况")
    private int flag;

    @ApiModelProperty(value = "部门领导")
    private int step1;

    @ApiModelProperty(value = "行政总监")
    private int step2;

    @ApiModelProperty(value = "法务")
    private int step3;

    @ApiModelProperty(value = "董事长")
    private int step4;

    @ApiModelProperty(value = "申请事由")
    private String reason;
}