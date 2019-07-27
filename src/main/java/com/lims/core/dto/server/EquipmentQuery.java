package com.lims.core.dto.server;

import com.lims.core.dto.BaseQuery;

public class EquipmentQuery extends BaseQuery {

	private String type;

	private String version;
	
	private String search;
	
	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getVersion() {
		return version;
	}

	public void setVersion(String version) {
		this.version = version;
	}

}
