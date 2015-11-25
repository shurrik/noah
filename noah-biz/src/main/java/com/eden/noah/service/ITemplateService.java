
package com.eden.noah.service;
import com.eden.common.service.IBaseService;
import com.eden.common.service.IPageService;
import com.eden.noah.dao.ITemplateDAO;
import com.eden.noah.model.Template;
public interface ITemplateService extends IBaseService<ITemplateDAO,Template>,IPageService<ITemplateDAO,Template>{

}