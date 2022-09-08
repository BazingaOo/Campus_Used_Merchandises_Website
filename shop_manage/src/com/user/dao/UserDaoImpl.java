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
 * 用户DAO层实现类
 * 
 * */
public class UserDaoImpl implements UserDao {
	//声明属性sessionFactory;
	//用于接受LocalSessionFactoryBean类实例sessionFactory的注入
	SessionFactory sessionFactory;	
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	//验证用户名是否重复
	@Override
	public List<Users> getAccount( ) {
		Criteria c=this.getSession().createCriteria(Users.class);		
		return c.list();
	}
	
	//添加账户
//	@Override
//	public boolean addAccount(Users user) {
//		getSession().save(user);
//		return true;
//	}
	
	//根据条件查询个人信息
/*	@Override
	public List searchUserinfo(Users user) {
		Criteria c=this.getSession().createCriteria(Users.class);
		if(user.getUserName()!=null &&!"".equals(user.getUserName())){
		c.add(Restrictions.like("userName",user.getUserName(),MatchMode.ANYWHERE));
		}
		c.addOrder(Order.asc("userId"));
		return c.list();
	}*/
	
	//添加个人信息
	@Override
	public void  addUser(Users user) {
		getSession().save(user);
		
	}
	//用户登录
	@Override
	public Users loginUser(Users u) {
		    List<Users> list=null;
		   // System.out.println("UserDaoImpl");
		    Session session=sessionFactory.getCurrentSession();//通过sessionFactory获取Session
			Criteria c=session.createCriteria(Users.class);//创建Criteria对象
			Example example=Example.create(u);//使用Example工具类创建示例对象
			c.add(example);//为Criteria对象指定示例对象example作为查询条件
			list=c.list();
			if(list.size()>0){
				return list.get(0);
			}else{
				return null;
			}	
	}
	
	//通过id查找用户
	@Override
	public Users findById(int userId) {
		System.out.println("dao"+userId);
		 Users user= (Users)this.getSession().get(Users.class, userId); 
		 return user;
	}
	
	//更新用户
	@Override
	public void updateUser(Users user) {
		getSession().update(user);
	}
	//删除商品
	@Override
	public void deleteUsers(Users user) {
		this.getSession().delete(user);
		//return true;
	}
	//充值
	@Override
	public void addMoney(Users user) {
		// TODO 自动生成的方法存根
		this.getSession().update(user);
	
	}
	//查询余额
//	@Override
//	public Double selectMoney(int userId) {
//		String hql="from Users where userId="+userId+"";
//		Query query=getSession().createQuery(hql);
//		Users user=(Users)query.uniqueResult();
//		return user.getUserWallet();
//	}
	
	//添加反馈信息
	@Override
	public void addFeedbackInfo(Feedback feedback) {
		getSession().saveOrUpdate(feedback);
		
	}
	
	//信息反馈
	@Override
	public Feedback getFeedbackInfo(int feedbackId) {
		Feedback feedback=(Feedback)this.getSession().get(Feedback.class, feedbackId); 
		return feedback;
	}
	@Override
	public int findMaxId() {
		// TODO 自动生成的方法存根
		
		String hql="select max(userId) from Users";
		Query query = getSession().createQuery(hql);
		return (int) query.list().get(0);
	}

	



}
