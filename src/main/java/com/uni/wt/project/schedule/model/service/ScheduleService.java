package com.uni.wt.project.schedule.model.service;

import com.uni.wt.employee.model.dto.Employee;
import com.uni.wt.project.boardAll.model.dto.BoardAll;
import com.uni.wt.project.schedule.model.dto.Schedule;

import java.util.ArrayList;

public interface ScheduleService {
    Schedule detailView(int board_no) throws Exception;

    void insertSch(Schedule schedule, BoardAll boardAll) throws Exception;

    void editSch(Schedule schedule) throws Exception;

    void schJoin(Schedule schedule) throws Exception;

    int loadSchAttendee(Schedule schedule) throws Exception;

    ArrayList<Employee> selectSchAttendee(int board_no) throws Exception;
}
