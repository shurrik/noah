
package com.eden.noah.service;
import com.eden.common.service.IBaseService;
import com.eden.common.service.IPageService;
import com.eden.noah.dao.ICommandDAO;
import com.eden.noah.model.Command;
public interface ICommandService extends IBaseService<ICommandDAO,Command>,IPageService<ICommandDAO,Command>{

}