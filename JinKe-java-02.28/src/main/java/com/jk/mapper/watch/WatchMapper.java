package com.jk.mapper.watch;

import com.jk.model.watch.Tree;
import com.jk.model.watch.Watch;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface WatchMapper {
   List<Tree> queryTree();

   List<Watch> queryWatch();

   List<Watch> queryWatchfByPage(@Param("page") Integer page, @Param("limit") Integer limit);

    void addWatch(Watch watch);

    void delwatch(Integer id);

    void updateWatch1(Watch watch);
}
