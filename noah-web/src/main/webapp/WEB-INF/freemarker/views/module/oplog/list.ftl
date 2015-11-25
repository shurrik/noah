<div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="${wwwroot}/admin/oplog/list" method="post">
        <input type="hidden" name="pageSize" value="">
        <input type="hidden" name="pageCurrent" value="">
        <input type="hidden" name="orderField" value="">
        <input type="hidden" name="orderDirection" value="">
        <div class="bjui-searchBar">
			<label>来文标题：</label><input type="text" id="title" name="title" value="${(opLog.title)!}"  class="form-control" size="10">&nbsp;				    			
			<label>内容：</label><input type="text" id="content" name="content" value="${(opLog.content)!}"  class="form-control" size="10">&nbsp;				    			
			<label>用户名：</label><input type="text" id="userName" name="userName" value="${(opLog.userName)!}"  class="form-control" size="10">&nbsp;				    			
			<label>真实姓名：</label><input type="text" id="realName" name="realName" value="${(opLog.realName)!}"  class="form-control" size="10">&nbsp;				    			
			<#--<label>创建日期：</label><input type="text" id="createDate" name="createDate" value="${(opLog.createDate)!}"  class="form-control" size="10">&nbsp;				    			
			<label>更新日期：</label><input type="text" id="updateDate" name="updateDate" value="${(opLog.updateDate)!}"  class="form-control" size="10">&nbsp;				    			
            --><button type="submit" class="btn btn-primary" data-icon="search">查询</button>&nbsp;
            <a class="btn btn-warning" href="javascript:;" onclick="$(this).navtab('reloadForm', true);" data-icon="undo">清空查询</a>
        </div>
    </form>
</div>
<div class="bjui-pageContent">
    <div class="bjui-headBar">

    </div>  
    <table data-toggle="tablefixed" data-width="100%" data-layout-h="0" data-nowrap="true" data-selected-multi="true">
        <thead>
            <tr>
				<th width="50">No.</th>                
    			<th data-order-direction="" data-order-field="title">来文标题</th>               
    			<th data-order-direction="" data-order-field="content">内容</th>               
    			<th data-order-direction="" data-order-field="userName">用户名</th>               
    			<th data-order-direction="" data-order-field="realName">真实姓名</th>               
    			<th data-order-direction="" data-order-field="createDate">创建日期</th>               
    			<th data-order-direction="" data-order-field="updateDate">更新日期</th>               
              <#--  <th width="100">操作</th>-->
            </tr>
        </thead>
        <tbody>
        <#list pageCtx.rows as row>
        	<tr data-id="${(row.id)!}">
				<td>${(row_index+1)!}</td>	        	
				<td>${(row.title)!}</td>	    			
				<td>${(row.content)!}</td>	    			
				<td>${(row.userName)!}</td>	    			
				<td>${(row.realName)!}</td>	    			
				<td>${(row.createDate?string('yyyy-MM-dd HH:mm:ss'))!}</td>	    			
				<td>${(row.updateDate?string('yyyy-MM-dd HH:mm:ss'))!}</td>	    			
              <#--  <td>
                    <a href="${wwwroot}/admin/oplog/edit?id=${(row.id)!}" class="btn btn-blue" data-toggle="navtab" data-id="form" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？" data-title="编辑">编辑</a>
                    <a href="${wwwroot}/admin/oplog/delete?ids=${(row.id)!}" class="btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？">删</a>
                </td>	-->        	
        	</tr>
		</#list>	        	
        </tbody>
    </table>  
 	<@p.pagination pageCtx=pageCtx pageParam=pageParam/>
</div>