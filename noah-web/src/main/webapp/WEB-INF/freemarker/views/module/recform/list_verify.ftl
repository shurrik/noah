<div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="${wwwroot}/admin/recform/listverify" method="post">
        <input type="hidden" name="pageSize" value="">
        <input type="hidden" name="pageCurrent" value="">
        <input type="hidden" name="orderField" value="">
        <input type="hidden" name="orderDirection" value="">
        <div class="bjui-searchBar">
			<label>来文单位：</label><input type="text" id="depName" name="depName" value="${(recForm.depName)!}"  class="form-control" size="10">&nbsp;				    			
			<label>来文编号：</label><input type="text" id="no" name="no" value="${(recForm.no)!}"  class="form-control" size="10">&nbsp;				    			
			<label>来文标题：</label><input type="text" id="title" name="title" value="${(recForm.title)!}"  class="form-control" size="10">&nbsp;
			<label>来文内容：</label><input type="text" id="content" name="content" value="${(recForm.content)!}"  class="form-control" size="10">&nbsp;
			<label>年：</label><input type="text" id="year" name="year" value="${(recForm.year)!}"  class="form-control" size="7" >&nbsp;				    			
			<label>月：</label><input type="text" id="month" name="month" value="${(recForm.month)!}"  class="form-control" size="4" >&nbsp;				    			
			<label>季：</label><input type="text" id="quarter" name="quarter" value="${(recForm.quarter)!}"  class="form-control" size="4" >&nbsp;			    			
            <button type="submit" class="btn-default" data-icon="search">查询</button>&nbsp;
            <a class="btn btn-orange" href="javascript:;" onclick="$(this).navtab('reloadForm', true);" data-icon="undo">清空查询</a>
        </div>
    </form>
</div>
<div class="bjui-pageContent">
    <div class="bjui-headBar">
        <ul>
			<li class="left"><button type="button" class="btn-red" data-url="${wwwroot}/admin/recform/returnstatus?ids={#bjui-selected}&status=${(returnStatus)!}" data-toggle="doajax" data-icon="remove">退回</button></li>        
        <#--
            <li class="left"><button type="button" class="btn-green" data-url="${wwwroot}/admin/recform/handle" data-toggle="navtab" data-id="form" data-icon="plus">办文</button></li>
            -->
        </ul>
    </div>
    <table class="table table-bordered table-hover table-striped table-top" data-width="100%" data-layout-h="0" data-nowrap="true" data-selected-multi="true">
       <thead>
            <tr>
				<th width="30">No.</th>                
    				<th width="70" data-order-direction="" data-order-field="depName">来文单位</th>               
    				<th width="70" data-order-direction="" data-order-field="no">来文编号</th>               
    				<th width="70" data-order-direction="" data-order-field="title">来文标题</th>               
    				<th width="70" data-order-direction="" data-order-field="recType">收文类型</th>
    				<th width="50" data-order-direction="" data-order-field="secretClass">密级</th>
    				<th width="70" data-order-direction="" data-order-field="recCount">来文份数</th>               
    				<th  width="50" data-order-direction="" data-order-field="status">状态</th>               
    				<th width="80" data-order-direction="" data-order-field="createDate">来文日期</th>
    					<th width="150" data-order-direction="" data-order-field="deadline">限办时间</th>                      
                <th width="200">操作</th>
            </tr>
        </thead>
        <tbody> 
	        <#list pageCtx.rows as row>
	        	<tr data-id="${(row.id)!}">
					<td>${(row_index+1)!}</td>	        	
					<td>${(row.depName)!}</td>	    			
					<td title="${(row.no)!}"><@p.subStr content=(row.no)! length=20/></td>
					<td title="${(row.title)!}"><@p.subStr content=(row.title)! length=15/></td>	    			
					<td>${(row.recType)!}</td>
					<td>${(row.secretClass)!}</td>
					<td>${(row.recCount)!}</td>	    			
					<td>${(row.status)!}</td>	 	   			
					<td>${(row.createDate?string('yyyy-MM-dd'))!}</td>	 
					 <#--<#if (remindTime?datetime &lt; row.deadline?datetime)><td><#else><td style="background-color:red"></#if>${(row.deadline?string('yyyy-MM-dd HH:00:00'))!}</td>-->	   		
	                 <#if row.deadline??>
						<#if remindTime?datetime &lt; row.deadline?datetime>
						 <td>
						  ${(row.deadline?string('yyyy-MM-dd HH:00:00'))!}
						  </td>						
						<#else>
						 <td style="background-color:red">
						  ${(row.deadline?string('yyyy-MM-dd HH:00:00'))!}
						  </td>						
						</#if>					
					<#else>
						<td >无限办时间</td>
					</#if>   			
	                <td>
	                <#--
	                    <a href="${wwwroot}/admin/recform/verify?id=${(row.id)!}" class="btn btn-blue" data-toggle="navtab" data-id="form" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？" data-title="办文">办文</a>
	                    -->
	                    <a href="${wwwroot}/admin/recform/verify?id=${(row.id)!}" class="btn btn-blue" data-toggle="dialog" data-width="1000" data-height="800" data-id="dialog-mask" data-mask="true">办文</a>
	                    
	                    <a href="${wwwroot}/admin/recform/updatestatus?id=${(row.id)!}&status=审核" class="btn btn-red" data-toggle="doajax">通过</a>
	                    <a href="${wwwroot}/print/recform?id=${(row.id)!}" class="btn btn-green" target="_blank">预览</a>
	                    <#--
	                    <a href="${wwwroot}/admin/recform/delete?ids=${(row.id)!}" class="btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？">删</a>
	                    -->
	                </td>	        	
	        	</tr>
			</#list>	        	
        </tbody>
    </table>  
 	<@p.pagination pageCtx=pageCtx pageParam=pageParam/>
</div>