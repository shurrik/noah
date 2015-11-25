<div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="${wwwroot}/admin/factaleader/list" method="post">
        <input type="hidden" name="pageSize" value="">
        <input type="hidden" name="pageCurrent" value="">
        <input type="hidden" name="orderField" value="">
        <input type="hidden" name="orderDirection" value="">
        <div class="bjui-searchBar">
			<label>领导名称：</label><input type="text" id="leadername" name="leadername" value="${(factaleader.leadername)!}"  class="form-control" size="10">&nbsp;				    			
			<label>创建日期：</label><input type="text" id="createDate" name="createDate" value="${(factaleader.createDate)!}"  class="form-control" size="10">&nbsp;				    			
			<label>更新日期：</label><input type="text" id="updateDate" name="updateDate" value="${(factaleader.updateDate)!}"  class="form-control" size="10">&nbsp;				    			
            <button type="submit" class="btn btn-primary" data-icon="search">查询</button>&nbsp;
            <a class="btn btn-warning" href="javascript:;" onclick="$(this).navtab('reloadForm', true);" data-icon="undo">清空查询</a>
        </div>
    </form>
</div>
<div class="bjui-pageContent">
    <div class="bjui-headBar">
        <ul>
            <li class="left"><button type="button" class="btn btn-success" data-url="${wwwroot}/admin/factaleader/add" data-toggle="navtab" data-id="form" data-icon="plus">新增</button></li>
            <li class="left"><button type="button" class="btn btn-danger" data-url="${wwwroot}/admin/factaleader/delete?ids={#bjui-selected}" data-toggle="doajax" data-confirm-msg="确定要删除选中项吗？" data-icon="remove">删除选中行</button></li>
        </ul>
    </div>
    <table data-toggle="tablefixed" data-width="100%" data-layout-h="0" data-nowrap="true" data-selected-multi="true">
        <thead>
            <tr>
				<th width="50">No.</th>                
    			<th data-order-direction="" data-order-field="leadername">领导名称</th>               
    			<th data-order-direction="" data-order-field="createDate">创建日期</th>               
    			<th data-order-direction="" data-order-field="updateDate">更新日期</th>               
                <th width="100">操作</th>
            </tr>
        </thead>
        <tbody>
        <#list pageCtx.rows as row>
        	<tr data-id="${(row.id)!}">
				<td>${(row_index+1)!}</td>	        	
				<td>${(row.leadername)!}</td>	    			
				<td>${(row.createDate?string('yyyy-MM-dd HH:mm:ss'))!}</td>	    			
				<td>${(row.updateDate?string('yyyy-MM-dd HH:mm:ss'))!}</td>	    			
                <td>
                    <a href="${wwwroot}/admin/factaleader/edit?id=${(row.id)!}" class="btn btn-info" data-toggle="navtab" data-id="form" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？" data-title="编辑">编辑</a>
                    <a href="${wwwroot}/admin/factaleader/delete?ids=${(row.id)!}" class="btn btn-danger" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？">删</a>
                </td>	        	
        	</tr>
		</#list>	        	
        </tbody>
    </table>  
 	<@p.pagination pageCtx=pageCtx pageParam=pageParam/>
</div>