<div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="${wwwroot}/admin/usermsgcount/list" method="post">
        <input type="hidden" name="pageSize" value="">
        <input type="hidden" name="pageCurrent" value="">
        <input type="hidden" name="orderField" value="">
        <input type="hidden" name="orderDirection" value="">
        <div class="bjui-searchBar">
			<label>用户ID：</label><input type="text" id="userId" name="userId" value="${(userMsgCount.userId)!}"  class="form-control" size="10">&nbsp;				    			
			<label>新消息数：</label><input type="text" id="unread" name="unread" value="${(userMsgCount.unread)!}"  class="form-control" size="10">&nbsp;				    			
            <button type="submit" class="btn btn-primary" data-icon="search">查询</button>&nbsp;
            <a class="btn btn-warning" href="javascript:;" onclick="$(this).navtab('reloadForm', true);" data-icon="undo">清空查询</a>
        </div>
    </form>
</div>
<div class="bjui-pageContent">
     <div class="bjui-headBar">
       <#--<ul>
            <li class="left"><button type="button" class="btn-green" data-url="${wwwroot}/admin/usermsgcount/add" data-toggle="navtab" data-id="form" data-icon="plus">新增</button></li>
            <li class="left"><button type="button" class="btn-red" data-url="${wwwroot}/admin/usermsgcount/delete?ids={#bjui-selected}" data-toggle="doajax" data-confirm-msg="确定要删除选中项吗？" data-icon="remove">删除选中行</button></li>
        </ul> -->
       
    </div>
    <table data-toggle="tablefixed" data-width="100%" data-layout-h="0" data-nowrap="true" data-selected-multi="true">
        <thead>
            <tr>
				<th width="30">No.</th>                
    			<th data-order-direction="" data-order-field="userId">用户ID</th>               
    			<th data-order-direction="" data-order-field="unread">新消息数</th>               
    			<th data-order-direction="" data-order-field="createDate">创建日期</th>               
    			<th data-order-direction="" data-order-field="updateDate">更新日期</th>               
            </tr>
        </thead>
        <tbody>
        <#list pageCtx.rows as row>
        	<tr data-id="${(row.id)!}">
				<td>${(row_index+1)!}</td>	        	
				<td>${(row.userId)!}</td>	    			
				<td>${(row.unread)!}</td>	    			
				<td>${(row.createDate?string('yyyy-MM-dd HH:mm:ss'))!}</td>	    			
				<td>${(row.updateDate?string('yyyy-MM-dd HH:mm:ss'))!}</td>	    			
        	</tr>
		</#list>	        	
        </tbody>
    </table>  
 	<@p.pagination pageCtx=pageCtx pageParam=pageParam/>
</div>