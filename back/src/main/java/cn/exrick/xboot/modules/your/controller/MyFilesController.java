package cn.exrick.xboot.modules.your.controller;

import cn.exrick.xboot.common.utils.ResultUtil;
import cn.exrick.xboot.common.vo.Result;
import io.swagger.annotations.Api;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

/**
 * @author 郑为中
 */
@Slf4j
@RestController
@Api(tags = "图片文件处理管理接口")
@RequestMapping("/xboot/myFiles")
@Transactional
public class MyFilesController {


    @RequestMapping(value = "/uploadFile", method = RequestMethod.POST)
    public Result<String> upload(@RequestParam(required = false) MultipartFile file) {
        if(file == null){
            return ResultUtil.error("文件不存在");
        }
        final String realPaths = "C:\\java\\code\\tang\\front\\html\\car\\";
        try {
            java.io.File dir = new File(realPaths);
            if (!dir.exists()) {
                dir.mkdir();
            }
            String name = UUID.randomUUID().toString().replace('-','0') + ".png";
            java.io.File files  =  new File(realPaths, name);
            files.setReadable(true);
            files.setExecutable(true);
            files.setWritable(true);
            file.transferTo(files);
            byte[] data = null;
            // 读取图片字节数组
            try {
                InputStream in = new FileInputStream(realPaths+name);
                data = new byte[in.available()];
                in.read(data);
                in.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
            return new ResultUtil<String>().setData(name);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (IllegalStateException e) {
            e.printStackTrace();
        }
        return new ResultUtil<String>().setErrorMsg("FAIL");
    }
}
