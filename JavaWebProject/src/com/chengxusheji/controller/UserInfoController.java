package com.chengxusheji.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.chengxusheji.utils.ServerResponse;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.chengxusheji.utils.ExportExcelUtil;
import com.chengxusheji.utils.UserException;
import com.chengxusheji.service.UserInfoService;
import com.chengxusheji.po.UserInfo;

//UserInfo管理控制层
@Controller
@RequestMapping("/UserInfo")
public class UserInfoController extends BaseController {

    /*业务层对象*/
    @Resource UserInfoService userInfoService;

	@InitBinder("userInfo")
	public void initBinderUserInfo(WebDataBinder binder) {
		binder.setFieldDefaultPrefix("userInfo.");
	}
	/*跳转到添加UserInfo视图*/
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String add(Model model,HttpServletRequest request) throws Exception {
		model.addAttribute(new UserInfo());
		return "UserInfo_add";
	}

	/*客户端ajax方式提交添加用户信息信息*/
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public void add(@Validated UserInfo userInfo, BindingResult br,
			Model model, HttpServletRequest request,HttpServletResponse response) throws Exception {
		System.out.println(userInfo.toString());
		String message = "";
		boolean success = false;
		if (br.hasErrors()) {
			message = "输入信息不符合要求！";
			writeJsonResponse(response, success, message);
			return ;
		}
		if(userInfoService.getUserInfo(userInfo.getUser_name()) != null) {
			message = "用户名已经存在！";
			writeJsonResponse(response, success, message);
			return ;
		}
		try {
			userInfo.setPhoto(this.handlePhotoUpload(request, "photoFile"));
		} catch(UserException ex) {
			message = "图片格式不正确！";
			writeJsonResponse(response, success, message);
			return ;
		}
        userInfoService.addUserInfo(userInfo);
        message = "用户信息添加成功!";
        success = true;
        writeJsonResponse(response, success, message);
	}
	/*客户端form表单方式提交添加用户信息信息*/
	@RequestMapping(value = "/addUser", method = RequestMethod.POST)
	public String addUser(@Validated UserInfo userInfo, String code,Model model,  HttpServletRequest request, HttpSession session) throws Exception {
		System.out.println("====="+userInfo.toString());
		String message = "";
		if(!code.equals(session.getAttribute("checkCode"))){
			message = "验证码错误！";
			request.setAttribute("msg",message);
			return "user/register";
		}
		if(userInfoService.getUserInfo(userInfo.getUser_name()) != null) {
			message = "用户名已经存在！";
			request.setAttribute("msg",message);
			return "user/register";
		}
		try {
			userInfo.setPhoto(this.handlePhotoUpload(request, "photoFile"));
		} catch(UserException ex) {
			message = "图片格式不正确！";
			request.setAttribute("msg",message);
			return "user/register";
		}
		userInfoService.addUserInfo(userInfo);
		message = "用户注册成功!";
		request.setAttribute("msg",message);
		return "user/login";
	}
	/*ajax方式按照查询条件分页查询用户信息信息*/
	@RequestMapping(value = { "/list" }, method = {RequestMethod.GET,RequestMethod.POST})
	public void list(String user_name,String realName,String birthday,String cardNumber,String city,Integer page,Integer rows, Model model, HttpServletRequest request,HttpServletResponse response) throws Exception {
		if (page==null || page == 0) page = 1;
		if (user_name == null) user_name = "";
		if (realName == null) realName = "";
		if (birthday == null) birthday = "";
		if (cardNumber == null) cardNumber = "";
		if (city == null) city = "";
		if(rows != 0)userInfoService.setRows(rows);
		List<UserInfo> userInfoList = userInfoService.queryUserInfo(user_name, realName, birthday, cardNumber, city, page);
	    /*计算总的页数和总的记录数*/
	    userInfoService.queryTotalPageAndRecordNumber(user_name, realName, birthday, cardNumber, city);
	    /*获取到总的页码数目*/
	    int totalPage = userInfoService.getTotalPage();
	    /*当前查询条件下总记录数*/
	    int recordNumber = userInfoService.getRecordNumber();
        response.setContentType("text/json;charset=UTF-8");
		PrintWriter out = response.getWriter();
		//将要被返回到客户端的对象
		JSONObject jsonObj=new JSONObject();
		jsonObj.accumulate("total", recordNumber);
		JSONArray jsonArray = new JSONArray();
		for(UserInfo userInfo:userInfoList) {
			JSONObject jsonUserInfo = userInfo.getJsonObject();
			jsonArray.put(jsonUserInfo);
		}
		jsonObj.accumulate("rows", jsonArray);
		out.println(jsonObj.toString());
		out.flush();
		out.close();
	}

