<div class="bjui-pageHeader" >
    <form id="pagerForm" data-toggle="ajaxsearch" data-id="dialog-max" data-max="true" action="${wwwroot}/admin/recform/listunfinished" method="post" >
        <input type="hidden" name="pageSize" value="">
        <input type="hidden" name="pageCurrent" value="">
        <input type="hidden" name="orderField" value="">
        <input type="hidden" name="orderDirection" value="">
        <div class="bjui-searchBar">
            <button type="submit" class="btn-default" data-icon="search">查询</button>&nbsp;
        </div>
    </form>
</div>
<div class="bjui-pageContent">
    <div class="bjui-headBar">
        <ul>
        </ul>
    </div>
     <table class="table table-bordered table-hover table-striped table-top" data-width="100%" data-layout-h="0" data-nowrap="true" data-selected-multi="true">
        <thead>
            <tr>
				<th width="30">No.</th>                
    				<th data-order-direction="" data-order-field="depName">来文单位</th>               
    				<th data-order-direction="" data-order-field="no">来文编号</th>               
    				<th data-order-direction="" data-order-field="title">来文标题</th>
    				<th data-order-direction="" data-order-field="secretClass">密级</th>
    				<th data-order-direction="" data-order-field="recCount">来文份数</th>    				               
    				<th data-order-direction="" data-order-field="status">状态</th>               
    				<th  width="80" data-order-direction="" data-order-field="createDate">来文日期</th>
    				<th data-order-direction="" data-order-field="deadline">限办时间</th>                
                <th >操作</th>
            </tr>
        </thead>
        <tbody>  
	        <#list list as row>
	        	<tr data-id="${(row.id)!}">
					<td>${(row_index+1)!}</td>	        	
					<td>${(row.depName)!}</td>	    			
					<td title="${(row.no)!}"><@p.subStr content=(row.no)! length=20/></td>
					<td title="${(row.title)!}"><@p.subStr content=(row.title)! length=15/></td>
					<td>${(row.secretClass)!}</td>
					<td>${(row.recCount)!}</td>	    			
					<td>${(row.status)!}</td>	    			
					<td title="${(row.createDate?string('yyyy-MM-dd'))!}"><@p.subStr content=(row.createDate?string('yyyy-MM-dd'))! length=15/></td>
					<#if row.deadline??&&(remindTime?datetime &gt; row.deadline?datetime)&&row.status != endStatus><td style="background-color:red"><#else><td></#if>${(row.deadline?string('yyyy-MM-dd HH:00:00'))!}</td>	   		
	                <td>
	              <#if row.status??&row.status="草稿">  
	              <a href="${wwwroot}/admin/recform/editdraft?id=${(row.id)!}" class="btn btn-blue" data-toggle="dialog"  data-id="dialog-mask" data-mask="true" data-max="true">编辑</a>
					<a href="${wwwroot}/admin/recform/updatestatus?id=${(row.id)!}&status=登记" class="btn btn-red" data-toggle="doajax">提办</a>	              
	               <#else>
	               </#if>  
	                 <#if row.status??&row.status="登记">  
	                <a href="${wwwroot}/admin/recform/handle?id=${(row.id)!}" class="btn btn-blue" data-toggle="dialog"  data-id="dialog-mask" data-mask="true" data-max="true">办文</a>              
	              <a href="${wwwroot}/admin/recform/updatestatus?id=${(row.id)!}&status=审核" class="btn btn-red" data-toggle="doajax">归档</a>
	             <#else>
	              </#if> 
	               <#--<a href="${wwwroot}/print/recform?id=${(row.id)!}" class="btn btn-green" target="_blank">预览</a>-->
	                </td>	        	
	        	</tr>
			</#list>	        	
        </tbody>
    </table>  
</div>