package com.user.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Example;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.junit.Test;

import com.entity.Feedback;
import com.entity.Users;
/**
 * �û�DAO��ʵ����
 * 
 * */
public class UserDaoImpl implements UserDao {
	//��������sessionFactory;
	//���ڽ���LocalSessionFactoryBean��ʵ��sessionFactory��ע��
	SessionFactory sessionFactory;	
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	//��֤�û����Ƿ��ظ�
	@Override
	public List<Users> getAccount( ) {
		Criteria c=this.getSession().createCriteria(Users.class);		
		return c.list();
	}
	
	//����˻�
//	@Override
//	public boolean addAccount(Users user) {
//		getSession().save(user);
//		return true;
//	}
	
	//����������ѯ������Ϣ
/*	@Override
	public List searchUserinfo(Users user) {
		Criteria c=this.getSession().createCriteria(Users.class);
		if(user.getUserName()!=null &&!"".equals(user.getUserName())){
		c.add(Restrictions.like("userName",user.getUserName(),MatchMode.ANYWHERE));
		}
		c.addOrder(Order.asc("userId"));
		return c.list();
	}*/
	
	//��Ӹ�����Ϣ
	@Override
	public void  addUser(Users user) {
		getSession().save(user);
		
	}
	//�û���¼
	@Override
	public Users loginUser(Users u) {
		    List<Users> list=null;
		   // System.out.println("UserDaoImpl");
		    Session session=sessionFactory.getCurrentSession();//ͨ��sessionFactory��ȡSession
			Criteria c=session.createCriteria(Users.class);//����Criteria����
			Example example=Example.create(u);//ʹ��Example�����ഴ��ʾ������
			c.add(example);//ΪCriteria����ָ��ʾ������example��Ϊ��ѯ����
			list=c.list();
			if(list.size()>0){
				return list.get(0);
			}else{
				return null;
			}	
	}
	
	//ͨ��id�����û�
	@Override
	public Users findById(int userId) {
		System.out.println("dao"+userId);
		 Users user= (Users)this.getSession().get(Users.class, userId); 
		 return user;
	}
	
	//�����û�
	@Override
	public void updateUser(Users user) {
		getSession().update(user);
	}
	//ɾ����Ʒ
	@Override
	public void deleteUsers(Users user) {
		this.getSession().delete(user);
		//return true;
	}
	//��ֵ
	@Override
	public void addMoney(Users user) {
		// TODO �Զ����ɵķ������
		this.getSession().update(user);
	
	}
	//��ѯ���
//	@Override
//	public Double selectMoney(int userId) {
//		String hql="from Users where userId="+userId+"";
//		Query query=getSession().createQuery(hql);
//		Users user=(Users)query.uniqueResult();
//		return user.getUserWallet();
//	}
	
	//��ӷ�����Ϣ
	@Override
	public void addFeedbackInfo(Feedback feedback) {
		getSession().saveOrUpdate(feedback);
		
	}
	
	//��Ϣ����
	@Override
	public Feedback getFeedbackInfo(int feedbackId) {
		Feedback feedback=(Feedback)this.getSession().get(Feedback.class, feedbackId); 
		return feedback;
	}
	@Override
	public int findMaxId() {
		// TODO �Զ����ɵķ������
		
		String hql="select max(userId) from Users";
		Query query = getSession().createQuery(hql);
		return (int) query.list().get(0);
	}

	



}