	/*ajax方式按照查询条件分页查询用户信息信息*/
	@RequestMapping(value = { "/listAll" }, method = {RequestMethod.GET,RequestMethod.POST})
	public void listAll(HttpServletResponse response) throws Exception {
		List<UserInfo> userInfoList = userInfoService.queryAllUserInfo();
        response.setContentType("text/json;charset=UTF-8"); 
		PrintWriter out = response.getWriter();
		JSONArray jsonArray = new JSONArray();
		for(UserInfo userInfo:userInfoList) {
			JSONObject jsonUserInfo = new JSONObject();
			jsonUserInfo.accumulate("user_name", userInfo.getUser_name());
			jsonUserInfo.accumulate("realName", userInfo.getRealName());
			jsonArray.put(jsonUserInfo);
		}
		out.println(jsonArray.toString());
		out.flush();
		out.close();
	}

	/*前台按照查询条件分页查询用户信息信息*/
	@RequestMapping(value = { "/frontlist" }, method = {RequestMethod.GET,RequestMethod.POST})
	public String frontlist(String user_name,String realName,String birthday,String cardNumber,String city,Integer currentPage, Model model, HttpServletRequest request) throws Exception  {
		if (currentPage==null || currentPage == 0) currentPage = 1;
		if (user_name == null) user_name = "";
		if (realName == null) realName = "";
		if (birthday == null) birthday = "";
		if (cardNumber == null) cardNumber = "";
		if (city == null) city = "";
		List<UserInfo> userInfoList = userInfoService.queryUserInfo(user_name, realName, birthday, cardNumber, city, currentPage);
	    /*计算总的页数和总的记录数*/
	    userInfoService.queryTotalPageAndRecordNumber(user_name, realName, birthday, cardNumber, city);
	    /*获取到总的页码数目*/
	    int totalPage = userInfoService.getTotalPage();
	    /*当前查询条件下总记录数*/
	    int recordNumber = userInfoService.getRecordNumber();
	    request.setAttribute("userInfoList",  userInfoList);
	    request.setAttribute("totalPage", totalPage);
	    request.setAttribute("recordNumber", recordNumber);
	    request.setAttribute("currentPage", currentPage);
	    request.setAttribute("user_name", user_name);
	    request.setAttribute("realName", realName);
	    request.setAttribute("birthday", birthday);
	    request.setAttribute("cardNumber", cardNumber);
	    request.setAttribute("city", city);
		return "UserInfo/userInfo_frontquery_result"; 
	}

     /*前台查询UserInfo信息*/
	@RequestMapping(value="/{user_name}/frontshow",method=RequestMethod.GET)
	public String frontshow(@PathVariable String user_name,Model model,HttpServletRequest request) throws Exception {
		/*根据主键user_name获取UserInfo对象*/
        UserInfo userInfo = userInfoService.getUserInfo(user_name);

        request.setAttribute("userInfo",  userInfo);
        return "UserInfo/userInfo_frontshow";
	}

	/*ajax方式显示用户信息修改jsp视图页*/
	@RequestMapping(value="/{user_name}/update",method=RequestMethod.GET)
	public void update(@PathVariable String user_name,Model model,HttpServletRequest request,HttpServletResponse response) throws Exception {
        /*根据主键user_name获取UserInfo对象*/
        UserInfo userInfo = userInfoService.getUserInfo(user_name);
        response.setContentType("text/json;charset=UTF-8");
        PrintWriter out = response.getWriter();
		//将要被返回到客户端的对象 
		JSONObject jsonUserInfo = userInfo.getJsonObject();
		out.println(jsonUserInfo.toString());
		out.flush();
		out.close();
	}

