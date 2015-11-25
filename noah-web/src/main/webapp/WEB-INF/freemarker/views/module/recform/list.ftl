<div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="${wwwroot}/admin/recform/list" method="post">
        <input type="hidden" name="pageSize" value="">
        <input type="hidden" name="pageCurrent" value="">
        <input type="hidden" name="orderField" value="">
        <input type="hidden" name="orderDirection" value="">
        <div class="bjui-searchBar">
			<label>来文单位：</label><input type="text" id="depName" name="depName" value="${(recForm.depName)!}"  class="form-control" size="10">&nbsp;				    			
			<label>来文编号：</label><input type="text" id="no" name="no" value="${(recForm.no)!}"  class="form-control" size="10">&nbsp;				    			
			<label>来文标题：</label><input type="text" id="title" name="title" value="${(recForm.title)!}"  class="form-control" size="10">&nbsp;				    			
			<label>负责人：</label><input type="text" id="chargeMan" name="chargeMan" value="${(recForm.chargeMan)!}"  class="form-control" size="10">&nbsp;				    			
			<label>承办人：</label><input type="text" id="contractor" name="contractor" value="${(recForm.contractor)!}"  class="form-control" size="10">&nbsp;				    			
			<label>年：</label><input type="text" id="year" name="year" value="${(recForm.year)!}"  class="form-control" size="7" data-rule="integer">&nbsp;				    			
			<label>月：</label><input type="text" id="month" name="month" value="${(recForm.month)!}"  class="form-control" size="4" data-rule="integer">&nbsp;				    			
			<label>季：</label><input type="text" id="quarter" name="quarter" value="${(recForm.quarter)!}"  class="form-control" size="4" data-rule="range[1~4]">&nbsp;				    			
            <button type="submit" class="btn-default" data-icon="search">查询</button>&nbsp;
            <a class="btn btn-orange" href="javascript:;" onclick="$(this).navtab('reloadForm', true);" data-icon="undo">清空查询</a>
        </div>
    </form>
</div>
<div class="bjui-pageContent">
    <div class="bjui-headBar">
        <ul>
            <li class="left"><button type="button" class="btn-green" data-url="${wwwroot}/admin/recform/add" data-toggle="navtab" data-id="form" data-icon="plus">新增</button></li>
            <li class="left"><button type="button" class="btn-red" data-url="${wwwroot}/admin/recform/delete?ids={#bjui-selected}" data-toggle="doajax" data-confirm-msg="确定要删除选中项吗？" data-icon="remove">删除选中行</button></li>
        </ul>
    </div>
    <table class="table table-bordered table-hover table-striped table-top" data-width="100%" data-layout-h="0" data-nowrap="true" data-selected-multi="true">
        <thead>
            <tr>
				<th width="30">No.</th>                
    				<th data-order-direction="" data-order-field="depName">来文单位</th>               
    				<th data-order-direction="" data-order-field="no">来文编号</th>               
    				<th data-order-direction="" data-order-field="title">来文标题</th>               
    				<th data-order-direction="" data-order-field="chargeMan">负责人</th>               
    				<th data-order-direction="" data-order-field="contractor">承办人</th>               
    				<th data-order-direction="" data-order-field="year">年份</th>               
    				<th data-order-direction="" data-order-field="month">月份</th>               
    				<th data-order-direction="" data-order-field="quarter">季度</th>               
    				<th data-order-direction="" data-order-field="status">状态</th>               
    				<th  width="80" data-order-direction="" data-order-field="createDate">来文日期</th>               
                <th width="100">操作</th>
            </tr>
        </thead>
        <tbody>
	        
	        <#list pageCtx.rows as row>
	        	<tr data-id="${(row.id)!}">
					<td>${(row_index+1)!}</td>	        	
					<td>${(row.depName)!}</td>	    			
					<td title="${(row.no)!}"><@p.subStr content=(row.no)! length=20/></td>
					<td><@p.subStr content=(row.title)! length=15/></td>	    			
					<td>${(row.chargeMan)!}</td>	    			
					<td>${(row.contractor)!}</td>	    			
					<td>${(row.year)!}</td>	    			
					<td>${(row.month)!}</td>	    			
					<td>${(row.quarter)!}</td>	    			
					<td>${(row.status)!}</td>	    			
					<td title="${(row.createDate?string('yyyy-MM-dd'))!}"><@p.subStr content=(row.createDate?string('yyyy-MM-dd'))! length=15/></td>
					<td>
	                    <a href="${wwwroot}/admin/recform/edit?id=${(row.id)!}" class="btn btn-blue" data-toggle="navtab" data-id="form" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？" data-title="编辑">编辑</a>
	                    <a href="${wwwroot}/admin/recform/delete?ids=${(row.id)!}" class="btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？">删</a>
	                </td>	        	
	        	</tr>
			</#list>	        	
        </tbody>
    </table>  
 	<@p.pagination pageCtx=pageCtx pageParam=pageParam/>
</div>