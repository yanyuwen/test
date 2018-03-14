package com.jk.service.watch;

import com.jk.model.watch.Tree;
import com.jk.model.watch.Watch;

import java.util.List;

public interface WatchService{

   List<Tree> queryTree();

   List<Watch> queryWatch();

   List<Watch> queryWatchfByPage(Integer page, Integer limit);

    void addWatch(Watch watch);

    void delwatch(Integer id);

    void updateWatch1(Watch watch);
}