	/*ajax方式更新用户信息信息*/
	@RequestMapping(value = "/{user_name}/update", method = RequestMethod.POST)
	public void update(@Validated UserInfo userInfo, BindingResult br,
			Model model, HttpServletRequest request,HttpServletResponse response) throws Exception {
		String message = "";
		System.out.println(userInfo.getEmail()+"=========================================================");
    	boolean success = false;
		if (br.hasErrors()) { 
			message = "输入的信息有错误！";
			writeJsonResponse(response, success, message);
			return;
		}
		String photoFileName = this.handlePhotoUpload(request, "photoFile");
		if(!photoFileName.equals("upload/NoImage.jpg"))userInfo.setPhoto(photoFileName);
		try {
			userInfoService.updateUserInfo(userInfo);
			message = "用户信息更新成功!";
			success = true;
			writeJsonResponse(response, success, message);
		} catch (Exception e) {
			e.printStackTrace();
			message = "用户信息更新失败!";
			writeJsonResponse(response, success, message); 
		}
	}
    /*删除用户信息信息*/
	@RequestMapping(value="/{user_name}/delete",method=RequestMethod.GET)
	public String delete(@PathVariable String user_name,HttpServletRequest request) throws UnsupportedEncodingException {
		  try {
			  userInfoService.deleteUserInfo(user_name);
	            request.setAttribute("message", "用户信息删除成功!");
	            return "message";
	        } catch (Exception e) { 
	            e.printStackTrace();
	            request.setAttribute("error", "用户信息删除失败!");
				return "error";

	        }

	}

	/*ajax方式删除多条用户信息记录*/
	@RequestMapping(value="/deletes",method=RequestMethod.POST)
	public void delete(String user_names,HttpServletRequest request,HttpServletResponse response) throws IOException, JSONException {
		String message = "";
    	boolean success = false;
        try { 
        	int count = userInfoService.deleteUserInfos(user_names);
        	success = true;
        	message = count + "条记录删除成功";
        	writeJsonResponse(response, success, message);
        } catch (Exception e) { 
            //e.printStackTrace();
            message = "有记录存在外键约束,删除失败";
            writeJsonResponse(response, success, message);
        }
	}

	/*按照查询条件导出用户信息信息到Excel*/
	@RequestMapping(value = { "/OutToExcel" }, method = {RequestMethod.GET,RequestMethod.POST})
	public void OutToExcel(String user_name,String realName,String birthday,String cardNumber,String city, Model model, HttpServletRequest request,HttpServletResponse response) throws Exception {
        if(user_name == null) user_name = "";
        if(realName == null) realName = "";
        if(birthday == null) birthday = "";
        if(cardNumber == null) cardNumber = "";
        if(city == null) city = "";
        List<UserInfo> userInfoList = userInfoService.queryUserInfo(user_name,realName,birthday,cardNumber,city);
        ExportExcelUtil ex = new ExportExcelUtil();
        String _title = "UserInfo信息记录"; 
        String[] headers = { "用户名","密码","姓名","性别","出生日期","身份证","籍贯","照片","家庭地址"};
        List<String[]> dataset = new ArrayList<String[]>(); 
        for(int i=0;i<userInfoList.size();i++) {
        	UserInfo userInfo = userInfoList.get(i); 
        	dataset.add(new String[]{userInfo.getUser_name(),userInfo.getPassword(),userInfo.getRealName(),userInfo.getSex(),userInfo.getBirthday(),userInfo.getCardNumber(),userInfo.getCity(),userInfo.getPhoto(),userInfo.getAddress()});
        }
        /*
        OutputStream out = null;
		try {
			out = new FileOutputStream("C://output.xls");
			ex.exportExcel(title,headers, dataset, out);
		    out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		*/
		OutputStream out = null;//创建一个输出流对象 
		try { 
			out = response.getOutputStream();//
			response.setHeader("Content-disposition","attachment; filename="+"UserInfo.xls");//filename是下载的xls的名，建议最好用英文 
			response.setContentType("application/msexcel;charset=UTF-8");//设置类型 
			response.setHeader("Pragma","No-cache");//设置头 
			response.setHeader("Cache-Control","no-cache");//设置头 
			response.setDateHeader("Expires", 0);//设置日期头  
			String rootPath = request.getSession().getServletContext().getRealPath("/");
			ex.exportExcel(rootPath,_title,headers, dataset, out);
			out.flush();
		} catch (IOException e) { 
			e.printStackTrace(); 
		}finally{
			try{
				if(out!=null){ 
					out.close(); 
				}
			}catch(IOException e){ 
				e.printStackTrace(); 
			} 
		}
    }
}
