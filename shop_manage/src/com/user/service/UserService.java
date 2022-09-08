package com.user.service;

import java.util.List;

import com.entity.Feedback;
import com.entity.Users;

/**
 * 	用户业务层接口
 * 
 * */
public interface UserService {

	
	////验证用户名是否重复
	public  List getAccount();
	
	//添加账户
//	public boolean addAccount(Users user);
	
	//根据条件查询个人信息
//	public List searchUserinfo(Users user);
	
	//添加个人信息
	void addUser(Users user);
	//登录
	Users login(Users user);
	//通过id查找
	Users findById(int userId);
	//更新用户信息
	void  updateUser(Users user);
	//充值
	public void addMoney(Users user);
	//显示余额
//	public Double selectMoney(int userId);
	//注销用户
	public void deleteUsers(int userId);
	//添加反馈信息
	public void addFeedbackInfo(Feedback feedback);	
	//信息反馈
	public Feedback getFeedbackInfo(int feedbackId);
	//获取最大id
	public int findMaxId();
}
