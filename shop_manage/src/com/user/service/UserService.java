package com.user.service;

import java.util.List;

import com.entity.Feedback;
import com.entity.Users;

/**
 * 	�û�ҵ���ӿ�
 * 
 * */
public interface UserService {

	
	////��֤�û����Ƿ��ظ�
	public  List getAccount();
	
	//����˻�
//	public boolean addAccount(Users user);
	
	//����������ѯ������Ϣ
//	public List searchUserinfo(Users user);
	
	//��Ӹ�����Ϣ
	void addUser(Users user);
	//��¼
	Users login(Users user);
	//ͨ��id����
	Users findById(int userId);
	//�����û���Ϣ
	void  updateUser(Users user);
	//��ֵ
	public void addMoney(Users user);
	//��ʾ���
//	public Double selectMoney(int userId);
	//ע���û�
	public void deleteUsers(int userId);
	//��ӷ�����Ϣ
	public void addFeedbackInfo(Feedback feedback);	
	//��Ϣ����
	public Feedback getFeedbackInfo(int feedbackId);
	//��ȡ���id
	public int findMaxId();
}
