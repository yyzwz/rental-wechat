package cn.exrick.xboot.modules.activiti.vo;

import lombok.Data;

import java.util.List;

/**
 * @author Exrickx
 */
@Data
public class ActPage<T> {

    List<T> content;

    Long totalElements;
}
