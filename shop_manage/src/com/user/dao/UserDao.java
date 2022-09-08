package com.user.dao;

import java.util.List;

import com.entity.Feedback;
import com.entity.Users;


/**
 * 
 * 用户DAO接口
 * 
 * */
public interface UserDao {
	//验证用户名是否重复
	public List<Users> getAccount();
	
	//添加账户
//	public boolean addAccount(Users user);
	
//	//根据条件查询个人信息
//	public List searchUserinfo(Users user);
	
	//添加个人信息
	void addUser(Users user);
	
	//登录
	public Users loginUser(Users u);
	
	//根据用户id查询用户信息
	Users findById(int userId);
	
	//更新用户信息
	void updateUser(Users user);
	
	//用户注销
	public void deleteUsers(Users user);
		
	//存款
	public void addMoney(Users user);
	
	//显示余额
//	public Double selectMoney(int userId);
	
	//添加反馈信息
	public void addFeedbackInfo(Feedback feedback);
	
	//信息反馈
	public Feedback getFeedbackInfo(int feedbackId);
	
	//获取最大id
	public int findMaxId();
	
}
