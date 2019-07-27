package com.lims.manage.service;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.feilong.core.Validator;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lims.core.dto.BootTablePage;
import com.lims.core.dto.server.EquipmentDto;
import com.lims.core.dto.server.EquipmentQuery;
import com.lims.core.mapper.EquipmentMapper;
import com.lims.core.mapper.LaboratoryMapper;
import com.lims.core.pojo.Equipment;
import com.lims.core.pojo.EquipmentExample;
import com.lims.core.pojo.EquipmentExample.Criteria;
import com.lims.core.pojo.Laboratory;
import com.lims.core.pojo.LaboratoryExample;

@Service
public class EquipmentService {
	@Autowired
	private EquipmentMapper equipmentMapper;
	@Autowired
	private LaboratoryMapper laboratoryMapper;

	// 查询列表
	public BootTablePage getEquipmentList(EquipmentQuery equipmentQuery) {
		if (Validator.isNotNullOrEmpty(equipmentQuery));
		int pageNum = equipmentQuery.getOffset() / equipmentQuery.getLimit() + 1;
		BootTablePage bootTablePage = new BootTablePage();
		EquipmentExample equipmentExample = new EquipmentExample();
		Criteria criteria = equipmentExample.createCriteria();
		PageHelper.startPage(pageNum, equipmentQuery.getLimit());
		criteria.andDelFlagEqualTo(0);
		// 查询条件
		if (Validator.isNotNullOrEmpty(equipmentQuery.getType())) {
			criteria.andTypeLike("%" + equipmentQuery.getType()+ "%");
		}
		if (Validator.isNotNullOrEmpty(equipmentQuery.getVersion())) {
			criteria.andVersionEqualTo(equipmentQuery.getVersion());
		}
		
		if (Validator.isNotNullOrEmpty(equipmentQuery.getSearch())){
			String search = equipmentQuery.getSearch();
			equipmentExample.or().andVersionEqualTo(search);
			equipmentExample.or().andTypeEqualTo(search);
		}
		
		Integer numberId = 0;
		List<EquipmentDto> eEquipmentDtoList = new ArrayList<EquipmentDto>();
		List<Equipment> equipmentList = equipmentMapper.selectByExample(equipmentExample);
		for (Equipment list : equipmentList) {
			Laboratory laboratory = laboratoryMapper.selectByPrimaryKey(list.getLaboratoryId());
			numberId++;
			EquipmentDto equipmentDto = new EquipmentDto();
			equipmentDto.seteId(list.geteId());
			equipmentDto.setEquipmentId(list.getEquipmentId());
			equipmentDto.setManufacturer(list.getManufacturer());
			equipmentDto.setType(list.getType());
			if (list.getStatus() == 0) {
				equipmentDto.setStatus("未使用");
			} else {
				equipmentDto.setStatus("使用中");
			}
			equipmentDto.setLocation(laboratory.getLocation());
			equipmentDto.setRoomId(laboratory.getRoomId());
			equipmentDto.setNumberId(numberId);
			eEquipmentDtoList.add(equipmentDto);
		}
		PageInfo<Equipment> pageInfo = new PageInfo<>(equipmentList);
		bootTablePage.setRows(eEquipmentDtoList);
		bootTablePage.setTotal(pageInfo.getTotal());
		return bootTablePage;
	}
	
