 package cn.exrick.xboot.modules.autochat.dao;

 import cn.exrick.xboot.base.XbootBaseDao;
 import cn.exrick.xboot.modules.autochat.entity.AutoChat;

 import java.util.List;

 /**
 * 问答助手客服数据处理层
 * @author Exrick
 */
public interface AutoChatDao extends XbootBaseDao<AutoChat, String> {

     /**
      * 完全匹配
      * @param title
      * @return
      */
    List<AutoChat> findByTitle(String title);
}