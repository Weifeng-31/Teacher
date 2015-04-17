package com.lyd.soft.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lyd.soft.entity.Calendar;
import com.lyd.soft.entity.Teacher;
import com.lyd.soft.service.ICalendarService;
import com.lyd.soft.util.DateUtils;
import com.lyd.soft.util.StringUtils;
import com.lyd.soft.util.UserUtils;

/**
 * 日程控制类
 * @author LYD
 *
 */

@Controller
@RequestMapping(value = "/calendarAction")
public class CalendarAction {

	private static final Logger logger = Logger.getLogger(CalendarAction.class);
	
	@Autowired
	private ICalendarService calendarService;
	
	@RequestMapping(value = "/toCalendar")
	public String toCalendar(){
		return "calendar/calendar";
	}
	
	@RequestMapping(value = "/listCalendar")
	@ResponseBody
	public List<Calendar> listCalendar(
			@RequestParam("start") String strat,
			@RequestParam("end") String end,
			HttpSession session) throws Exception {
		
		Teacher teacher = UserUtils.getUserFromSession(session);
		String teaId = teacher.getTeacherId();
		List<Calendar> list = new ArrayList<Calendar>();
		if(!StringUtils.isBlank(teaId)){
			list = this.calendarService.findByDateRange(teaId, strat, end);
		}else{
			logger.error("teaId为空！");
		}
		return list;
	}
	
	public String addCalendar(@ModelAttribute("calendar") Calendar calendar, HttpSession session){
		Teacher teacher = UserUtils.getUserFromSession(session);
		calendar.setTeacher(teacher);
		calendar.setCreateDate(new Date());
		calendar.setIsDelete(0);
		return null;
	}
}
