<div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="${wwwroot}/admin/acessories/list" method="post">
        <input type="hidden" name="pageSize" value="">
        <input type="hidden" name="pageCurrent" value="">
        <input type="hidden" name="orderField" value="">
        <input type="hidden" name="orderDirection" value="">
        <div class="bjui-searchBar">
			<label>附件类型</label><input type="text" id="fileType" name="fileType" value="${(acessories.fileType)!}"  class="form-control" size="10">&nbsp;				    			
			<label>文档ID：</label><input type="text" id="fileId" name="fileId" value="${(acessories.fileId)!}"  class="form-control" size="10">&nbsp;				    			
			<label>附件地址：</label><input type="text" id="fileUrl" name="fileUrl" value="${(acessories.fileUrl)!}"  class="form-control" size="10">&nbsp;				    			
			<label>附件名称：</label><input type="text" id="fileName" name="fileName" value="${(acessories.fileName)!}"  class="form-control" size="10">&nbsp;				    			
			<label>创建日期：</label><input type="text" id="createDate" name="createDate" value="${(acessories.createDate)!}"  class="form-control" size="10">&nbsp;				    			
			<label>更新日期：</label><input type="text" id="updateDate" name="updateDate" value="${(acessories.updateDate)!}"  class="form-control" size="10">&nbsp;				    			
            <button type="submit" class="btn-default" data-icon="search">查询</button>&nbsp;
            <a class="btn btn-orange" href="javascript:;" onclick="$(this).navtab('reloadForm', true);" data-icon="undo">清空查询</a>
        </div>
    </form>
</div>
<div class="bjui-pageContent">
    <div class="bjui-headBar">
        <ul>
 <li class="left"><button type="button" class="btn-green" data-url="${wwwroot}/admin/upload" data-toggle="dialog" data-id="changepwd_page" data-mask="true" data-width="400" data-height="260">&nbsp;<span class="glyphicon glyphicon-lock"></span> 附件上传</button>	</li>           <!--
           <li class="left"><button type="button" class="btn-green" data-url="${wwwroot}/admin/acessories/add" data-toggle="navtab" data-id="form" data-icon="plus">新增</button></li>
           -->  
              <li class="left"><button type="button" class="btn-red" data-url="${wwwroot}/admin/acessories/delete?ids={#bjui-selected}" data-toggle="doajax" data-confirm-msg="确定要删除选中项吗？" data-icon="remove">删除选中行</button></li>
        </ul>
    </div>
    <table data-toggle="tablefixed" data-width="100%" data-layout-h="0" data-nowrap="true" data-selected-multi="true">
        <thead>
            <tr>
				<th width="50">No.</th>                
    			<th data-order-direction="" data-order-field="fileType">附件类型</th>               
    			<th data-order-direction="" data-order-field="fileId">文档ID</th>               
    			<th data-order-direction="" data-order-field="fileUrl">附件地址</th>               
    			<th data-order-direction="" data-order-field="fileName">附件名称</th>               
    			<th data-order-direction="" data-order-field="createDate">创建日期</th>               
    			<th data-order-direction="" data-order-field="updateDate">更新日期</th>               
                <th width="180">操作</th>
            </tr>
        </thead>
        <tbody>
        <#list pageCtx.rows as row>
        	<tr data-id="${(row.id)!}">
				<td>${(row_index+1)!}</td>	        	
				<td>${(row.fileType)!}</td>	    			
				<td>${(row.fileId)!}</td>	    			
				<td> <a href="${wwwroot}/admin/acessories/download?name=${(row.fileName)!}&partpath=${(row.fileUrl)!}" enctype="multipart/form-data" class="btn btn-blue" target="target_upload" data-id="form" data-title="下载">http://www.updown.${(row.fileUrl)!}.file</a>
             </td>	    			
				<td>${(row.fileName)!}</td>	    			
				<td>${(row.createDate?string('yyyy-MM-dd HH:mm:ss'))!}</td>	    			
				<td>${(row.updateDate?string('yyyy-MM-dd HH:mm:ss'))!}</td>		    			
                <td>
                    <a href="${wwwroot}/admin/acessories/download?name=${(row.fileName)!}&partpath=${(row.fileUrl)!}" enctype="multipart/form-data" class="btn btn-blue" target="target_upload" data-id="form" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？" data-title="下载">下载</a>
                    <a href="${wwwroot}/admin/acessories/edit?id=${(row.id)!}" class="btn btn-blue" data-toggle="navtab" data-id="form" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？" data-title="编辑">编辑</a>
                    <a href="${wwwroot}/admin/acessories/delete?ids=${(row.id)!}&name=${(row.fileName)!}&partpath=${(row.fileUrl)!}" class="btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？">删</a>
                </td>	        	
        	</tr>
		</#list>	        	
        </tbody>
    </table>  
 	<@p.pagination pageCtx=pageCtx pageParam=pageParam/>
</div>