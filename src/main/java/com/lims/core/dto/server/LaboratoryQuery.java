package com.lims.core.dto.server;

import com.lims.core.dto.BaseQuery;

public class LaboratoryQuery extends BaseQuery{
	
	private String location;

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}
	
}
