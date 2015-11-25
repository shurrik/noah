package com.eden.noah.action;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eden.noah.util.PageParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.eden.common.domain.view.BizData4Page;
import com.eden.noah.model.User;
import com.eden.noah.service.IUserService;

@Controller
public class UserAction extends AbstractAdminController<IUserService> {

	@Autowired
	private IUserService userService;


	@RequestMapping(value = "/user/list")
	public String list(User user, ModelMap model, PageParam pageParam,
			HttpServletRequest request, HttpServletResponse response) {

		// 获取参数
		Map<String, Object> conditions = getQueryMap(user);
		BizData4Page<User> pageCtx = doPage(model, conditions, pageParam);

		model.addAttribute("user", user);
		return "/module/user/list";
	}


	protected Map getQueryMap(User user) {
		Map<String, Object> conditions = new HashMap();

		conditions.put("userName", user.getUserName());
		conditions.put("realName", user.getRealName());
		conditions.put("password", user.getPassword());
		conditions.put("mobile", user.getMobile());
		conditions.put("email", user.getEmail());
		conditions.put("depId", user.getDepId());
		return conditions;
	}

	@Override
	protected IUserService getMainService() {
		return userService;
	}

	@Override
	protected String getMainObjName() {
		return "user";
	}

	@Override
	protected String getViewTitle() {
		return "user";
	}
}
