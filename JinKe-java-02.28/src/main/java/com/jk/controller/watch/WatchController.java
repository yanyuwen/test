package com.jk.controller.watch;

import com.jk.model.watch.Tree;
import com.jk.model.watch.Watch;
import com.jk.service.watch.WatchService;
import com.jk.util.ConstantsBean;
import com.jk.util.FileUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.HashMap;

import java.util.List;
import java.util.Map;

@Controller
public class WatchController {

    @Autowired
    private WatchService watchService;


    //Tree树
    @RequestMapping("queryTree")
    @ResponseBody
    public List<Map<String,Object>> getTree(){
        List<Tree> treelist = watchService.queryTree();
        return treeStr(treelist,0);
    }

    //递归
    public List<Map<String,Object>> treeStr(List<Tree> list, Integer pid){
        List<Map<String,Object>> newlist = new ArrayList<Map<String,Object>>();
        for (int i = 0; i < list.size(); i++) {
            //获取单个tree对象
            Tree tree = list.get(i);
            Map<String,Object> map = null;
            //判断当前tree对象的pid是否和传过来的pid相等，相等的保存到map中
            if(tree.getPid() == pid){
                map = new HashMap<String, Object>();
                map.put("id", tree.getId());
                map.put("name", tree.getName());
                map.put("url", tree.getUrl());
                map.put("children", treeStr(list,tree.getId()));
            }
            if(map != null){
                List<Map<String,Object>> li = (List<Map<String, Object>>) map.get("children");
                if(li.size()<=0){
                    map.remove("children");
                }
                newlist.add(map);
            }
        }
        return newlist;
    }



   //查询
    @RequestMapping("watchSelect")
    @ResponseBody
    public Map<String,Object> queryStaff(Integer page,Integer limit){
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("code",0);
        map.put("msg","");
        map.put("count",watchService.queryWatch().size());
        map.put("data",watchService.queryWatchfByPage(page,limit));
        return map;
    }

    //新增
    @RequestMapping("addWatch")
    @ResponseBody
    public Map<String,Object> addWatch(Watch watch){
        Map<String,Object> map=new HashMap<String,Object>();
        try {
            watchService.addWatch(watch);
            map.put("success",true);
        }catch (Exception e){
            e.printStackTrace();
            map.put("success",false);
        }
        return map;
    }

    @RequestMapping("delwatch")
    @ResponseBody
    public Map<String,Object> delwatch(Integer id){
        Map<String,Object> map=new HashMap<String,Object>();
        try {
            watchService.delwatch(id);
            map.put("success",true);
        }catch (Exception e){
            e.printStackTrace();
            map.put("success",false);
        }
        return map;
    }


    @RequestMapping(value = "uploadPhoto", method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> uploadPhoto(MultipartFile file){
        Map<String,Object> map = new HashMap<String, Object>();
        try {
            String photoName = FileUtil.upFile(file, ConstantsBean.IMG_PATH);
            String path = ConstantsBean.IMG_SERVER_PATH+photoName;
            map.put("success", true);
            map.put("path", path);

        } catch (Exception e) {
            e.printStackTrace();
            map.put("success", false);
        }
        return map;
    }

    @RequestMapping("updateWatch1")
    @ResponseBody
    public void updateWatch1(Watch watch){
        watchService.updateWatch1(watch);
    }
}
