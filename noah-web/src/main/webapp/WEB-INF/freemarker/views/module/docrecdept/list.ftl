<div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="${wwwroot}/admin/docrecdept/list" method="post">
        <input type="hidden" name="pageSize" value="">
        <input type="hidden" name="pageCurrent" value="">
        <input type="hidden" name="orderField" value="">
        <input type="hidden" name="orderDirection" value="">
        <div class="bjui-searchBar">
			<label>部门ID：</label><input type="text" id="depId" name="depId" value="${(docRecDept.depId)!}"  class="form-control" size="10">&nbsp;				    			
			<label>部门名称：</label><input type="text" id="depName" name="depName" value="${(docRecDept.depName)!}"  class="form-control" size="10">&nbsp;				    			
			<label>公文单ID：</label><input type="text" id="formId" name="formId" value="${(docRecDept.formId)!}"  class="form-control" size="10">&nbsp;				    			
			<label>已阅：</label><input type="text" id="readFlag" name="readFlag" value="${(docRecDept.readFlag)!}"  class="form-control" size="10">&nbsp;				    			
			<label>创建日期：</label><input type="text" id="createDate" name="createDate" value="${(docRecDept.createDate)!}"  class="form-control" size="10">&nbsp;				    			
			<label>更新日期：</label><input type="text" id="updateDate" name="updateDate" value="${(docRecDept.updateDate)!}"  class="form-control" size="10">&nbsp;				    			
            <button type="submit" class="btn-default" data-icon="search">查询</button>&nbsp;
            <a class="btn btn-orange" href="javascript:;" onclick="$(this).navtab('reloadForm', true);" data-icon="undo">清空查询</a>
        </div>
    </form>
</div>
<div class="bjui-pageContent">
    <div class="bjui-headBar">
        <ul>
            <li class="left"><button type="button" class="btn-green" data-url="${wwwroot}/admin/docrecdept/add" data-toggle="navtab" data-id="form" data-icon="plus">新增</button></li>
            <li class="left"><button type="button" class="btn-red" data-url="${wwwroot}/admin/docrecdept/delete?ids={#bjui-selected}" data-toggle="doajax" data-confirm-msg="确定要删除选中项吗？" data-icon="remove">删除选中行</button></li>
        </ul>
    </div>
    <table data-toggle="tablefixed" data-width="100%" data-layout-h="0" data-nowrap="true" data-selected-multi="true">
        <thead>
            <tr>
				<th width="30">No.</th>                
    				<th data-order-direction="" data-order-field="depId">部门ID</th>               
    				<th data-order-direction="" data-order-field="depName">部门名称</th>               
    				<th data-order-direction="" data-order-field="formId">公文单ID</th>               
    				<th data-order-direction="" data-order-field="readFlag">已阅</th>               
    				<th data-order-direction="" data-order-field="createDate">创建日期</th>               
    				<th data-order-direction="" data-order-field="updateDate">更新日期</th>               
                <th width="100">操作</th>
            </tr>
        </thead>
        <tbody>
	        
	        <#list pageCtx.rows as row>
	        	<tr data-id="${(row.id)!}">
					<td>${(row_index+1)!}</td>	        	
					<td>${(row.depId)!}</td>	    			
					<td>${(row.depName)!}</td>	    			
					<td>${(row.formId)!}</td>	    			
					<td>${(row.readFlag)!}</td>	    			
					<td>${(row.createDate)!}</td>	    			
					<td>${(row.updateDate)!}</td>	    			
	                <td>
	                    <a href="${wwwroot}/admin/docrecdept/edit?id=${(row.id)!}" class="btn btn-blue" data-toggle="navtab" data-id="form" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？" data-title="编辑">编辑</a>
	                    <a href="${wwwroot}/admin/docrecdept/delete?ids=${(row.id)!}" class="btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？">删</a>
	                </td>	        	
	        	</tr>
			</#list>	        	
        </tbody>
    </table>  
 	<@p.pagination pageCtx=pageCtx pageParam=pageParam/>
</div>