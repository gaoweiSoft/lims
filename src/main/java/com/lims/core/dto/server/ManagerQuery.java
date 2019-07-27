package com.lims.core.dto.server;

import com.lims.core.dto.BaseQuery;

public class ManagerQuery extends BaseQuery {
	
	private String account;

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}
}
