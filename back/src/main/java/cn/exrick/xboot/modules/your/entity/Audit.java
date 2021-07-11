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
@Table(name = "t_audit")
@TableName("t_audit")
@ApiModel(value = "审批单")
public class Audit extends XbootBaseEntity {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "车辆")
    private String car;

    @ApiModelProperty(value = "车主")
    private String carOwner;

    @ApiModelProperty(value = "驾车人")
    private String jcr;

    @ApiModelProperty(value = "申请人")
    private String sqr;

    @ApiModelProperty(value = "审核人")
    private String shrr;

    @ApiModelProperty(value = "申请人部门")
    private String ycbm;

    @ApiModelProperty(value = "开始时间")
    private String kssj;

    @ApiModelProperty(value = "结束时间")
    private String jssj;

    @ApiModelProperty(value = "出车地点")
    private String ccdd;

    @ApiModelProperty(value = "目的地")
    private String mdd;

    @ApiModelProperty(value = "事由")
    private String reason;

    @ApiModelProperty(value = "图片")
    private String image;

    @ApiModelProperty(value = "状态")
    private int status;
}