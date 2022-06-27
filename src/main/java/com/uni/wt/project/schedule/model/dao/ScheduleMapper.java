package com.uni.wt.project.schedule.model.dao;

import com.uni.wt.project.schedule.model.dto.Schedule;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ScheduleMapper {
    Schedule detailView(int board_no);

    int insertSch(Schedule schedule);
}
