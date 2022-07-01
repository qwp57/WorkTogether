package com.uni.wt.project.schedule.model.service;

import com.uni.wt.employee.model.dto.Employee;
import com.uni.wt.project.boardAll.model.dao.BoardAllMapper;
import com.uni.wt.project.boardAll.model.dto.BoardAll;
import com.uni.wt.project.schedule.model.dao.ScheduleMapper;
import com.uni.wt.project.schedule.model.dto.Schedule;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;

@Transactional(rollbackFor = Exception.class)
@Slf4j
@Service
@Primary
public class ScheduleServiceImpl implements ScheduleService {
    @Autowired
    private BoardAllMapper boardAllMapper;
    @Autowired
    private ScheduleMapper scheduleMapper;

    @Override
    public Schedule detailView(int board_no) throws Exception {
        return scheduleMapper.detailView(board_no);
    }

    @Override
    public void insertSch(Schedule schedule, BoardAll boardAll) throws Exception {
        int board_no = boardAllMapper.nextBoardNo();
        boardAll.setBoard_no(board_no);
        int result1 = boardAllMapper.insertBoard(boardAll);
        if (result1 < 0) {
            throw new Exception("게시물 등록 실패");
        } else {
            schedule.setBoard_no(board_no);
            int result2 = scheduleMapper.insertSch(schedule);

            if (result2 < 0) {
                throw new Exception("게시물 등록 실패");

            }

        }
    }

    @Override
    public void editSch(Schedule schedule) throws Exception {
        int result = scheduleMapper.editSch(schedule);
        if (result < 0) {
            throw new Exception("게시물 수정 실패");
        }
    }

    @Override
    public void schJoin(Schedule schedule) throws Exception {
        int result2 = scheduleMapper.schJoin(schedule);
        if (result2 < 0) {
            throw new Exception("일정 참석 실패");
        }
    }

    @Override
    public int loadSchAttendee(Schedule schedule) throws Exception {
        return scheduleMapper.loadSchAttendee(schedule);
    }

    @Override
    public ArrayList<Employee> selectSchAttendee(int board_no) throws Exception {
        return scheduleMapper.selectSchAttendee(board_no);
    }

}
