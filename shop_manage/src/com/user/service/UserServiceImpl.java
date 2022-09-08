package com.user.service;

import java.util.List;

import org.hibernate.engine.spi.Status;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.transaction.annotation.Transactional;

import com.entity.Feedback;
import com.entity.Users;
import com.user.dao.UserDao;

/**
 * 用户业务层实现类
 * 
 * */
public class UserServiceImpl implements UserService{
	private UserDao userDao;
	
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	

	//根据username获取账户
	@Override
	public List getAccount() {
		return userDao.getAccount();
	}
    //添加账户
//	@Override
//	public boolean addAccount(Users user) {
//		return userDao.addAccount(user);
//	}
	//根据条件查询个人信息
//	@Override
//	public List searchUserinfo(Users user) {
//		return userDao.searchUserinfo(user);
//	}
	//添加个人信息
	@Override
	 public void addUser(Users user) {
		// TODO 自动生成的方法存根
		userDao.addUser(user);
	}
	//登录
	@Override
	public Users login(Users user) {
		//System.out.println("UserServiceImp");
		Users existuser=userDao.loginUser(user);
		return existuser;
	}
//通过id查找
	@Override
	public Users findById(int userId) {
		System.out.println(userId);
		Users u=(Users)userDao.findById(userId);
		return u;
	}
//更新用户信息
	@Override
	public void updateUser(Users user) {
		Users u=(Users)userDao.findById(user.getUserId());
		//u.setUserName(user.getUserName());
		u.setUserPassword(user.getUserPassword());
		u.setUserImage(user.getUserImage());
		u.setUserAdress(user.getUserAdress());
		u.setUserCode(user.getUserCode());
		u.setUserConsignee(user.getUserConsignee());
		u.setUserPhone(user.getUserPhone());
		u.setUserSchool(user.getUserSchool());
		//u.setUserWallet(user.getUserWallet());
		userDao.updateUser(u);
	}
	
//用户注销
	@Override
	public void deleteUsers(int userId) {
		System.out.println(userId);
		Users user = (Users)userDao.findById(userId);
		System.out.println(user);
		//删除账户对象，同时执行级联删除
		userDao.deleteUsers(user);
	}
//显示余额
//	@Override
//	public Double selectMoney(int userId)  {
//		
//		return userDao.selectMoney(userId);
//		
//	}
//充值
@Override
public void addMoney(Users user) {
	// TODO 自动生成的方法存根
	Users u=(Users)userDao.findById(user.getUserId());
	u.setUserWallet(user.getUserWallet());
	userDao.addMoney(u);
}
//添加反馈信息
@Override
public void addFeedbackInfo(Feedback feedback) {
	// TODO 自动生成的方法存根
	userDao.addFeedbackInfo(feedback);
}
//信息反馈
@Override
public Feedback getFeedbackInfo(int feedbackId) {
	
	return userDao.getFeedbackInfo(feedbackId);
}


@Override
public int findMaxId() {
	// TODO 自动生成的方法存根
	return userDao.findMaxId();
}

//@Test
//public void test() {
//    ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
//    UserService userService = (UserService) context.getBean("userService");
//
//    Users user = new Users();
//    user.setUserId(3);
//	user.setUserName("111");
//	user.setUserPassword("111");
//	user.setUserAdress("");
//	user.setUserCode("");
//	user.setUserConsignee("");
//	user.setUserImage("");
//	user.setUserPhone("");
//	user.setUserSchool("");
//	user.setUserWallet(12.0);
//
//}





}
