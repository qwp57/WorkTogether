package com.uni.wt.project.schedule.model.service;

import com.uni.wt.project.boardAll.model.dto.BoardAll;
import com.uni.wt.project.post.model.dto.Post;
import com.uni.wt.project.schedule.model.dto.Schedule;

public interface ScheduleService {
    Schedule detailView(int board_no) throws Exception;

    void insertSch(Schedule schedule, BoardAll boardAll) throws Exception;
}
