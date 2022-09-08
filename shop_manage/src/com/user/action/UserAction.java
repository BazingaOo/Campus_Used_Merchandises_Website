package com.user.action;
import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.chainsaw.Main;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;
import org.junit.Test;

import com.entity.Feedback;
import com.entity.Users;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.user.service.UserService;

import javax.servlet.http.HttpServletRequest;

public class UserAction extends ActionSupport{
	private String userName;
	private String userPassword;
	private String userSchool;
	private String userImage;
	private Double userWallet;
	private String userPhone;
	private String userConsignee;
	private String userAdress;
	private String userCode;
	private Integer userId;
	private Integer feedbackId;
	private Users users;
	private String information;
	private Timestamp date;
	//ע��Service����
	private UserService userService;
	private Integer finduserid;
	private String uploadContentType;
	private String uploadFileName;
	private File upload;
	Map<String,Object> request=new HashMap<>();
	Map<String,Object> session;
	
	
	public String getUploadContentType() {
		return uploadContentType;
	}

	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	public String getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public File getUpload() {
		return upload;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public UserService getUserService() {
		return userService;
	}

	public Integer getFinduserid() {
		return finduserid;
	}

	public void setFinduserid(Integer finduserid) {
		this.finduserid = finduserid;
	}
	
	public String getUserSchool() {
		return userSchool;
	}

	public void setUserSchool(String userSchool) {
		this.userSchool = userSchool;
	}

	public String getUserImage() {
		return userImage;
	}

	public void setUserImage(String userImage) {
		this.userImage = userImage;
	}

	public Double getUserWallet() {
		return userWallet;
	}

	public void setUserWallet(Double userWallet) {
		this.userWallet = userWallet;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getUserConsignee() {
		return userConsignee;
	}

	public void setUserConsignee(String userConsignee) {
		this.userConsignee = userConsignee;
	}

	public String getUserAdress() {
		return userAdress;
	}

	public void setUserAdress(String userAdress) {
		this.userAdress = userAdress;
	}

	public String getUserCode() {
		return userCode;
	}

	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}

	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	
	
	public Integer getFeedbackId() {
		return feedbackId;
	}

	public void setFeedbackId(Integer feedbackId) {
		this.feedbackId = feedbackId;
	}

	public Users getUsers() {
		return users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

	public String getInformation() {
		return information;
	}

	public void setInformation(String information) {
		this.information = information;
	}

	public Timestamp getDate() {
		return date;
	}

	public void setDate(Timestamp date) {
		this.date = date;
	}

//	//��֤�û����Ƿ��ظ�
//	public void validateRegiste(){
//		Users user=new Users();
//		if(userService.getAccount(user.getUserName())!=null){
//			request.put("message","�û����Ѿ�����");
//		}
//	}
//	
	
	//ע��
	public String registe() throws IOException{
		Users user=new Users();
		List<Users> userList=userService.getAccount();
		for(int i=0;i<userList.size();i++){
			Users user1 = userList.get(i);
			if(user1.getUserName().equals(userName)){
				System.out.println("�û����Ѿ�����"+userName);
				request.put("registeFail","�û����Ѿ�����");
				return"registeFail";
			}
		}
    	System.out.println("userName..login:"+userName);
		System.out.println("uploadFileName:"+uploadFileName);
		System.out.println("upload:"+upload);
		String path=ServletActionContext.getServletContext().getRealPath("/images");
		File filepath=new File(path);
		String filename=System.currentTimeMillis()+uploadFileName;
		System.out.println("filename:"+filename);
		FileUtils.copyFile(upload, new File(filepath,filename));
		int userId=userService.findMaxId()+1;
		user.setUserId(userId);
		user.setUserName(userName);
		user.setUserPassword(userPassword);
		user.setUserAdress(userAdress);
		user.setUserCode(userCode);
		user.setUserConsignee(userConsignee);
		user.setUserImage("\\"+filename);
		user.setUserWallet(0.00);
		user.setUserPhone(userPhone);
		user.setUserSchool(userSchool);
		userService.addUser(user);
		System.out.println("signup...userName:"+userName);
		System.out.println("�û�������ʹ��");
		request.put("registeSuccess","��ӳɹ�");
		return "registeSuccess";}
		
	
	//�û��ĵ�¼
	public String login(){
		Users user=new Users();
		user.setUserName(userName);
		user.setUserPassword(userPassword);
		System.out.println("login...userName:"+userName);
		Users existuser=userService.login(user);
		System.out.println(existuser);
		if(existuser==null){
			System.out.println("��¼ʧ��");
			request.put(ERROR,"����");
			//this.addActionError("�û������ڣ�");
			ActionContext.getContext().getSession().put("loginuser", existuser);
			return ERROR;
		}else{
			System.out.println("��¼�ɹ�");
			ActionContext.getContext().getSession().put("loginuser", existuser);
			//ActionContext.getContext().put("loginuser", existuser);
			
			return SUCCESS;
		}
	}
	//��ǰ�˵õ�finduserid֮���ѯ���û���Ϣ
	public String findUser(){
		System.out.println("ua.finduser..60:finduserid"+finduserid);
		//int userid = Integer.parseInt(finduserid);//stringת��Ϊint
		Users finduser=userService.findById(finduserid);
		ActionContext.getContext().getSession().put("loginuser", finduser);
		return "findusersuccess";
	}
    public String update() throws IOException{   	
		System.out.println("uploadFileName:"+uploadFileName);
		System.out.println("upload:"+upload);
		String path=ServletActionContext.getServletContext().getRealPath("/images");
		System.out.println("path:"+path);
		File filepath=new File(path);
		String filename=System.currentTimeMillis()+uploadFileName;
		System.out.println("filename:"+filename);
		FileUtils.copyFile(upload, new File(filepath,filename));
		Users u=new Users();
		u.setUserId(finduserid);
		//u.setUserName(userName);
		u.setUserPassword(userPassword);
	    u.setUserImage("\\"+filename);
		u.setUserAdress(userAdress);
		u.setUserCode(userCode);
		u.setUserConsignee(userConsignee);
		u.setUserPhone(userPhone);
		u.setUserSchool(userSchool);
		//u.setUserWallet(userWallet);
		System.out.println(path+"\\"+filename);	
		userService.updateUser(u);
		u=userService.findById(finduserid);
		ActionContext.getContext().getSession().put("loginuser", u);
    	return "updatesuccess";
    }

    //ɾ���ʻ�
    public String deleteUser(){
    	//����ҵ�񷽷���ɾ���˻���ͬʱ����ɾ��
    	userService.deleteUsers(finduserid);
    	return "deleteUser";
    }

    //��ֵ
    public String addMoney(){
    	System.out.println(userService.findById(finduserid));
    	Users user =userService.findById(finduserid);
    	
    	if(userWallet==null){
    		userWallet=0.00;
    	}
    	double a = user.getUserWallet()+Double.valueOf(userWallet);
    	System.out.println("��ֵ��� "+Double.valueOf(userWallet));
    	System.out.println("�ܶ� "+a);
    	user.setUserWallet(a);
    	userService.addMoney(user);
    	ActionContext.getContext().getSession().put("loginuser", user);
    	return "addMoneySuccess";
    }
    //��ӷ�����Ϣ
    public String addFeedbackInfo()throws IOException{
    	Feedback feedback =new Feedback();
    	feedback.setInformation(information);
    	feedback.setDate(new Date());
    	feedback.setUsers(userService.findById(finduserid));
    	userService.addFeedbackInfo(feedback);
		return "addFeedbackInfosuccess";}
    //��ȡ������Ϣ
    public String getFeedbackInfo()throws IOException{
    	Feedback feedback =userService.getFeedbackInfo(feedbackId);
    	request.put("feedbackinfo", information);
    	
		return "admin_index";
    	
    }
//    @Test
//    public void test(){
//    	Users user=new Users();
//    	//����ҵ�񷽷������û���������˻�
//    	
//    	userService.deleteUsers(user.getUserId());
    	//����ҵ�񷽷��������Ϣ
    ///	user=userService.getAccount(user.getUserName());
//    	user.setUserId(1);
//    	user.setUserName("111");
//    	user.setUserPassword("111");
//    	user.setUserAdress("");
//    	user.setUserCode("");
//    	user.setUserConsignee("");
//    	user.setUserImage("");
//    	user.setUserPhone("");
//    	user.setUserSchool("");
//    	user.setUserWallet(12.0);
//    	userService.updateUser(user);
//    	    	
 //   }
}
