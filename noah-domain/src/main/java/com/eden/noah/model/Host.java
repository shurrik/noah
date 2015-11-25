package com.eden.noah.model;
import com.eden.common.domain.BaseDomain;
import java.math.BigDecimal;
import java.util.Date;

public class Host extends BaseDomain{
	private String ip; //IP
	private String name; //主机名
	private String user; //用户
	private String password; //密码
	private String remark; //备注
	private Boolean taskerFlag; //是否执行节点
	private String createrId; //创建人ID
	private String createrName; //创建人名
	private String updaterId; //更新人ID
	private String updaterName; //更新人名
	private Date createDate; //创建时间
	private Date updateDate; //更新时间

	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public Boolean getTaskerFlag() {
		return taskerFlag;
	}
	public void setTaskerFlag(Boolean taskerFlag) {
		this.taskerFlag = taskerFlag;
	}
	public String getCreaterId() {
		return createrId;
	}
	public void setCreaterId(String createrId) {
		this.createrId = createrId;
	}
	public String getCreaterName() {
		return createrName;
	}
	public void setCreaterName(String createrName) {
		this.createrName = createrName;
	}
	public String getUpdaterId() {
		return updaterId;
	}
	public void setUpdaterId(String updaterId) {
		this.updaterId = updaterId;
	}
	public String getUpdaterName() {
		return updaterName;
	}
	public void setUpdaterName(String updaterName) {
		this.updaterName = updaterName;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	
}
