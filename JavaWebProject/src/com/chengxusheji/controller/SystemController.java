package com.chengxusheji.controller;

import java.awt.image.BufferedImage;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Random;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.chengxusheji.po.Admin;
import com.chengxusheji.po.UserInfo;
import com.chengxusheji.service.AdminService;
import com.chengxusheji.service.UserInfoService;
import com.chengxusheji.util.RandomValidateCodeUtil;
import com.chengxusheji.utils.*;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;



@Controller
public class SystemController { 
	
	@Resource AdminService adminService;  
	@Resource
	UserInfoService userInfoService;
	@RequestMapping(value="/login",method= RequestMethod.GET)
	public String login(Model model) {
		model.addAttribute(new Admin());
		return "login";
	}
	@RequestMapping(value = "/getcode")
	public void getCode(HttpServletResponse response, HttpServletRequest request) throws Exception{
		System.out.println("=--------====");
		HttpSession session=request.getSession();
		//利用图片工具生成图片
		//第一个参数是生成的验证码，第二个参数是生成的图片
		Object[] objs = RandomValidateCodeUtil.createImage();
		//将验证码存入Session
		session.setAttribute("imageCode",objs[0]);

		//将图片输出给浏览器
		BufferedImage image = (BufferedImage) objs[1];
		response.setContentType("image/png");
		OutputStream os = response.getOutputStream();
		ImageIO.write(image, "png", os);
	}
	//前台用户登录
	@RequestMapping(value="/frontLogin",method=RequestMethod.POST)
	public String frontLogin(@RequestParam("username")String username, @RequestParam("password")String password,
							 String verification, Model model, HttpServletResponse response, HttpSession session) throws Exception {
		String text = (String) session.getAttribute("imageCode");
		System.out.println(username+"======"+password+"=========="+verification);
		if(!text.equals(verification)) {
			model.addAttribute("msg","验证码错误");
			return "user/login";
		}
		UserInfo user =userInfoService.checkLogin(username,password);
		System.out.println(user.toString()+"========");
		if (user == null) {
			model.addAttribute("msg","用户名或密码错误");
			return "user/login";
		}
		//成功后将登录信息放入session
		session.setAttribute("user_name", username);
		session.setAttribute("user", user);
		/*

		if(success) {
			session.setAttribute("user_name", userName); 
		}*/
  
        return "index";
	}


	@RequestMapping(value="/login",method=RequestMethod.POST)
	public void login(@Validated Admin admin, BindingResult br, Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		boolean success = true;
		String msg = ""; 
		if(br.hasErrors()) {
			msg = br.getAllErrors().toString();
			success = false;  
		} 
		if (!adminService.checkLogin(admin)) { 
			msg = adminService.getErrMessage();
			success = false; 
		} 
		if(success) {
			session.setAttribute("username", admin.getUsername()); 
		}  
        response.setContentType("text/json;charset=UTF-8");  
        PrintWriter out = response.getWriter();  
        //将要被返回到客户端的对象   
        JSONObject json=new JSONObject();
        json.accumulate("success", success);
        json.accumulate("msg", msg);
        out.println(json.toString());   
        out.flush();  
        out.close();  
	}
	
	
	
	@RequestMapping("/logout")
	public String logout(Model model,HttpSession session) {
		model.asMap().remove("username"); 
		session.invalidate();
		return "redirect:/login";
	}
	
	
	@RequestMapping(value="/changePassword",method=RequestMethod.POST)
	public String ChangePassword(String oldPassword,String newPassword,String newPassword2,HttpServletRequest request,HttpSession session) throws Exception { 
		if(oldPassword.equals("")) throw new UserException("请输入旧密码！");
		if(newPassword.equals("")) throw new UserException("请输入新密码！");
		if(!newPassword.equals(newPassword2)) throw new UserException("两次新密码输入不一致"); 
		
		String username = (String)session.getAttribute("username");
		if(username == null) throw new UserException("session会话超时，请重新登录系统!");
		 
		
		Admin admin = adminService.findAdminByUserName(username); 
		if(!admin.getPassword().equals(oldPassword)) throw new UserException("输入的旧密码不正确!");
		
		try { 
			adminService.changePassword(username,newPassword);
			request.setAttribute("message", java.net.URLEncoder.encode(
					"密码修改成功!", "GBK"));
			return "message";
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", java.net.URLEncoder
					.encode("密码修改失败!","GBK"));
			return "error";
		}   
	}
	//    获取验证码ajax
	@RequestMapping(value = "/customer_getCode",method = RequestMethod.GET)
	@ResponseBody
	public ServerResponse getCheckedCode(String email, HttpServletRequest request, HttpServletResponse response,HttpSession session) {
				ServerResponse result ;
					String checkCode = String.valueOf(new Random().nextInt(899999) + 100000);
					String message = "您的注册验证码为：" + checkCode;
					//在session中添加验证码：
					session.setAttribute("checkCode",checkCode);
					try {
						JavaEmailSender.sendEmail(email, "注册验证码", message);
					} catch (Exception e) {
						e.printStackTrace();
						System.out.println(e);
					}
				System.out.println("验证码"+message);
					result =ServerResponse.getSuccess(checkCode);
		return result;
	}
	
	
	
}
