package cn.exrick.xboot.modules.autochat.vo;

import lombok.Data;
import lombok.experimental.Accessors;

import java.util.List;

/**
 * @author exrick
 */
@Data
@Accessors(chain = true)
public class GuessVo<T> {

    String image = "./img/guess.png";

    String type = "recommend";

    List<T> list;
}
