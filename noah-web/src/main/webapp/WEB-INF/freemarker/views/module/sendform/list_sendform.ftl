<div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="${wwwroot}/admin/sendform/listsendform" method="post">
        <input type="hidden" name="pageSize" value="">
        <input type="hidden" name="pageCurrent" value="">
        <input type="hidden" name="orderField" value="">
        <input type="hidden" name="orderDirection" value="">
        <div class="bjui-searchBar">
			<label>标题：</label><input type="text" id="title" name="title" value="${(sendForm.title)!}"  class="form-control" size="12">&nbsp;				    						    			
			<label>拟文单位：</label><input type="text" id="draftDep" name="draftDep" value="${(sendForm.draftDep)!}"  class="form-control" size="12">&nbsp;				    				
			<label>拟文人：</label><input type="text" id="draftorName" name="draftorName" value="${(sendForm.draftorName)!}"  class="form-control" size="12">&nbsp;				    			
			<label>发送单位：</label><input type="text" id="mainDep" name="mainDep" value="${(sendForm.mainDep)!}"  class="form-control" size="12">&nbsp;				    			
			<label>年份：</label><input type="text" id="year" name="year" value="${(sendForm.year)!}"  class="form-control" size="8">&nbsp;				    			
			<label>月份：</label><input type="text" id="month" name="month" value="${(sendForm.month)!}"  class="form-control" size="8">&nbsp;				    			
			<label>季度：</label><input type="text" id="quarter" name="quarter" value="${(sendForm.quarter)!}"  class="form-control" size="8">&nbsp;				    			
            <button type="submit" class="btn btn-primary" data-icon="search">查询</button>&nbsp;
            <a class="btn btn-warning" href="javascript:;" onclick="$(this).navtab('reloadForm', true);" data-icon="undo">清空查询</a>
        </div>
    </form>
</div>
<div class="bjui-pageContent">
    <div class="bjui-headBar">
        <ul>
            <li class="left"><button type="button" class="btn btn-success" data-url="${wwwroot}/admin/sendform/addsendfrom" data-toggle="dialog" data-width="1000" data-height="800" data-id="form" data-mask="true" data-icon="plus">新增</button></li>
            <li class="left"><button type="button" class="btn btn-danger" data-url="${wwwroot}/admin/sendform/delete?ids={#bjui-selected}" data-toggle="doajax" data-confirm-msg="确定要删除选中项吗？" data-icon="remove">删除选中行</button></li>
        </ul>
    </div>
    <table data-toggle="tablefixed" data-width="100%" data-layout-h="0" data-nowrap="true" data-selected-multi="true">
        <thead>
            <tr>
				<th width="50">No.</th>                
    			<th data-order-direction="" data-order-field="title">标题</th>               
    			<th data-order-direction="" data-order-field="draftDep">拟文单位</th>               
    			<th data-order-direction="" data-order-field="draftorName">拟文人</th>               
    			<th data-order-direction="" data-order-field="mainDep">发送单位</th>               
    			<th data-order-direction="" data-order-field="subDep">抄送单位</th>               
    			<th data-order-direction="" data-order-field="secretClass">密级</th>               
    			<th data-order-direction="" data-order-field="status">状态</th>             
    			<th data-order-direction="" data-order-field="type">类型</th> 
    			<th width="10%" data-order-direction="" data-order-field="createDate">创建日期</th>              
                <th>操作</th>
            </tr>
        </thead>
        <tbody>
        <#list pageCtx.rows as row>
        	<tr data-id="${(row.id)!}">
				<td>${(row_index+1)!}</td>	        		    			
				<td title="${(row.title)!}"><@p.subStr content=(row.title)! length=15/></td>	    				
				<td>${(row.draftDep)!}</td>	    				
				<td>${(row.draftorName)!}</td>	    			
				<td>${(row.mainDep)!}</td>	    			
				<td>${(row.subDep)!}</td>	    			    			
				<td>${(row.secretClass)!}</td>	    			    			    			
				<td>${(row.status)!}</td>	    			 			
				<td>${(row.type)!}</td>	    			
				<td title="${(row.createDate?string('yyyy-MM-dd'))!}"><@p.subStr content=(row.createDate?string('yyyy-MM-dd'))! length=15/></td>
                <td>
                    <a href="${wwwroot}/admin/sendform/edit?id=${(row.id)!}" class="btn btn-blue" data-toggle="navtab" data-id="form" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？" data-title="编辑">编辑</a>
                    <a href="${wwwroot}/admin/sendform/updatestatus?id=${(row.id)!}&status=拟稿" class="btn btn-red" data-toggle="doajax">送审</a>
                    <a href="${wwwroot}/print/sendform?id=${(row.id)!}" class="btn btn-green" target="_blank">预览</a>
                </td>	        	
        	</tr>
		</#list>	        	
        </tbody>
    </table>  
 	<@p.pagination pageCtx=pageCtx pageParam=pageParam/>
</div>