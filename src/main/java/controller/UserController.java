package controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import domain.User;
import service.IUserService;
import util.Constants;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private IUserService service;
	
	//登录模块
	@RequestMapping("/login.do")
	public String toLogin(){
		return "login";
	}
	
	@RequestMapping("/dologin.do")
	@ResponseBody
	public String doLogin(User user,HttpSession session){
		User finduser = service.findByName(user);
		if(finduser!=null){
			if(finduser.getPassword().equals(user.getPassword())){
				session.setAttribute("sessionUser", finduser);
				return Constants.LOGIN_SUCCESS;
			}
		}
		return Constants.LOGIN_FAIL;
		
	}
	
	@RequestMapping("/index.do")
	public String toIndex(){
		return "index";
	}
	//注销
	@RequestMapping("/logout.do")
	public String logout(){
		return "login";
	}
	
	//跳转到修改用户页面
	@RequestMapping("/editData.action")
	public String editDate(User user,HttpSession session){
		User finduser = service.findById(user);
		session.setAttribute("sessionUser", finduser);
		return "editUser";
	}
	//修改用户
	@RequestMapping("/doeditData.action")
	public String doeditDate(User user,HttpSession session){
		service.modify(user);
		User finduser = service.findById(user);
		session.setAttribute("sessionUser", finduser);
		return "index";
	}
	
	//权限管理模块
	
	//个人账户
	@RequestMapping("/singleAccountData.action")
	public String toAccountData(){
		return "account";
	}
	//修改个人账户
	@RequestMapping("/editAccountData.action")
	public String doAccountData(User user,HttpSession session){
		User user2 = service.findById(user);
		user2.setUsername(user.getUsername());
		user2.setPassword(user.getPassword());
		service.modify(user2);
		session.setAttribute("sessionUser", user2);
		return "redirect:/user/singleAccountData.action";
	}
	
	//查看所有账户信息
	@RequestMapping("/findAccountData.action")
	public String toFindAccountData(HttpSession session){
		List<User> users = service.findAll();
		session.setAttribute("list", users);
		return "findAccount";
	}
	//添加账户
	@RequestMapping("/addAccountData.action")
	public String toAddAccountData(){
		return "addAccount";
	}
	
	@RequestMapping("/doaddaccount.action")
	public String doAddAccountData(User user){
		service.save(user);
		return "redirect:/user/findAccountData.action";
	}
	
	
	
	
	
	

}
