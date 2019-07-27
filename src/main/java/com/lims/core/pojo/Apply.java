package com.lims.core.pojo;

import java.util.Date;

public class Apply {
    private Integer applyId;

    private Date dateStart;

    private Date dateEnd;

    private Integer laboratoryId;

    private Integer equipmentId;

    private Integer aStatus;

    private String number;

    public Integer getApplyId() {
        return applyId;
    }

    public void setApplyId(Integer applyId) {
        this.applyId = applyId;
    }

    public Date getDateStart() {
        return dateStart;
    }

    public void setDateStart(Date dateStart) {
        this.dateStart = dateStart;
    }

    public Date getDateEnd() {
        return dateEnd;
    }

    public void setDateEnd(Date dateEnd) {
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

    public Integer getaStatus() {
        return aStatus;
    }

    public void setaStatus(Integer aStatus) {
        this.aStatus = aStatus;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number == null ? null : number.trim();
    }
}