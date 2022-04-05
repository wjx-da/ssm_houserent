package com.chengxusheji.service;

import com.chengxusheji.mapper.RentMapper;
import com.chengxusheji.po.Rent;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class RentService {
    @Resource
    RentMapper rentMapper;

    public Rent queryRent(Integer hourseId) {
        return rentMapper.queryRent(hourseId);
    }

    public void addRent(Rent rent) throws Exception{
        rentMapper.addRent(rent);
    }
}
