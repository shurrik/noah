package com.eden.noah.model;
import com.eden.common.domain.BaseDomain;
import java.math.BigDecimal;
import java.util.Date;

public class TemplateStep extends BaseDomain{
	private String tplId; //模板ID
	private String stepId; //步骤ID
	private String createrId; //创建人ID
	private String createrName; //创建人名
	private Date createDate; //创建时间

	public String getTplId() {
		return tplId;
	}
	public void setTplId(String tplId) {
		this.tplId = tplId;
	}
	public String getStepId() {
		return stepId;
	}
	public void setStepId(String stepId) {
		this.stepId = stepId;
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
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	
}
