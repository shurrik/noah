
package com.eden.noah.service;
import com.eden.common.service.IBaseService;
import com.eden.common.service.IPageService;
import com.eden.noah.dao.IHostDAO;
import com.eden.noah.model.Host;
public interface IHostService extends IBaseService<IHostDAO,Host>,IPageService<IHostDAO,Host>{

}