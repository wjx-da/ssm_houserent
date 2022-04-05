package com.chengxusheji.controller;


import com.chengxusheji.po.*;
import com.chengxusheji.service.HourseService;
import com.chengxusheji.service.RentService;
import com.chengxusheji.service.UserInfoService;
import com.chengxusheji.service.WantHourseInfoService;
import com.chengxusheji.utils.UserException;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

//PriceRange管理控制层
@Controller
@RequestMapping("/Rent")
public class RentController {
    /*业务层对象*/
    @Resource
    HourseService hourseService;
    @Resource
    WantHourseInfoService wantHourseInfoService;
    @Resource
    UserInfoService userInfoService;
    @Resource
    RentService rentService;
    /*客户端ajax方式提交添加楼盘信息信息*/
    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String add(@Validated int wantHourseId,HttpServletRequest request, HttpServletResponse response) throws Exception {
        WantHourseInfo wantHourseInfo = wantHourseInfoService.getWantHourseInfo(wantHourseId);
        UserInfo userInfo = wantHourseInfo.getUserObj();
        request.setAttribute("wantHourseInfo",wantHourseInfo);
        request.setAttribute("user_rent",userInfo);
        return "Rent/add";
    }
    /*客户端ajax方式提交添加楼盘信息信息*/
    @RequestMapping(value = "/addRent", method = RequestMethod.POST)
    public String add(int wantHourseInfoId,String userName,String starttime,String endtime,String rentprice,
            HttpServletRequest request, HttpServletResponse response) throws Exception {
        Rent rent = new Rent();
        WantHourseInfo wantHourseInfo = wantHourseInfoService.getWantHourseInfo(wantHourseInfoId);
        Hourse hourse = hourseService.getHourse(wantHourseInfo.getHourseId());
        //hourse只有一间，因此先判断房间是否合格
        Rent q = rentService.queryRent(hourse.getHourseId());
        //不管是否插入成功，都将wantHourseInfo从数据库删除：
        wantHourseInfoService.deleteWantHourseInfo(wantHourseInfo.getWantHourseId());
        if(q != null && q.getStarttime() != null){
            throw new UserException("房子已经出租！");
        }
        UserInfo userInfo = wantHourseInfo.getUserObj();
        //填充rent对象
        rent.setHourseObj(hourse);;
        rent.setUserInfoObj(userInfo);
        rent.setStarttime(starttime);
        rent.setEndtime(endtime);
        rent.setRentprice(Float.parseFloat(rentprice));
        Date d = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String dateNowStr = sdf.format(d);
        rent.setNowtime(dateNowStr);
        hourse.setUserInfo(userInfo.getUser_name());
        System.out.println(hourse.toString());
        try{
            rentService.addRent(rent);
            hourseService.updateHourse(hourse);
        }catch (Exception e){
            System.out.println(e.getMessage());
            throw new UserException("添加合同失败");
        }

        request.setAttribute("rent",rent);
        return "Rent/contract";
    }
    @RequestMapping(value = "/Check", method = RequestMethod.GET)
    public String Check(@Validated int hourseId,HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println(hourseId+"============");
        Hourse hourse = hourseService.getHourse(hourseId);
        Rent rent = rentService.queryRent(hourse.getHourseId());
        request.setAttribute("rent",rent);
        return "Rent/contract";
    }
}
