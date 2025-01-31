package com.chengxusheji.service;

import java.util.ArrayList;
import javax.annotation.Resource; 
import org.springframework.stereotype.Service;
import com.chengxusheji.po.HourseType;

import com.chengxusheji.mapper.HourseTypeMapper;
@Service
public class HourseTypeService {

	@Resource HourseTypeMapper hourseTypeMapper;
    /*每页显示记录数目*/
    private int rows = 10;;
    public int getRows() {
		return rows;
	}
	public void setRows(int rows) {
		this.rows = rows;
	}

    /*保存查询后总的页数*/
    private int totalPage;
    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }
    public int getTotalPage() {
        return totalPage;
    }

    /*保存查询到的总记录数*/
    private int recordNumber;
    public void setRecordNumber(int recordNumber) {
        this.recordNumber = recordNumber;
    }
    public int getRecordNumber() {
        return recordNumber;
    }

    /*添加房屋类别记录*/
    public void addHourseType(HourseType hourseType) throws Exception {
    	hourseTypeMapper.addHourseType(hourseType);
    }

    /*按照查询条件分页查询房屋类别记录*/
    public ArrayList<HourseType> queryHourseType(int currentPage) throws Exception { 
     	String where = "where 1=1";
    	int startIndex = (currentPage-1) * this.rows;
    	return hourseTypeMapper.queryHourseType(where, startIndex, this.rows);
    }

    /*按照查询条件查询所有记录*/
    public ArrayList<HourseType> queryHourseType() throws Exception  { 
     	String where = "where 1=1";
    	return hourseTypeMapper.queryHourseTypeList(where);
    }

    /*查询所有房屋类别记录*/
    public ArrayList<HourseType> queryAllHourseType()  throws Exception {
        return hourseTypeMapper.queryHourseTypeList("where 1=1");
    }

    /*当前查询条件下计算总的页数和记录数*/
    public void queryTotalPageAndRecordNumber() throws Exception {
     	String where = "where 1=1";
        recordNumber = hourseTypeMapper.queryHourseTypeCount(where);
        int mod = recordNumber % this.rows;
        totalPage = recordNumber / this.rows;
        if(mod != 0) totalPage++;
    }

    /*根据主键获取房屋类别记录*/
    public HourseType getHourseType(int typeId) throws Exception  {
        HourseType hourseType = hourseTypeMapper.getHourseType(typeId);
        return hourseType;
    }

    /*更新房屋类别记录*/
    public void updateHourseType(HourseType hourseType) throws Exception {
        hourseTypeMapper.updateHourseType(hourseType);
    }

    /*删除一条房屋类别记录*/
    public void deleteHourseType (int typeId) throws Exception {
        hourseTypeMapper.deleteHourseType(typeId);
    }

    /*删除多条房屋类别信息*/
    public int deleteHourseTypes (String typeIds) throws Exception {
    	String _typeIds[] = typeIds.split(",");
    	for(String _typeId: _typeIds) {
    		hourseTypeMapper.deleteHourseType(Integer.parseInt(_typeId));
    	}
    	return _typeIds.length;
    }
}
