<div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="${wwwroot}/admin/flowuser/list" method="post">
        <input type="hidden" name="pageSize" value="">
        <input type="hidden" name="pageCurrent" value="">
        <input type="hidden" name="orderField" value="">
        <input type="hidden" name="orderDirection" value="">
        <div class="bjui-searchBar">
			<label>流程ID：</label><input type="text" id="flowId" name="flowId" value="${(flowUser.flowId)!}"  class="form-control" size="10">&nbsp;				    			
			<label>流程步骤ID：</label><input type="text" id="stepId" name="stepId" value="${(flowUser.stepId)!}"  class="form-control" size="10">&nbsp;				    			
			<label>用户ID：</label><input type="text" id="userId" name="userId" value="${(flowUser.userId)!}"  class="form-control" size="10">&nbsp;				    			
			<label>用户真名：</label><input type="text" id="realName" name="realName" value="${(flowUser.realName)!}"  class="form-control" size="10">&nbsp;				    			
            <button type="submit" class="btn-default" data-icon="search">查询</button>&nbsp;
            <a class="btn btn-orange" href="javascript:;" onclick="$(this).navtab('reloadForm', true);" data-icon="undo">清空查询</a>
        </div>
    </form>
</div>
<div class="bjui-pageContent">
    <div class="bjui-headBar">
        <ul>
            <li class="left"><button type="button" class="btn-green" data-url="${wwwroot}/admin/flowuser/add" data-toggle="navtab" data-id="form" data-icon="plus">新增</button></li>
            <li class="left"><button type="button" class="btn-red" data-url="${wwwroot}/admin/flowuser/delete?ids={#bjui-selected}" data-toggle="doajax" data-confirm-msg="确定要删除选中项吗？" data-icon="remove">删除选中行</button></li>
        </ul>
    </div>
    <table data-toggle="tablefixed" data-width="100%" data-layout-h="0" data-nowrap="true" data-selected-multi="true">
        <thead>
            <tr>
				<th width="30">No.</th>                
    				<th data-order-direction="" data-order-field="flowId">流程ID</th>               
    				<th data-order-direction="" data-order-field="stepId">流程步骤ID</th>               
    				<th data-order-direction="" data-order-field="userId">用户ID</th>               
    				<th data-order-direction="" data-order-field="realName">用户真名</th>               
    				<th data-order-direction="" data-order-field="createDate">创建日期</th>               
    				<th data-order-direction="" data-order-field="updateDate">更新日期</th>               
                <th width="100">操作</th>
            </tr>
        </thead>
        <tbody>
	        
	        <#list pageCtx.rows as row>
	        	<tr data-id="${(row.id)!}">
					<td>${(row_index+1)!}</td>	        	
					<td>${(row.flowId)!}</td>	    			
					<td>${(row.stepId)!}</td>	    			
					<td>${(row.userId)!}</td>	    			
					<td>${(row.realName)!}</td>	    			
					<td>${(row.createDate?string('yyyy-MM-dd HH:mm:ss'))!}</td>	    			
					<td>${(row.updateDate?string('yyyy-MM-dd HH:mm:ss'))!}</td>		    			
	                <td>
	                    <a href="${wwwroot}/admin/flowuser/edit?id=${(row.id)!}" class="btn btn-blue" data-toggle="navtab" data-id="form" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？" data-title="编辑">编辑</a>
	                    <a href="${wwwroot}/admin/flowuser/delete?ids=${(row.id)!}" class="btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？">删</a>
	                </td>	        	
	        	</tr>
			</#list>	        	
        </tbody>
    </table>  
 	<@p.pagination pageCtx=pageCtx pageParam=pageParam/>
</div>