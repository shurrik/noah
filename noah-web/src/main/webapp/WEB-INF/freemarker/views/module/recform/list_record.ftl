<div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="${wwwroot}/admin/recform/listrecord" method="post">
        <input type="hidden" name="pageSize" value="">
        <input type="hidden" name="pageCurrent" value="">
        <input type="hidden" name="orderField" value="">
        <input type="hidden" name="orderDirection" value="">
        <input type="hidden" id="dateType" name="dateType" value="">
        <div class="bjui-searchBar">
			<label>来文单位：</label><input type="text" id="depName" name="depName" value="${(recForm.depName)!}"  class="form-control" size="12">&nbsp;
			<#--				    			
			<label>来文编号：</label><input type="text" id="no" name="no" value="${(recForm.no)!}"  class="form-control" size="10">&nbsp;
			-->
			<label>收文号：</label><input type="text" id="no" name="no" value="${(recForm.no)!}"  class="form-control" size="12">&nbsp;							    			
			<label>来文号：</label><input type="text" id="docNo" name="docNo" value="${(recForm.docNo)!}"  class="form-control" size="12">&nbsp;
			<label>来文标题：</label><input type="text" id="title" name="title" value="${(recForm.title)!}"  class="form-control" size="12">&nbsp;
			<label>来文内容：</label><input type="text" id="content" name="content" value="${(recForm.content)!}"  class="form-control" size="12">&nbsp;				    			
			<label>年：</label><input type="text" id="year" name="year" value="${(recForm.year)!}"  class="form-control" size="8" >&nbsp;				    			
			<label>月：</label><input type="text" id="month" name="month" value="${(recForm.month)!}"  class="form-control" size="8" >&nbsp;				    			
			<label>季：</label><input type="text" id="quarter" name="quarter" value="${(recForm.quarter)!}"  class="form-control" size="8" >&nbsp;
			<p/>			    			
            <a class="btn btn-info <#if dateType??&dateType='pre'>flag</#if>"  href="javascript:submitForm('pre')">上一天</a>
            <input type="text" name="queryDate" id="queryDate" value="${(datePara?string('yyyy-MM-dd'))!}" data-toggle="datepicker"  size="15">
            <a class="btn btn-info <#if dateType??&dateType='post'>flag</#if>" href="javascript:submitForm('post')">下一天</a>
            <a class="btn btn-info <#if dateType??&dateType='yesterday'>flag</#if>" href="javascript:submitForm('yesterday')">昨天</a>
            <a class="btn btn-info <#if dateType??&dateType='before'>flag</#if>" href="javascript:submitForm('before')">前天</a>
            <a class="btn btn-info <#if dateType??&dateType='week'>flag</#if>" href="javascript:submitForm('week')">近7天</a>
			<input type="text" name="startDate" id="startDate" value="${(startDate?string('yyyy-MM-dd'))!}" data-toggle="datepicker"  size="15"> —  
			<input type="text" name="endDate" id="endDate" value="${(endDate?string('yyyy-MM-dd'))!}" data-toggle="datepicker"  size="15">            
            <button type="submit" class="btn-default" data-icon="search">查询</button>&nbsp;
            <a class="btn btn-orange" href="javascript:navtab();"  data-icon="undo">清空查询</a>
        </div>
    </form>
