
<div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="${wwwroot}/admin/recform/listhandle" method="post">
        <input type="hidden" name="pageSize" value="">
        <input type="hidden" name="pageCurrent" value="">
        <input type="hidden" name="orderField" value="">
        <input type="hidden" name="orderDirection" value="">
        <input type="hidden" id="dateType" name="dateType" value="">
        <div class="bjui-searchBar">
			<label>来文单位：</label><input type="text" id="depName" name="depName" value="${(recForm.depName)!}"  class="form-control" size="12">&nbsp;				    			
			<label>来文编号：</label><input type="text" id="no" name="no" value="${(recForm.no)!}"  class="form-control" size="12">&nbsp;				    			
			<label>来文标题：</label><input type="text" id="title" name="title" value="${(recForm.title)!}"  class="form-control" size="12">&nbsp;
			<label>来文内容：</label><input type="text" id="content" name="content" value="${(recForm.content)!}"  class="form-control" size="12">&nbsp;
			<label>年：</label><input type="text" id="year" name="year" value="${(recForm.year)!}"  class="form-control" size="8" >&nbsp;				    			
			<label>月：</label><input type="text" id="month" name="month" value="${(recForm.month)!}"  class="form-control" size="8" >&nbsp;				    			
			<label>季：</label><input type="text" id="quarter" name="quarter" value="${(recForm.quarter)!}"  class="form-control" size="8">&nbsp;
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
        <ul>
            <li class="left"><button type="button" id="del_model"  class="btn btn-success" 
              data-group="ids">批量审核</button></li>
             </ul>
    </div>
    <table class="table table-bordered table-hover table-striped table-top" data-width="100%" data-layout-h="0" data-nowrap="true" data-selected-multi="true">
      <thead>
            <tr>
				<th width="15"></th>  
				    <th  data-order-direction="" data-order-field="createDate">来文日期</th> 
    				<th  data-order-direction="" data-order-field="depName">来文单位</th>               
    				<th  data-order-direction="" data-order-field="no">来文编号</th>               
    				<th  data-order-direction="" data-order-field="title">来文标题</th>               
    				<th  data-order-direction="" data-order-field="recType">类型</th>
    				<th  data-order-direction="" data-order-field="secretClass">密级</th>
    				<#--<th width="30" data-order-direction="" data-order-field="recCount">份数</th>
    				<th width="50" data-order-direction="" data-order-field="status">状态</th> -->              
                    <th  data-order-direction="" data-order-field="deadline">限办时间</th>           
                    <th  data-order-direction="" data-order-field="doStatus">办文状态</th> 
                   <#-- <th data-order-direction="" data-order-field="doTime">办文日期</th> --> 
                    <th  data-order-direction="" data-order-field="doTime">呈文领导</th>
                    <th  data-order-direction="" data-order-field="doTime">办文单位</th>
                 <th width="25"><input type="checkbox" class="checkboxCtrl" id="allChk" data-group="subChk" data-toggle="icheck"></th>   
                <th width="200">操作</th>
            </tr>
        </thead>
        <tbody>
	        
	        <#list pageCtx.rows as row>
	        	<tr data-id="${(row.id)!}">
					<td>${(row_index+1)!}</td>
					<td title="${(row.createDate?string('M/d'))!}"><@p.subStr content=(row.createDate?string('M/d'))! length=15/></td>	        	
					<td>${(row.depName)!}</td>	    			
					<td>${(row.no)!}</td>	    			
					<td title="${(row.title)!}"><@p.subStr content=(row.title)! length=30/></td>	    			
					<td>${(row.recType)!}</td>
					<td>${(row.secretClass)!}</td>
					<#--<td>${(row.recCount)!}</td>
					<td>${(row.status)!}</td>-->    			
					
					<#if row.deadline??>
						<#if (remindTime?datetime &gt; row.deadline?datetime)&& row.status!=endStatus>
						 <td style="background-color:red">
						  ${(row.deadline?string('M/d-HH'))!}
						  </td>						
						<#else>
						 <td>
						  ${(row.deadline?string('M/d-HH'))!}
						  </td>						
						</#if>					
					<#else>
						<td >无</td>
					</#if>
				
					<td <#if row.doStatus??&row.doStatus="已办文">
				<span style="color:red">	 ${(row.doStatus)!}</span>
<#else> <span >${(row.doStatus)!}</span>
</#if>
					</td> 
					
				<#--		<#if row.doStatus??&row.doStatus="已办文">
						 <td style="background-color:red">
						  ${(row.doStatus)!}
						  </td>						
						<#else>
						 <td>
						 ${(row.doStatus)!}
						  </td>						
						</#if>	 -->
					
					<#--<td>
					${(row.doTime?string('yy/M/d'))!}
					</td> --> 
					<td title="${(row.reportLeader)!}"><@p.subStr content=(row.reportLeader)! length=30/></td>	 
					<td title="${(row.doDepartment)!}"><@p.subStr content=(row.doDepartment)! length=30/></td>	 									
	             <td><input type="checkbox" name="subChk" data-toggle="icheck" value="${(row.id)!}"></td>  
	                <td >
	                <#if row.doStatus??&row.doStatus="已归档">
	                <#--  
	               <a href="" class="btn btn-default disable" data-toggle="doajax">办文</a>
	               --> 
	                <a href="${wwwroot}/print/recform?id=${(row.id)!}" class="btn btn-green" target="_blank"  title="预览" data-icon="eye"></a>
	               <#else>
	                    <a href="${wwwroot}/admin/recform/handle?id=${(row.id)!}" class="btn btn-blue" data-toggle="dialog"  title="办文" data-width="1000" data-height="800" data-id="dialog-mask" data-icon="edit" data-mask="true" data-max="true"></a>
	               </#if> 
	                   <!-- <a href="${wwwroot}/admin/recform/handle?id=${(row.id)!}" class="btn btn-blue" data-toggle="dialog" data-width="1000" data-height="800" data-id="dialog-mask" data-mask="true">办文</a>-->
	                    <#--<a href="${wwwroot}/admin/recform/updatestatus?id=${(row.id)!}&status=办文" class="btn btn-red" data-toggle="doajax">送审</a>-->
	                    <a href="${wwwroot}/print/precform?id=${(row.id)!}" class="btn btn-green" target="_blank"  title="导出word" data-icon="file-word-o"></a>
	               

                   <#if row.doStatus??&row.doStatus="已归档">  
	              
	               <#else>
	              <a href="${wwwroot}/admin/recform/updatestatus?id=${(row.id)!}&status=审核" class="btn btn-orange" data-icon="archive"  title="归档" data-toggle="doajax"></a>
	               </#if> 
	                </td>	        	
	        	</tr>
			</#list>	        	
        </tbody>
    </table>  
 	<@p.pagination pageCtx=pageCtx pageParam=pageParam/>
</div>
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
<script>
$(document).ready(function() { 

$("#del_model").click(function() { 
var checkedNum = $("input[name='subChk']:checked").length; 
if(checkedNum == 0) { 
alert("请至少选择一项！"); 
return; 
} 
// 批量选择 
if(confirm("确定要审核所选收文？")) { 
var checkedList = new Array(); 
$("input[name='subChk']:checked").each(function() { 
checkedList.push($(this).val()); 
}); 
$.ajax({ 
type: "POST", 
url: "${wwwroot}/admin/recform/updatebatchverify", 
data: {'delitems':checkedList.toString()}, 
 success: function(result) { 
$("[name ='subChk']:checkbox").attr("checked", false); 
$(this).navtab('reloadFlag', 'main');
} 
}); 
} 
}); 
}); 
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