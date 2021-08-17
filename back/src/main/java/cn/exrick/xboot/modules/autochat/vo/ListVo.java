package cn.exrick.xboot.modules.autochat.vo;

import lombok.Data;
import lombok.experimental.Accessors;

import java.util.List;

@Data
@Accessors(chain = true)
public class ListVo<T> {

    List<T> list;
}
