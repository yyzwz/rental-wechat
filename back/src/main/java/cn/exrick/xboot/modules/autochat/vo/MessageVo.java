package cn.exrick.xboot.modules.autochat.vo;

import cn.hutool.core.util.IdUtil;
import lombok.Data;
import lombok.experimental.Accessors;

import java.util.List;

/**
 * @author exrick
 */
@Data
@Accessors(chain = true)
public class MessageVo<T, M> {

    String _id;

    String type = "text";

    T content;

    M meta;

    Boolean hasTime = false;

    long createdAt;

    public MessageVo card(String content, Boolean evaluable) {

        return this.card(IdUtil.fastSimpleUUID(), content, evaluable);
    }

    public MessageVo card(String id, String content, Boolean evaluable) {

        return new MessageVo().setType("card")
                .set_id(id)
                .setContent(new CardVo<>().setData(new TextVo(content)))
                .setMeta(new Evaluable(evaluable));
    }

    public MessageVo recommend(List<T> data) {

        return new MessageVo().setType("card")
                .setContent(new RecommendVo().setData(new ListVo().setList(data)));
    }

    public MessageVo promotion(List<T> data) {

        return new MessageVo().setType("card")
                .setContent(new PromotionVo<>().setData(new ArrayVo<>().setArray(data)));
    }
}
