
package com.eden.noah.service;
import com.eden.common.service.IBaseService;
import com.eden.common.service.IPageService;
import com.eden.noah.dao.IStepDAO;
import com.eden.noah.model.Step;
public interface IStepService extends IBaseService<IStepDAO,Step>,IPageService<IStepDAO,Step>{

}