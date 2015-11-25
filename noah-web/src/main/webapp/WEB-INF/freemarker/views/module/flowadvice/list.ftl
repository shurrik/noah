<div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="${wwwroot}/admin/flowadvice/list" method="post">
        <input type="hidden" name="pageSize" value="">
        <input type="hidden" name="pageCurrent" value="">
        <input type="hidden" name="orderField" value="">
        <input type="hidden" name="orderDirection" value="">
        <div class="bjui-searchBar">
			<label>文单ID：</label><input type="text" id="docId" name="docId" value="${(flowAdvice.docId)!}"  class="form-control" size="10">&nbsp;				    			
			<label>意见：</label><input type="text" id="advice" name="advice" value="${(flowAdvice.advice)!}"  class="form-control" size="10">&nbsp;				    			
			<label>用户ID：</label><input type="text" id="userId" name="userId" value="${(flowAdvice.userId)!}"  class="form-control" size="10">&nbsp;				    			
			<label>姓名：</label><input type="text" id="realName" name="realName" value="${(flowAdvice.realName)!}"  class="form-control" size="10">&nbsp;				    			
			<label>状态：</label><input type="text" id="status" name="status" value="${(flowAdvice.status)!}"  class="form-control" size="10">&nbsp;				    			
			<label>创建日期：</label><input type="text" id="createDate" name="createDate" value="${(flowAdvice.createDate)!}"  class="form-control" size="10">&nbsp;				    			
			<label>更新日期：</label><input type="text" id="updateDate" name="updateDate" value="${(flowAdvice.updateDate)!}"  class="form-control" size="10">&nbsp;				    			
            <button type="submit" class="btn-default" data-icon="search">查询</button>&nbsp;
            <a class="btn btn-orange" href="javascript:;" onclick="$(this).navtab('reloadForm', true);" data-icon="undo">清空查询</a>
        </div>
    </form>
</div>
<div class="bjui-pageContent">
    <div class="bjui-headBar">
        <ul>
            <li class="left"><button type="button" class="btn-green" data-url="${wwwroot}/admin/flowadvice/add" data-toggle="navtab" data-id="form" data-icon="plus">新增</button></li>
            <li class="left"><button type="button" class="btn-red" data-url="${wwwroot}/admin/flowadvice/delete?ids={#bjui-selected}" data-toggle="doajax" data-confirm-msg="确定要删除选中项吗？" data-icon="remove">删除选中行</button></li>
        </ul>
    </div>
    <table data-toggle="tablefixed" data-width="100%" data-layout-h="0" data-nowrap="true" data-selected-multi="true">
        <thead>
            <tr>
				<th width="30">No.</th>                
    				<th data-order-direction="" data-order-field="docId">文单ID</th>               
    				<th data-order-direction="" data-order-field="advice">意见</th>               
    				<th data-order-direction="" data-order-field="userId">用户ID</th>               
    				<th data-order-direction="" data-order-field="realName">姓名</th>               
    				<th data-order-direction="" data-order-field="status">状态</th>               
    				<th data-order-direction="" data-order-field="createDate">创建日期</th>               
                <th width="100">操作</th>
            </tr>
        </thead>
        <tbody>
	        
	        <#list pageCtx.rows as row>
	        	<tr data-id="${(row.id)!}">
					<td>${(row_index+1)!}</td>	        	
					<td>${(row.docId)!}</td>	    			
					<td>${(row.advice)!}</td>	    			
					<td>${(row.userId)!}</td>	    			
					<td>${(row.realName)!}</td>	    			
					<td>${(row.status)!}</td>	    			
					<td>${(row.createDate?string('yyyy-MM-dd HH:mm:ss'))!}</td>	    			
	                <td>
	                    <a href="${wwwroot}/admin/flowadvice/edit?id=${(row.id)!}" class="btn btn-blue" data-toggle="navtab" data-id="form" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？" data-title="编辑">编辑</a>
	                    <a href="${wwwroot}/admin/flowadvice/delete?ids=${(row.id)!}" class="btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？">删</a>
	                </td>	        	
	        	</tr>
			</#list>	        	
        </tbody>
    </table>  
 	<@p.pagination pageCtx=pageCtx pageParam=pageParam/>
</div>