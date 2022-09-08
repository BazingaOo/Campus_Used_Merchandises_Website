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
 * �û�ҵ���ʵ����
 * 
 * */
public class UserServiceImpl implements UserService{
	private UserDao userDao;
	
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	

	//����username��ȡ�˻�
	@Override
	public List getAccount() {
		return userDao.getAccount();
	}
    //����˻�
//	@Override
//	public boolean addAccount(Users user) {
//		return userDao.addAccount(user);
//	}
	//����������ѯ������Ϣ
//	@Override
//	public List searchUserinfo(Users user) {
//		return userDao.searchUserinfo(user);
//	}
	//��Ӹ�����Ϣ
	@Override
	 public void addUser(Users user) {
		// TODO �Զ����ɵķ������
		userDao.addUser(user);
	}
	//��¼
	@Override
	public Users login(Users user) {
		//System.out.println("UserServiceImp");
		Users existuser=userDao.loginUser(user);
		return existuser;
	}
//ͨ��id����
	@Override
	public Users findById(int userId) {
		System.out.println(userId);
		Users u=(Users)userDao.findById(userId);
		return u;
	}
//�����û���Ϣ
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
	
//�û�ע��
	@Override
	public void deleteUsers(int userId) {
		System.out.println(userId);
		Users user = (Users)userDao.findById(userId);
		System.out.println(user);
		//ɾ���˻�����ͬʱִ�м���ɾ��
		userDao.deleteUsers(user);
	}
//��ʾ���
//	@Override
//	public Double selectMoney(int userId)  {
//		
//		return userDao.selectMoney(userId);
//		
//	}
//��ֵ
@Override
public void addMoney(Users user) {
	// TODO �Զ����ɵķ������
	Users u=(Users)userDao.findById(user.getUserId());
	u.setUserWallet(user.getUserWallet());
	userDao.addMoney(u);
}
//��ӷ�����Ϣ
@Override
public void addFeedbackInfo(Feedback feedback) {
	// TODO �Զ����ɵķ������
	userDao.addFeedbackInfo(feedback);
}
//��Ϣ����
@Override
public Feedback getFeedbackInfo(int feedbackId) {
	
	return userDao.getFeedbackInfo(feedbackId);
}


@Override
public int findMaxId() {
	// TODO �Զ����ɵķ������
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
