package cn.exrick.xboot.modules.autochat.entity;

import cn.exrick.xboot.base.XbootBaseEntity;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.experimental.Accessors;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;
import java.math.BigDecimal;

/**
 * @author Exrick
 */
@Data
@Entity
@DynamicInsert
@DynamicUpdate
@Accessors(chain = true)
@Table(name = "t_auto_chat")
@TableName("t_auto_chat")
@ApiModel(value = "问答助手客服")
public class AutoChat extends XbootBaseEntity {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "问题标题")
    private String title;

    @ApiModelProperty(value = "关键词")
    private String keywords;

    @ApiModelProperty(value = "回答")
    private String content;

    @ApiModelProperty(value = "热门消息")
    private Boolean hot = false;

    @ApiModelProperty(value = "开启反馈（赞踩）")
    private Boolean evaluable = true;

    @ApiModelProperty(value = "点赞数")
    private Integer good = 0;

    @ApiModelProperty(value = "踩数")
    private Integer bad = 0;

    @ApiModelProperty(value = "排序值")
    @Column(precision = 10, scale = 2)
    private BigDecimal sortOrder;

    @Transient
    @TableField(exist = false)
    @ApiModelProperty(value = "回答纯文本")
    private String contentText;
}