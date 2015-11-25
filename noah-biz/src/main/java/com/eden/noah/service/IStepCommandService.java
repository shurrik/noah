
package com.eden.noah.service;
import com.eden.common.service.IBaseService;
import com.eden.common.service.IPageService;
import com.eden.noah.dao.IStepCommandDAO;
import com.eden.noah.model.StepCommand;
public interface IStepCommandService extends IBaseService<IStepCommandDAO,StepCommand>,IPageService<IStepCommandDAO,StepCommand>{

}