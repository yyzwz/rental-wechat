package cn.exrick.xboot.modules.autochat.vo;

import lombok.Data;
import lombok.experimental.Accessors;

import java.util.List;

/**
 * @author exrick
 */
@Data
@Accessors(chain = true)
public class AssociateVo<T> {

    List<T> list;

    String keyword;
}
