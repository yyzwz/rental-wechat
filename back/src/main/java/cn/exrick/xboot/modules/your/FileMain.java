package cn.exrick.xboot.modules.your;

import java.io.File;
import java.io.IOException;

public class FileMain {
    public static void main(String[] args) throws IOException {
        File wjjSum = new File("D:\\测试");
        File[] wjjList = wjjSum.listFiles(); // 文件夹
        for (File wjj : wjjList) {
            String path = wjj.getAbsolutePath();
            String name = wjj.getName();
            File file = new File(path);
            File[] fileList = file.listFiles();
            for(int i = 0 ; i < fileList.length ; i ++) {
                if(fileList[i] != null) {
                    singleChange(fileList[i].getAbsolutePath(),name,name + i);
                }
            }
            System.out.println("OK");
        }
        System.out.println("OK");
    }

    public static void singleChange(String filePath,String path,String newName) {
        File file = new File(filePath); //指定文件名及路径
        String ansPath = "D:\\测试\\" + path + "\\" + newName + ".png";
        if (file.renameTo(new File(ansPath))) {
            System.out.println("修改成功!");
        } else {
            System.out.println("修改失败");
        }
    }
}