	// 详情页
	public EquipmentDto viewEquipment(Integer eId) {
		Equipment equipment = equipmentMapper.selectByPrimaryKey(eId);
		Laboratory laboratory = laboratoryMapper.selectByPrimaryKey(equipment.getLaboratoryId());
		EquipmentDto equipmentDto = new EquipmentDto();
		BeanUtils.copyProperties(equipment, equipmentDto);
		String time = (new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(equipment.getTime());
		equipmentDto.setTime(time);
		if (equipment.getStatus() == 0) {
			equipmentDto.setStatus("未使用");
		} else {
			equipmentDto.setStatus("使用中");
		}
		equipmentDto.setLocation(laboratory.getLocation());
		equipmentDto.setRoomId(laboratory.getRoomId());
		return equipmentDto;
	}

	// 根据id获取内容
	public EquipmentDto getEquipment(Integer eId) {
		Equipment equipment = equipmentMapper.selectByPrimaryKey(eId);
		Laboratory laboratory = laboratoryMapper.selectByPrimaryKey(equipment.getLaboratoryId());
		EquipmentDto equipmentDto = new EquipmentDto();
		BeanUtils.copyProperties(equipment, equipmentDto);
		if (equipment.getStatus() == 0) {
			equipmentDto.setStatus("未使用");
		} else {
			equipmentDto.setStatus("使用中");
		}
		equipmentDto.setLocation(laboratory.getLocation());
		equipmentDto.setRoomId(laboratory.getRoomId());
		return equipmentDto;
	}

	public void saveEquipment(EquipmentDto equipmentDto) {
		// 根据实验室位置和房间号查询laboratoryId
		LaboratoryExample laboratoryExample = new LaboratoryExample();
		com.lims.core.pojo.LaboratoryExample.Criteria criteria = laboratoryExample.createCriteria();
		criteria.andLocationEqualTo(equipmentDto.getLocation());
		criteria.andRoomIdEqualTo(equipmentDto.getRoomId());
		List<Laboratory> laboratoryList = laboratoryMapper.selectByExample(laboratoryExample);
		// 编辑
		if (Validator.isNotNullOrEmpty(equipmentDto.geteId())) {
			Equipment equipment = equipmentMapper.selectByPrimaryKey(equipmentDto.geteId());
			BeanUtils.copyProperties(equipmentDto, equipment);
			equipment.setLaboratoryId(laboratoryList.get(0).getLaboratoryId());
			equipmentMapper.updateByPrimaryKey(equipment);
		} else {
			// 新建
			Equipment equipment = new Equipment();
			BeanUtils.copyProperties(equipmentDto, equipment);
			equipment.setDelFlag(0);
			equipment.setStatus(0);
			equipment.setTime(new Date());
			equipment.setLaboratoryId(laboratoryList.get(0).getLaboratoryId());
			// 当增加设备时，实验室内设备数量写入
			Laboratory laboratory = laboratoryMapper.selectByPrimaryKey(laboratoryList.get(0).getLaboratoryId());
			Integer quantity = laboratory.getQuantity();
			laboratory.setQuantity(quantity + 1);
			laboratoryMapper.updateByPrimaryKey(laboratory);
			equipmentMapper.insert(equipment);
		}
	}

	// 删除
	public void deleteEquipment(Integer eId) {
		Equipment equipment = equipmentMapper.selectByPrimaryKey(eId);
		equipment.setDelFlag(1);
		equipmentMapper.updateByPrimaryKey(equipment);
	}
	//不分页列表
	public List<EquipmentDto> getEquipments(String location,String roomId) {		
		LaboratoryExample laboratoryExample=new LaboratoryExample();
		com.lims.core.pojo.LaboratoryExample.Criteria criteriaLaboratory=laboratoryExample.createCriteria();
		criteriaLaboratory.andLocationEqualTo(location);
		criteriaLaboratory.andRoomIdEqualTo(roomId);
		List<Laboratory> laboratoryList=laboratoryMapper.selectByExample(laboratoryExample);
		EquipmentExample equipmentExample = new EquipmentExample();
		Criteria criteria = equipmentExample.createCriteria();		
		criteria.andDelFlagEqualTo(0);
		criteria.andLaboratoryIdEqualTo(laboratoryList.get(0).getLaboratoryId());
		List<EquipmentDto> eEquipmentDtoList = new ArrayList<EquipmentDto>();
		List<Equipment> equipmentList = equipmentMapper.selectByExample(equipmentExample);
		for (Equipment list : equipmentList) {
			Laboratory laboratory = laboratoryMapper.selectByPrimaryKey(list.getLaboratoryId());
			EquipmentDto equipmentDto = new EquipmentDto();
			equipmentDto.setEquipmentId(list.getEquipmentId());
			equipmentDto.setManufacturer(list.getManufacturer());
			equipmentDto.setType(list.getType());
			if (list.getStatus() == 0) {
				equipmentDto.setStatus("未使用");
			} else {
				equipmentDto.setStatus("使用中");
			}
			equipmentDto.setLocation(laboratory.getLocation());
			equipmentDto.setRoomId(laboratory.getRoomId());
			eEquipmentDtoList.add(equipmentDto);
		}
		return eEquipmentDtoList;
	}
	
	//csv上传
	public void saveEquipmentList(MultipartFile equipmentList) throws IOException{
		/*CommonsMultipartFile commonsMultipartFile= (CommonsMultipartFile) equipmentList; 
        DiskFileItem diskFileItem = (DiskFileItem) commonsMultipartFile.getFileItem(); 
        File equipments = diskFileItem.getStoreLocation();	*/
		File equipments = File.createTempFile("tmp", null);
		equipmentList.transferTo(equipments);
		equipments.deleteOnExit();		
        List<String> equipmentDetailList = FileUtils.readLines(equipments, "UTF-8");  
        if (equipmentDetailList != null && equipmentDetailList.size() > 1){        	
        	for (int i=1; i<equipmentDetailList.size(); i++){
        		String[] newEquipmentDetail = equipmentDetailList.get(i).split(",");
            	Equipment equipment = new Equipment();
            	equipment.setEquipmentId(Integer.parseInt(newEquipmentDetail[0]));
            	equipment.setManufacturer(newEquipmentDetail[1]);
            	equipment.setType(newEquipmentDetail[2]);
            	equipment.setLaboratoryId(Integer.parseInt(newEquipmentDetail[3]));
            	equipment.setVersion(newEquipmentDetail[4]);
            	equipment.setTime(new Date());
            	equipment.setStatus(0);
            	equipment.setDelFlag(0);
            	// 当增加设备时，实验室内设备数量写入
    			Laboratory laboratory = laboratoryMapper.selectByPrimaryKey(Integer.parseInt(newEquipmentDetail[3]));
    			Integer quantity = laboratory.getQuantity();
    			laboratory.setQuantity(quantity + 1);
    			laboratoryMapper.updateByPrimaryKey(laboratory);
            	equipmentMapper.insert(equipment);   
        	}
        }      
	}
}
