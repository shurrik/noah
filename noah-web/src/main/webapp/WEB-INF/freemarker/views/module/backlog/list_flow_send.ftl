<div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="${wwwroot}/admin/backlog/listflowsend" method="post">
        <input type="hidden" name="pageSize" value="">
        <input type="hidden" name="pageCurrent" value="">
        <input type="hidden" name="orderField" value="">
        <input type="hidden" name="orderDirection" value="">
        <div class="bjui-searchBar">
        
            <label>主题：</label><input type="text" id="subject" name="subject" value="${(row.subject)!}"  class="form-control" size="12">&nbsp;				    						    			
			<label>流程名称：</label><input type="text" id="flowName" name="flowName" value="${(row.flowName)!}"  class="form-control" size="12">&nbsp;				    				
			<label>备注：</label><input type="text" id="remark" name="remark" value="${(row.remark)!}"  class="form-control" size="12">&nbsp;				    			
			<label>状态：</label><input type="text" id="status" name="status" value="${(row.status)!}"  class="form-control" size="12">&nbsp;				    			
            <button type="submit" class="btn btn-primary" data-icon="search">查询</button>&nbsp;
            <a class="btn btn-warning" href="javascript:;" onclick="$(this).navtab('reloadForm', true);" data-icon="undo">清空查询</a>
        </div>
    </form>
</div>
<div class="bjui-pageContent">
   <div class="bjui-headBar">
         <ul>
            <li class="left"><button type="button" class="btn btn-danger" data-url="${wwwroot}/admin/backlog/delete?ids={#bjui-selected}" data-toggle="doajax" data-confirm-msg="确定要删除选中项吗？" data-icon="remove">删除选中行</button></li>        
         </ul>
    </div>  
    <table data-toggle="tablefixed" data-width="100%" data-layout-h="0" data-nowrap="true" data-selected-multi="true">
        <thead>
            <tr>
				<th width="30">No.</th>        
			    <th data-order-direction="" data-order-field="flowName" width="100">流程名称</th>
				<th data-order-direction="" data-order-field="subject" width="100">主题</th>               
				<th data-order-direction="" data-order-field="remark" width="100">备注</th>               
				<th data-order-direction="" data-order-field="status" width="100">状态</th>               
				<th data-order-direction="" data-order-field="createDate" width="100">创建日期</th>               
                <th width="100">操作</th>
            </tr>
        </thead>
        <tbody>
	        
	        <#list pageCtx.rows as row>
	        	<tr data-id="${(row.id)!}">
					<td>${(row_index+1)!}</td>
					<td>${(row.flowName)!}</td>						        	
					<td title="${(row.subject)!}"><@p.subStr content=(row.subject)! length=15/></td><#--substr 是字符串的截取，显示部分字符串-->	    			
					<td title="${(row.remark)!}"><@p.subStr content=(row.remark)! length=15/></td>	    			
					<td>${(row.status)!}</td>	    			
					<td>${(row.createDate?string('yyyy-MM-dd HH:mm:ss'))!}</td>	    			
	                <td>
                        <a href="${wwwroot}/admin/${(row.nameSpace)!}/check?id=${(row.id)!}" class="btn btn-info" data-toggle="dialog" data-width="1000" data-height="800" data-id="dialog-mask" data-mask="true">办理</a>
	                    <a href="${wwwroot}/print/sendform?id=${(row.docId)!}" class="btn btn-success" target="_blank">预览</a>  
	               
	                </td>	        	
	        	</tr>
			</#list>	        	
        </tbody>
    </table>  
 	<@p.pagination pageCtx=pageCtx pageParam=pageParam/>
</div>