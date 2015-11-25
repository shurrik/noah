
package com.eden.noah.service;
import com.eden.common.service.IBaseService;
import com.eden.common.service.IPageService;
import com.eden.noah.dao.IDatabaseDAO;
import com.eden.noah.model.Database;
public interface IDatabaseService extends IBaseService<IDatabaseDAO,Database>,IPageService<IDatabaseDAO,Database>{

}