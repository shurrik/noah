package com.eden.common.service;

import com.eden.common.dao.IBaseDAO;
import com.eden.common.domain.BaseDomain;

/**
 * 业务主对象DAO注入
 * <p/>
 * 创建时间: 14-9-23 下午2:04<br/>
 *
 * @author lp
 * @since v0.0.1
 */
public interface IDaoAware<D extends IBaseDAO,T extends BaseDomain> {
    public D getDao();
}
