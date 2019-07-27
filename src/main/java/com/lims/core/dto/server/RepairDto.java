package com.lims.core.dto.server;

public class RepairDto {
	
	   private Integer repairId;
	  
	    private Integer numberId;
	
	    private Integer equipmentId;

	    private String problem;

	    private String repairStatus;
	    
	    private String location;

	    private String roomId;

		public Integer getNumberId() {
			return numberId;
		}

		public void setNumberId(Integer numberId) {
			this.numberId = numberId;
		}

		public String getProblem() {
			return problem;
		}

		public void setProblem(String problem) {
			this.problem = problem;
		}

		public String getRepairStatus() {
			return repairStatus;
		}

		public void setRepairStatus(String repairStatus) {
			this.repairStatus = repairStatus;
		}

		public Integer getEquipmentId() {
			return equipmentId;
		}

		public void setEquipmentId(Integer equipmentId) {
			this.equipmentId = equipmentId;
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

		public Integer getRepairId() {
			return repairId;
		}

		public void setRepairId(Integer repairId) {
			this.repairId = repairId;
		}
		
}