</div>
<div class="bjui-pageContent">
    <div class="bjui-headBar">
      <a align="right" class="btn btn-warning" href="javascript:exportExcel()" data-icon="download">导出Excel</a>            
        
    </div>
     <table class="table table-bordered table-hover table-striped table-top" data-width="100%" data-layout-h="0" data-nowrap="true" data-selected-multi="true">
       <thead>
            <tr>
				<th width="15">No.</th>   
				    <th data-order-direction="" data-order-field="createDate">来文日期</th>              
    				<th  data-order-direction="" data-order-field="depName">来文单位</th>
    				<#--               
    				<th width="70" data-order-direction="" data-order-field="no">来文编号</th>
    				-->
					<th  data-order-direction="" data-order-field="no">收文编号</th>    				               
					<th  data-order-direction="" data-order-field="docNo">来文编号</th>
    				<th  data-order-direction="" data-order-field="title">来文标题</th>               
					<th  data-order-direction="" data-order-field="recType">类型</th>
					<th  data-order-direction="" data-order-field="secretClass">密级</th>
					<th data-order-direction="" data-order-field="recCount">份数</th>    				               
    				<#--  <th width="20" data-order-direction="" data-order-field="doStatus">状态</th>  -->    
                    <th  data-order-direction="" data-order-field="doStatus">办文日期</th> 
                    <#--  
                    <th width="80" data-order-direction="" data-order-field="doTime">呈文领导</th>
                    <th width="80" data-order-direction="" data-order-field="doTime">办文单位</th>
                    -->                        
                <th width="200">操作</th>
            </tr>
        </thead>
        <tbody>	        
	        <#list pageCtx.rows as row>
	        	<tr data-id="${(row.id)!}">
					<td>${(row_index+1)!}</td>
					<td title="${(row.createDate?string('M/d'))!}"><@p.subStr content=(row.createDate?string('M/d'))! length=15/></td>	        	
					<td>${(row.depName)!}</td>	    			
					<td title="${(row.docNo)!}"><@p.subStr content=(row.docNo)! length=20/></td>
					<td title="${(row.no)!}"><@p.subStr content=(row.no)! length=20/></td>
					<td title="${(row.title)!}"><@p.subStr content=(row.title)! length=15/></td>	    			
					<td>${(row.recType)!}</td>
					<td>${(row.secretClass)!}</td>
					<td>${(row.recCount)!}</td>	    			
				<#--	<td>${(row.doStatus)!}</td>	     -->  
					<td>${(row.doTime?string('M/d'))!}</td>
					<#--
					<td>
					${(row.reportLeader)!}
					</td>
					<td>
					${(row.doDepartment)!}
					</td>
					-->	 			
					<td>
	               	<a href="${wwwroot}/print/recform?id=${(row.id)!}" class="btn btn-green" target="_blank" data-icon="eye" title="预览"></a>
	                	<a href="${wwwroot}/print/precform?id=${(row.id)!}" class="btn btn-green" data-icon="file-word-o" target="_blank" title="导出word"></a>
	                    <a href="${wwwroot}/admin/recform/returnstatus?ids=${(row.id)!}&status=${(returnStatus)!}" data-icon="backward" class="btn btn-red" title="回退" data-toggle="doajax" data-icon="remove"></a>
	                </td>	        	
	        	</tr>
			</#list>	        	
        </tbody>
    </table>  
    <form id="excelForm" action="${wwwroot}/admin/recform/findexcel">
    </form>
 	<@p.pagination pageCtx=pageCtx pageParam=pageParam/>
</div>
<script>
function exportExcel()
{
	var action = "${wwwroot}/admin/recform/findexcel";
	var x=$('#pagerForm').serializeArray();
	var pra = "";
  	$.each(x, function(i, field){
  		if(field.value.length>0)
  		{
  			pra = pra + field.name +"="+field.value+"&";
  		}
  	});
  	window.location = action+"?"+pra;
}
</script>
<script>
		 //加载事件
		        $(function () {
		            var collection = $(".flag");
		            $.each(collection, function () {
		                $(this).addClass("start");
		            });
		        });

	function submitForm(dateType)
	{

		$('#dateType').val(dateType);
		
		$('#pagerForm').bjuiajax('doSearch');
	}
function navtab()
	{
$("#no").val(""); 
	$("#depName").val(""); 
	$("#docNo").val(""); 
	$("#title").val(""); 
	$("#content").val(""); 
	$("#year").val(""); 
	$("#month").val(""); 
	$("#quarter").val(""); 
	$("#startDate").val(""); 
	$("#endDate").val(""); 
	$("#queryDate").val("");
	}
</script>

<style type="text/css">
        .start
        {
            cursor:pointer;
            color:Red;    
        }
        .end
        {
            cursor:pointer;
            color:Green;
        }
</style>
