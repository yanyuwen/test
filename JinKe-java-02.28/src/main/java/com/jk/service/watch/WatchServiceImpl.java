package com.jk.service.watch;

import com.jk.model.watch.Watch;
import com.jk.mapper.watch.WatchMapper;
import com.jk.model.watch.Tree;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.List;


@Service
public class WatchServiceImpl implements WatchService{
    @Autowired
    private WatchMapper watchMapper;


    public List<Tree> queryTree() {
        return watchMapper.queryTree();
    }

    public List<Watch> queryWatch() {
        return watchMapper.queryWatch();
    }

    public List<Watch> queryWatchfByPage(Integer page, Integer limit) {
        page=(page-1)*limit;
        return watchMapper.queryWatchfByPage(page,limit);
    }

    public void addWatch(Watch watch) {
        watchMapper.addWatch(watch);
    }

    public void delwatch(Integer id) {
        watchMapper.delwatch(id);
    }

    public void updateWatch1(Watch watch) {
        watchMapper.updateWatch1(watch);
    }
}
