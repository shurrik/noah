<div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="${wwwroot}/admin/backlog/listflow" method="post">
        <input type="hidden" name="pageSize" value="">
        <input type="hidden" name="pageCurrent" value="">
        <input type="hidden" name="orderField" value="">
        <input type="hidden" name="orderDirection" value="">
        <div class="bjui-searchBar">			    			
            <button type="submit" class="btn btn-primary" data-icon="search">查询</button>&nbsp;
            <a class="btn btn-warning" href="javascript:;" onclick="$(this).navtab('reloadForm', true);" data-icon="undo">清空查询</a>
        </div>
    </form>
</div>
<div class="bjui-pageContent">
    <div class="bjui-headBar">
        <ul>
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
				<th width=10% data-order-direction="" data-order-field="createDate">创建日期</th>               
                <th>操作</th>
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
                        <a href="${wwwroot}/admin/sendform/check?id=${(row.id)!}" class="btn btn-info" data-toggle="dialog" data-width="1000" data-height="800" data-id="dialog-mask" data-mask="true">办理</a>
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