package com.lims.core.dto.server;

public class LaboratoryDto {
	
	    private Integer numberId;
	
	    private Integer laboratoryId;

	    private String location;

	    private String roomId;

	    private Integer quantity;


		public Integer getLaboratoryId() {
			return laboratoryId;
		}

		public void setLaboratoryId(Integer laboratoryId) {
			this.laboratoryId = laboratoryId;
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

		public Integer getQuantity() {
			return quantity;
		}

		public void setQuantity(Integer quantity) {
			this.quantity = quantity;
		}

		public Integer getNumberId() {
			return numberId;
		}

		public void setNumberId(Integer numberId) {
			this.numberId = numberId;
		}
}
