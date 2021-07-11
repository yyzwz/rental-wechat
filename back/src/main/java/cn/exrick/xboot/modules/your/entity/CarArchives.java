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
@Table(name = "t_car_archives")
@TableName("t_car_archives")
@ApiModel(value = "车辆档案")
public class CarArchives extends XbootBaseEntity {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "车辆名称")
    private String title;

    @ApiModelProperty(value = "车辆所属人")
    private String userName;

    @ApiModelProperty(value = "牌照")
    private String license;

    @ApiModelProperty(value = "行驶证")
    private String drivingLicense;

    @ApiModelProperty(value = "备注")
    private String remark;

    @ApiModelProperty(value = "前端")
    private String value;

    @ApiModelProperty(value = "前端")
    private String label;
}