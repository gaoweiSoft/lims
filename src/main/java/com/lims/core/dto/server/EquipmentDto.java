package com.lims.core.dto.server;

public class EquipmentDto {
 
	private Integer eId;
	
	private Integer numberId;
	
	private Integer equipmentId;

	private String manufacturer;

	private String type;

	private String time;

	private String status;

	private Integer laboratoryId;

	private String version;
	
	private String location;

	private String roomId;

	public Integer getNumberId() {
		return numberId;
	}

	public void setNumberId(Integer numberId) {
		this.numberId = numberId;
	}

	public Integer getEquipmentId() {
		return equipmentId;
	}

	public void setEquipmentId(Integer equipmentId) {
		this.equipmentId = equipmentId;
	}

	public String getManufacturer() {
		return manufacturer;
	}

	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}

	public String getType() {
		return type;
	}

	public void setType(String string) {
		this.type = string;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String string) {
		this.status = string;
	}

	public Integer getLaboratoryId() {
		return laboratoryId;
	}

	public void setLaboratoryId(Integer laboratoryId) {
		this.laboratoryId = laboratoryId;
	}

	public String getVersion() {
		return version;
	}

	public void setVersion(String version) {
		this.version = version;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getRoomId() {
		return roomId;
	}

	public void setRoomId(String roomId) {
		this.roomId = roomId;
	}

	public Integer geteId() {
		return eId;
	}

	public void seteId(Integer eId) {
		this.eId = eId;
	}

}
