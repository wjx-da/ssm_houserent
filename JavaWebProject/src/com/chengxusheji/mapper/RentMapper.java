package com.chengxusheji.mapper;

import com.chengxusheji.po.Rent;

public interface RentMapper {
    Rent queryRent(Integer hourseId);

    void addRent(Rent rent)throws Exception;
}
