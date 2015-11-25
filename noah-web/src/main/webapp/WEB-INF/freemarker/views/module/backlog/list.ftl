<div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="${wwwroot}/admin/backlog/list" method="post">
        <input type="hidden" name="pageSize" value="">
        <input type="hidden" name="pageCurrent" value="">
        <input type="hidden" name="orderField" value="">
        <input type="hidden" name="orderDirection" value="">
        <div class="bjui-searchBar">
			<label>文单ID：</label><input type="text" id="docId" name="docId" value="${(backLog.docId)!}"  class="form-control" size="10">&nbsp;				    			
			<label>主题：</label><input type="text" id="subject" name="subject" value="${(backLog.subject)!}"  class="form-control" size="10">&nbsp;				    			
			<label>备注：</label><input type="text" id="remark" name="remark" value="${(backLog.remark)!}"  class="form-control" size="10">&nbsp;				    			
			<label>流程ID：</label><input type="text" id="flowId" name="flowId" value="${(backLog.flowId)!}"  class="form-control" size="10">&nbsp;				    			
			<label>流程名称：</label><input type="text" id="flowName" name="flowName" value="${(backLog.flowName)!}"  class="form-control" size="10">&nbsp;				    			
			<label>状态：</label><input type="text" id="status" name="status" value="${(backLog.status)!}"  class="form-control" size="10">&nbsp;				    			
			<label>创建日期：</label><input type="text" id="createDate" name="createDate" value="${(backLog.createDate)!}"  class="form-control" size="10">&nbsp;				    			
			<label>更新日期：</label><input type="text" id="updateDate" name="updateDate" value="${(backLog.updateDate)!}"  class="form-control" size="10">&nbsp;				    			
            <button type="submit" class="btn btn-primary" data-icon="search">查询</button>&nbsp;
            <a class="btn btn-warning" href="javascript:;" onclick="$(this).navtab('reloadForm', true);" data-icon="undo">清空查询</a>
        </div>
    </form>
</div>
<div class="bjui-pageContent">
    <div class="bjui-headBar">
        <ul>
            <li class="left"><button type="button" class="btn btn-success" data-url="${wwwroot}/admin/backlog/add" data-toggle="navtab" data-id="form" data-icon="plus">新增</button></li>
            <li class="left"><button type="button" class="btn btn-danger" data-url="${wwwroot}/admin/backlog/delete?ids={#bjui-selected}" data-toggle="doajax" data-confirm-msg="确定要删除选中项吗？" data-icon="remove">删除选中行</button></li>
        </ul>
    </div>
    <table data-toggle="tablefixed" data-width="100%" data-layout-h="0" data-nowrap="true" data-selected-multi="true">
        <thead>
            <tr>
				<th width="30">No.</th>        
			    <th data-order-direction="" data-order-field="flowName">流程名称</th>
				<th data-order-direction="" data-order-field="subject">主题</th>               
				<th data-order-direction="" data-order-field="remark">备注</th>               
				<th data-order-direction="" data-order-field="status">状态</th>               
				<th data-order-direction="" data-order-field="createDate">创建日期</th>               
                <th width="100">操作</th>
            </tr>
        </thead>
        <tbody>
	        
	        <#list pageCtx.rows as row>
	        	<tr data-id="${(row.id)!}">
					<td>${(row_index+1)!}</td>
					<td>${(row.flowName)!}</td>						        	
					<td>${(row.subject)!}</td>	    			
					<td>${(row.remark)!}</td>	    			
					<td>${(row.status)!}</td>	    			
					<td>${(row.createDate?string('yyyy-MM-dd HH:mm:ss'))!}</td>	    			
	                <td>
                        <a href="${wwwroot}/admin/recform/check?id=${(row.id)!}" class="btn btn-info" data-toggle="dialog" data-width="800" data-height="400" data-id="dialog-mask" data-mask="true">办理</a>
                        <#--	                
	                    <a href="${wwwroot}/admin/backlog/edit?id=${(row.id)!}" class="btn btn-blue" data-toggle="navtab" data-id="form" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？" data-title="编辑">编辑</a>
	                    <a href="${wwwroot}/admin/backlog/delete?ids=${(row.id)!}" class="btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？">删</a>
	                    -->
	                </td>	        	
	        	</tr>
			</#list>	        	
        </tbody>
    </table>  
 	<@p.pagination pageCtx=pageCtx pageParam=pageParam/>
</div>