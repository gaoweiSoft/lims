package com.lims.core.dto.server;

public class ManagerDto {
	
	private Integer numberId;
	
	 private Integer managerId;

	 private String permission;

	 private String account;

	 private String mPassword;


	public Integer getManagerId() {
		return managerId;
	}

	public void setManagerId(Integer managerId) {
		this.managerId = managerId;
	}

	public String getPermission() {
		return permission;
	}

	public void setPermission(String permission) {
		this.permission = permission;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getmPassword() {
		return mPassword;
	}

	public void setmPassword(String mPassword) {
		this.mPassword = mPassword;
	}

	public Integer getNumberId() {
		return numberId;
	}

	public void setNumberId(Integer numberId) {
		this.numberId = numberId;
	}
}
