<div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="${wwwroot}/admin/docform/list" method="post">
        <input type="hidden" name="pageSize" value="">
        <input type="hidden" name="pageCurrent" value="">
        <input type="hidden" name="orderField" value="">
        <input type="hidden" name="orderDirection" value="">
        <div class="bjui-searchBar">
			<label>标题：</label><input type="text" id="title" name="title" value="${(docForm.title)!}"  class="form-control" size="10">&nbsp;				    			
			<label>发文单位ID：</label><input type="text" id="sendDepId" name="sendDepId" value="${(docForm.sendDepId)!}"  class="form-control" size="10">&nbsp;				    			
			<label>发文单位：</label><input type="text" id="sendDep" name="sendDep" value="${(docForm.sendDep)!}"  class="form-control" size="10">&nbsp;				    			
			<label>发文编号：</label><input type="text" id="no" name="no" value="${(docForm.no)!}"  class="form-control" size="10">&nbsp;				    			
			<label>发文内容：</label><input type="text" id="content" name="content" value="${(docForm.content)!}"  class="form-control" size="10">&nbsp;				    			
			<label>相关情况：</label><input type="text" id="remark" name="remark" value="${(docForm.remark)!}"  class="form-control" size="10">&nbsp;				    			
			<label>负责人ID：</label><input type="text" id="chargeManId" name="chargeManId" value="${(docForm.chargeManId)!}"  class="form-control" size="10">&nbsp;				    			
			<label>负责人：</label><input type="text" id="chargeMan" name="chargeMan" value="${(docForm.chargeMan)!}"  class="form-control" size="10">&nbsp;				    			
			<label>承办人ID：</label><input type="text" id="contractorId" name="contractorId" value="${(docForm.contractorId)!}"  class="form-control" size="10">&nbsp;				    			
			<label>承办人：</label><input type="text" id="contractor" name="contractor" value="${(docForm.contractor)!}"  class="form-control" size="10">&nbsp;				    			
			<label>年份：</label><input type="text" id="year" name="year" value="${(docForm.year)!}"  class="form-control" size="10">&nbsp;				    			
			<label>月份：</label><input type="text" id="month" name="month" value="${(docForm.month)!}"  class="form-control" size="10">&nbsp;				    			
			<label>季度：</label><input type="text" id="quarter" name="quarter" value="${(docForm.quarter)!}"  class="form-control" size="10">&nbsp;				    			
			<label>办理情况：</label><input type="text" id="progress" name="progress" value="${(docForm.progress)!}"  class="form-control" size="10">&nbsp;				    			
			<label>状态：</label><input type="text" id="status" name="status" value="${(docForm.status)!}"  class="form-control" size="10">&nbsp;				    			
			<label>创建日期：</label><input type="text" id="createDate" name="createDate" value="${(docForm.createDate)!}"  class="form-control" size="10">&nbsp;				    			
			<label>更新日期：</label><input type="text" id="updateDate" name="updateDate" value="${(docForm.updateDate)!}"  class="form-control" size="10">&nbsp;				    			
			<label>发文日期：</label><input type="text" id="publishDate" name="publishDate" value="${(docForm.publishDate)!}"  class="form-control" size="10">&nbsp;				    			
            <button type="submit" class="btn-default" data-icon="search">查询</button>&nbsp;
            <a class="btn btn-orange" href="javascript:;" onclick="$(this).navtab('reloadForm', true);" data-icon="undo">清空查询</a>
        </div>
    </form>
</div>
<div class="bjui-pageContent">
    <div class="bjui-headBar">
        <ul>
            <li class="left"><button type="button" class="btn-green" data-url="${wwwroot}/admin/docform/add" data-toggle="navtab" data-id="form" data-icon="plus">新增</button></li>
            <li class="left"><button type="button" class="btn-red" data-url="${wwwroot}/admin/docform/delete?ids={#bjui-selected}" data-toggle="doajax" data-confirm-msg="确定要删除选中项吗？" data-icon="remove">删除选中行</button></li>
        </ul>
    </div>
    <table data-toggle="tablefixed" data-width="100%" data-layout-h="0" data-nowrap="true" data-selected-multi="true">
        <thead>
            <tr>
				<th width="30">No.</th>                
    				<th data-order-direction="" data-order-field="title">标题</th>               
    				<th data-order-direction="" data-order-field="sendDepId">发文单位ID</th>               
    				<th data-order-direction="" data-order-field="sendDep">发文单位</th>               
    				<th data-order-direction="" data-order-field="no">发文编号</th>               
    				<th data-order-direction="" data-order-field="content">发文内容</th>               
    				<th data-order-direction="" data-order-field="remark">相关情况</th>               
    				<th data-order-direction="" data-order-field="chargeManId">负责人ID</th>               
    				<th data-order-direction="" data-order-field="chargeMan">负责人</th>               
    				<th data-order-direction="" data-order-field="contractorId">承办人ID</th>               
    				<th data-order-direction="" data-order-field="contractor">承办人</th>               
    				<th data-order-direction="" data-order-field="year">年份</th>               
    				<th data-order-direction="" data-order-field="month">月份</th>               
    				<th data-order-direction="" data-order-field="quarter">季度</th>               
    				<th data-order-direction="" data-order-field="progress">办理情况</th>               
    				<th data-order-direction="" data-order-field="status">状态</th>               
    				<th data-order-direction="" data-order-field="createDate">创建日期</th>               
    				<th data-order-direction="" data-order-field="updateDate">更新日期</th>               
    				<th data-order-direction="" data-order-field="publishDate">发文日期</th>               
                <th width="100">操作</th>
            </tr>
        </thead>
        <tbody>
	        
	        <#list pageCtx.rows as row>
	        	<tr data-id="${(row.id)!}">
					<td>${(row_index+1)!}</td>	        	
					<td>${(row.title)!}</td>	    			
					<td>${(row.sendDepId)!}</td>	    			
					<td>${(row.sendDep)!}</td>	    			
					<td>${(row.no)!}</td>	    			
					<td>${(row.content)!}</td>	    			
					<td>${(row.remark)!}</td>	    			
					<td>${(row.chargeManId)!}</td>	    			
					<td>${(row.chargeMan)!}</td>	    			
					<td>${(row.contractorId)!}</td>	    			
					<td>${(row.contractor)!}</td>	    			
					<td>${(row.year)!}</td>	    			
					<td>${(row.month)!}</td>	    			
					<td>${(row.quarter)!}</td>	    			
					<td>${(row.progress)!}</td>	    			
					<td>${(row.status)!}</td>	    			
					<td>${(row.createDate)!}</td>	    			
					<td>${(row.updateDate)!}</td>	    			
					<td>${(row.publishDate)!}</td>	    			
	                <td>
	                    <a href="${wwwroot}/admin/docform/edit?id=${(row.id)!}" class="btn btn-blue" data-toggle="navtab" data-id="form" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？" data-title="编辑">编辑</a>
	                    <a href="${wwwroot}/admin/docform/delete?ids=${(row.id)!}" class="btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？">删</a>
	                </td>	        	
	        	</tr>
			</#list>	        	
        </tbody>
    </table>  
 	<@p.pagination pageCtx=pageCtx pageParam=pageParam/>
</div>