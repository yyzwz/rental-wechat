package cn.exrick.xboot.modules.activiti.vo;

import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
 * @author Exrickx
 */
@Data
@Accessors(chain = true)
public class EmailMessage implements Serializable {

    private String content;

    private String fullUrl;
}
