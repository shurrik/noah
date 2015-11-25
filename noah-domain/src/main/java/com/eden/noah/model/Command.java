package com.eden.noah.model;
import com.eden.common.domain.BaseDomain;
import java.math.BigDecimal;
import java.util.Date;

public class Command extends BaseDomain{
	private String script; //脚本
	private String createrId; //创建人ID
	private String createrName; //创建人名
	private String updaterId; //更新人ID
	private String updaterName; //更新人名
	private Date createDate; //创建时间
	private Date updateDate; //更新时间

	public String getScript() {
		return script;
	}
	public void setScript(String script) {
		this.script = script;
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
