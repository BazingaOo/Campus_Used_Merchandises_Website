package com.entity;

import java.util.HashSet;
import java.util.Set;

/**
 * Users entity. @author MyEclipse Persistence Tools
 */

public class Users implements java.io.Serializable {

	// Fields

	private Integer userId;
	private String userName;
	private String userPassword;
	private String userSchool;
	private String userImage;
	private Double userWallet;
	private String userPhone;
	private String userConsignee;
	private String userAdress;
	private String userCode;
	private Set feedbacks = new HashSet(0);
	// Constructors

	/** default constructor */
	public Users() {
	}

	/** minimal constructor */
	public Users(String userName, String userPassword, String userSchool) {
		this.userName = userName;
		this.userPassword = userPassword;
		this.userSchool = userSchool;
	}

	/** full constructor */
	public Users(String userName, String userPassword, String userSchool, String userImage, Double userWallet,
			String userPhone, String userConsignee, String userAdress, String userCode, Set greatforms,
			Set storeconcerns, Set shoppingcarts, Set evaluateforms, Set goodses, Set messages, Set orderforms,
			Set goodcollections, Set refurdforms, Set goodstores,Set feedbacks) {
		this.userName = userName;
		this.userPassword = userPassword;
		this.userSchool = userSchool;
		this.userImage = userImage;
		this.userWallet = userWallet;
		this.userPhone = userPhone;
		this.userConsignee = userConsignee;
		this.userAdress = userAdress;
		this.userCode = userCode;
		this.feedbacks = feedbacks;
		
	}

	// Property accessors

	
	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return this.userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPassword() {
		return this.userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public String getUserSchool() {
		return this.userSchool;
	}

	public void setUserSchool(String userSchool) {
		this.userSchool = userSchool;
	}

	public String getUserImage() {
		return this.userImage;
	}

	public void setUserImage(String userImage) {
		this.userImage = userImage;
	}

	public Double getUserWallet() {
		return this.userWallet;
	}

	public void setUserWallet(Double userWallet) {
		this.userWallet = userWallet;
	}

	public String getUserPhone() {
		return this.userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public String getUserConsignee() {
		return this.userConsignee;
	}

	public void setUserConsignee(String userConsignee) {
		this.userConsignee = userConsignee;
	}

	public String getUserAdress() {
		return this.userAdress;
	}

	public void setUserAdress(String userAdress) {
		this.userAdress = userAdress;
	}

	public String getUserCode() {
		return this.userCode;
	}

	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}


	public Set getFeedbacks() {
		return feedbacks;
	}

	public void setFeedbacks(Set feedbacks) {
		this.feedbacks = feedbacks;
	}

	@Override
	public String toString() {
		return "Users [userId=" + userId + ", userName=" + userName + ", userPassword=" + userPassword + ", userSchool="
				+ userSchool + ", userImage=" + userImage + ", userWallet=" + userWallet + ", userPhone=" + userPhone
				+ ", userConsignee=" + userConsignee + ", userAdress=" + userAdress + ", userCode=" + userCode
				+ ", feedbacks=" + feedbacks + "]";
	}
	
	

}