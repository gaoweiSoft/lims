package com.lims.core.dto;

import java.text.SimpleDateFormat;

import com.fasterxml.jackson.databind.ObjectMapper;

public class ResultType {

	/**
     * 定义返回值状态
     */
    private String status;
    /**
     * 返回值数据
     */
    private Object data;
    /**
     * 返回值失败携带提示信息
     */
    private String message;

    /**
     * jackson进行json序列化工具
     */
    private static ObjectMapper objectMapper = new ObjectMapper();
    /**
     * 序列化中的时间格式化
     */
    private static final String DEFAULT_DATE_FORMAT = "yyyy-MM-dd HH:mm:ss";


    public ResultType() { }
    
    public ResultType(String status) { 
    	this.status = status;
    }

    private ResultType(String status, Object data){
        this.status = status;
        this.data = data;
    }
    
    private ResultType(String status, Object data, String message){
        this.status = status;
        this.data = data;
        this.message = message;
    }
    
    
    private ResultType(String status, String message) {
        this.status = status;
        this.message = message;
    }

    /**
     * 返回数据，需要自定义时间格式化
     * @param status 返回值状态
     * @param data 返回的列表数据
     * @param DateFormat 返回的列表需要时间格式化的自定义格式
     * @return JSON字符串
     */
    public static String resultListWithFormat(String status, Object data, String DateFormat, String message) {
        try {
            objectMapper.setDateFormat(new SimpleDateFormat(DateFormat));
            return objectMapper.writeValueAsString(new ResultType(status, data, message));
        } catch (Exception e) {
            return null;
        }
    }

    /**
     * 返回数据，默认时间格式化
     * @param status 返回值状态
     * @param data 返回值列表数据
     * @return JSON字符串
     */
    public static String resultList(String status, Object data, String message) {
        try {
            objectMapper.setDateFormat(new SimpleDateFormat(DEFAULT_DATE_FORMAT));
            return objectMapper.writeValueAsString(new ResultType(status, data, message));
        } catch (Exception e) {
            return null;
        }
    }

    /**
     * 返回成功，返回数据
     * @param data 返回的数据
     * @return JSON字符串
     */
    public static String success(Object data) {
        try {
            objectMapper.setDateFormat(new SimpleDateFormat(DEFAULT_DATE_FORMAT));
            return objectMapper.writeValueAsString(new ResultType("success", data));
        } catch (Exception e) {
            return null;
        }
    }

    /**
     * 返回成功，返回数据并且自定义数据的时间格式化
     * @param data 返回的数据
     * @param DateFormat 时间格式化
     * @return JSON字符串
     */
    public static String success(Object data, String DateFormat) {
        try {
            objectMapper.setDateFormat(new SimpleDateFormat(DateFormat));
            return objectMapper.writeValueAsString(new ResultType("success", data));
        } catch (Exception e) {
            return null;
        }
    }
    
    /**
     * 返回成功，没有参数
     * @return JSON字符串
     */
    public static String success() {
        try {
            return objectMapper.writeValueAsString(new ResultType("success"));
        } catch (Exception e) {
            return null;
        }
    }

    /**
     * 返回失败
     * @param message 返回失败的提示信息
     * @return JSON字符串
     */
    public static String fail(String message) {
        try {
            return objectMapper.writeValueAsString(new ResultType("error", message));
        } catch (Exception e) {
            return null;
        }
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}