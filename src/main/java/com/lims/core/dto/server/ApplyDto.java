package com.lims.core.dto.server;

public class ApplyDto {
	
	    private Integer numberId;
	
	    private Integer applyId;

	    private String dateStart;

	    private String dateEnd;

	    private Integer laboratoryId;

	    private Integer equipmentId;

	    private String aStatus;

	    private String location;

	    private String roomId;
	    
	    private String number;

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

		public Integer getApplyId() {
			return applyId;
		}

		public void setApplyId(Integer applyId) {
			this.applyId = applyId;
		}

		

		public String getDateStart() {
			return dateStart;
		}

		public void setDateStart(String dateStart) {
			this.dateStart = dateStart;
		}

		public String getDateEnd() {
			return dateEnd;
		}

		public void setDateEnd(String dateEnd) {
			this.dateEnd = dateEnd;
		}

		public Integer getLaboratoryId() {
			return laboratoryId;
		}

		public void setLaboratoryId(Integer laboratoryId) {
			this.laboratoryId = laboratoryId;
		}

		public Integer getEquipmentId() {
			return equipmentId;
		}

		public void setEquipmentId(Integer equipmentId) {
			this.equipmentId = equipmentId;
		}

		public String getaStatus() {
			return aStatus;
		}

		public void setaStatus(String aStatus) {
			this.aStatus = aStatus;
		}

		public Integer getNumberId() {
			return numberId;
		}

		public void setNumberId(Integer numberId) {
			this.numberId = numberId;
		}

		public String getNumber() {
			return number;
		}

		public void setNumber(String number) {
			this.number = number;
		}
	    
}
