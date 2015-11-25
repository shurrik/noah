<#list messages as row>
	${(row.content)!}
</#list>
<#--
<div class="bjui-pageContent">

  <table data-toggle="tablefixed" data-width="100%" data-layout-h="0" data-nowrap="true" data-selected-multi="true">
        <thead>
            <tr>
				<th width="50">No.</th>                
    			<th data-order-direction="" data-order-field="fromName">发送人</th>               
    			<th data-order-direction="" data-order-field="toName">接收人</th>               
    			<th data-order-direction="" data-order-field="title">标题</th>               
    			<th data-order-direction="" data-order-field="content">内容</th>               
    			<th data-order-direction="" data-order-field="readFlag">已读</th>               
    			<th data-order-direction="" data-order-field="createDate">创建日期</th>               
    			<th data-order-direction="" data-order-field="updateDate">更新日期</th>               
                <th width="100">操作</th>
            </tr>
        </thead>
        <tbody>
        <#list messages as row>
        	<tr data-id="${(row.id)!}">
				<td>${(row_index+1)!}</td>	        	
				<td>${(row.fromName)!}</td>	    			
				<td>${(row.toName)!}</td>	    			
				<td>${(row.title)!}</td>	    			
				<td>${(row.content)!}</td>	    			
				<td><#if row.readFlag>已读<#else>未读</#if></td>
				<td>${(row.createDate?string('yyyy-MM-dd HH:mm:ss'))!}</td>
				<td>${(row.updateDate?string('yyyy-MM-dd HH:mm:ss'))!}</td>	    	    			
                <td>
                    <a href="${wwwroot}/admin/message/edit?id=${(row.id)!}" class="btn btn-blue" data-toggle="navtab" data-id="form" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？" data-title="编辑">编辑</a>
                    <a href="${wwwroot}/admin/message/delete?ids=${(row.id)!}" class="btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？">删</a>
                </td>	        	
        	</tr>
		</#list>	        	
        </tbody>
    </table>  
 	
</div>
-->
