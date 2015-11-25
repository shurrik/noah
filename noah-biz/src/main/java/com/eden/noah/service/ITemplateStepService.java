
package com.eden.noah.service;
import com.eden.common.service.IBaseService;
import com.eden.common.service.IPageService;
import com.eden.noah.dao.ITemplateStepDAO;
import com.eden.noah.model.TemplateStep;
public interface ITemplateStepService extends IBaseService<ITemplateStepDAO,TemplateStep>,IPageService<ITemplateStepDAO,TemplateStep>{

}