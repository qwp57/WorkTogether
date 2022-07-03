package com.uni.wt.project.schedule.model.dao;

import com.uni.wt.employee.model.dto.Employee;
import com.uni.wt.project.schedule.model.dto.Schedule;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;
import java.util.Map;

@Mapper
public interface ScheduleMapper {
    Schedule detailView(int board_no);

    int insertSch(Schedule schedule);

    int editSch(Schedule schedule);

    int schJoin(Schedule schedule);

    int getAttendee(Schedule schedule);

    int loadSchAttendee(Schedule schedule);

    ArrayList<Employee> selectSchAttendee(int board_no);

    ArrayList<Schedule> getCalendarByMonth(Map<String, Object> paramMap);

    ArrayList<Schedule> getCalendarByEmp(int emp_no);
}
