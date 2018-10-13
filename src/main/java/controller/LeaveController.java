package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import domain.Leave;
import domain.Mail;
import domain.User;
import service.ILeaveService;
import service.IUserService;

@Controller
@RequestMapping("/leave")
public class LeaveController {
	
	@Autowired
	private ILeaveService service;
	@Autowired
	private IUserService ser;
	
	//普通用户模块
	//查看休假信息列表
	@RequestMapping("/leave.action")
	public String toLeave(HttpSession session){
		List<Leave> list = service.findByAll();
		List<Leave> leaves = new ArrayList<Leave>();
		for (Leave leave : list) {
			User user = new User();
			user.setId(leave.getApplyID());
			User user2 = ser.findById(user);
			leave.setApply(user2.getNickname());
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			String start = dateFormat.format(leave.getStartTime());
			leave.setStart(start);
			String end = dateFormat.format(leave.getEndTime());
			leave.setEnd(end);
			if(leave.getReason().length()>5){
				leave.setReason(leave.getReason().substring(0, 5)+"...");
			}
			leaves.add(leave);
		}
		session.setAttribute("leaves", leaves);
		return "leave";
	}
	
	//申请休假
	@RequestMapping("/askforleave.action")
	public String askForLeave(HttpSession session,Model model){
		List<User> list = ser.findAll();
		List<User> approves = new ArrayList<User>();
		User myuser = (User) session.getAttribute("sessionUser");
		for (User user : list) {
			if(user.getIsadmin()==0){
				if(user.getId()!=myuser.getId()){
					approves.add(user);
				}
			}
		}
		session.setAttribute("approves", approves);
		Date date = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String sTime = dateFormat.format(date);
		model.addAttribute("sTime", sTime);
		return "apply";
	}
	//提交申请
	@RequestMapping("/doaskforleave.action")
	public String doAskForLeave(Leave leave,HttpServletRequest request) throws ParseException{
		String str1 = request.getParameter("dstartTime");
		String str2 = request.getParameter("dendTime");
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date startTime = null;
		Date endTime = null;
		if(str1!=null){
			startTime = dateFormat.parse(str1);
		}
		if(str2!=null){
			endTime = dateFormat.parse(str2);
		}
		leave.setState(0);
		leave.setStartTime(startTime);
		leave.setEndTime(endTime);
		service.save(leave);
		return "redirect:/leave/askforleave.action";
	}
	
	//管理员用户模块
	//管理员查看休假信息列表
	@RequestMapping("/adminleave.action")
	public String toLeave2(HttpSession session){
		List<Leave> list = service.findByAll();
		List<Leave> leaves = new ArrayList<Leave>();
		User reuser = (User) session.getAttribute("sessionUser");
		for (Leave leave : list) {
			User user = new User();
			user.setId(leave.getApplyID());
			User user2 = ser.findById(user);
			leave.setApply(user2.getNickname());
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			String start = dateFormat.format(leave.getStartTime());
			leave.setStart(start);
			String end = dateFormat.format(leave.getEndTime());
			leave.setEnd(end);
			if(leave.getReason().length()>5){
				leave.setReason(leave.getReason().substring(0, 5)+"...");
			}
			if(leave.getApproveID()==reuser.getId()){
				leaves.add(leave);
			}
		}
		session.setAttribute("leaves", leaves);
		return "leave";
	}
	
	//审核请假
	@RequestMapping("/audit.action")
	public String audit(HttpServletRequest request,HttpSession session){
		String str = request.getParameter("id");
		int id =0;
		if(str!=null){
			id = Integer.parseInt(str);
		}
		Leave leave1 = new Leave();
		leave1.setId(id);
		Leave leave = service.findById(leave1);
		User user = new User();
		user.setId(leave.getApplyID());
		User user2 = ser.findById(user);
		leave.setApply(user2.getNickname());
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String start = dateFormat.format(leave.getStartTime());
		leave.setStart(start);
		String end = dateFormat.format(leave.getEndTime());
		leave.setEnd(end);
		session.setAttribute("showleave", leave);
		return "audit";
	}
	//审核通过
	@RequestMapping("/doaudit.action")
	public String doAudit(HttpServletRequest request){
		String str = request.getParameter("id");
		int id =0;
		if(str!=null){
			id = Integer.parseInt(str);
		}
		Leave leave1 = new Leave();
		leave1.setId(id);
		Leave leave = service.findById(leave1);
		leave.setState(1);
		service.modify(leave);
		return "forward:/leave/adminleave.action";
	}
	//审核不通过
	@RequestMapping("/dorefuse.action")
	public String doRefuse(HttpServletRequest request){
		String str = request.getParameter("id");
		int id =0;
		if(str!=null){
			id = Integer.parseInt(str);
		}
		Leave leave1 = new Leave();
		leave1.setId(id);
		Leave leave = service.findById(leave1);
		leave.setState(2);
		service.modify(leave);
		return "forward:/leave/adminleave.action";
	}
	
	//验证规则
	//开始时间验证
	@RequestMapping("/startTime.action")
	public void startTime(HttpServletRequest request,HttpServletResponse response) throws IOException, ParseException{
		String str = request.getParameter("dstartTime");
		PrintWriter out = response.getWriter();
		if(str!=null){
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date startTime = dateFormat.parse(str);
			if((startTime.getTime())>=((new Date().getTime()))){
				out.print(true);
			}else{
				out.print(false);
			}
		}
	}
	
	//结束时间验证
		@RequestMapping("/endTime.action")
		public void endTime(HttpServletRequest request,HttpServletResponse response) throws IOException, ParseException{
			String str = request.getParameter("dendTime");
			PrintWriter out = response.getWriter();
			if(str!=null){
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
				Date endTime = dateFormat.parse(str);
				if((endTime.getTime())>=((new Date().getTime()))){
					out.print(true);
				}else{
					out.print(false);
				}
			}
		}

}
