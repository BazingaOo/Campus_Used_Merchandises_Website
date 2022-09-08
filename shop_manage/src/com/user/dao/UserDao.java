package com.user.dao;

import java.util.List;

import com.entity.Feedback;
import com.entity.Users;


/**
 * 
 * �û�DAO�ӿ�
 * 
 * */
public interface UserDao {
	//��֤�û����Ƿ��ظ�
	public List<Users> getAccount();
	
	//����˻�
//	public boolean addAccount(Users user);
	
//	//����������ѯ������Ϣ
//	public List searchUserinfo(Users user);
	
	//��Ӹ�����Ϣ
	void addUser(Users user);
	
	//��¼
	public Users loginUser(Users u);
	
	//�����û�id��ѯ�û���Ϣ
	Users findById(int userId);
	
	//�����û���Ϣ
	void updateUser(Users user);
	
	//�û�ע��
	public void deleteUsers(Users user);
		
	//���
	public void addMoney(Users user);
	
	//��ʾ���
//	public Double selectMoney(int userId);
	
	//��ӷ�����Ϣ
	public void addFeedbackInfo(Feedback feedback);
	
	//��Ϣ����
	public Feedback getFeedbackInfo(int feedbackId);
	
	//��ȡ���id
	public int findMaxId();
	
}
