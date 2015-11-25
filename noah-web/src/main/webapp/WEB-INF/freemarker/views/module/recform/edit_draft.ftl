
<div class="bjui-pageContent" >
    <form id="editForm" action="${wwwroot}/admin/recform/savedraft?docdep=${(docdep)!}&docyear=${(docyear)!}&docnumber=${(docnumber)!}" id="j_custom_form" data-toggle="validate" data-alertmsg="false" reloadNavtab="true">
        <div class="bjui-footBar" >
            <ul>
               <li><button type="button" class="btn-close btn-nm" data-icon="close">取消</button></li>  
              <li><button type="submit" class="btn-default btn-nm" data-icon="save">保存</button></li>              
            </ul>
        </div>
        <input  type="hidden" name="id" value="${(recForm.id)!}" />
        <div class="pageFormContent" data-layout-h="0">
            <table class="table table-condensed table-hover" width="100%">
                <tbody>
                    <tr>
                        <td>                     
                            <label for="depId" class="control-label x85">来文单位：</label>
                            <@p.deptSelector  id=(recForm.depId)! val=(recForm.depName)! idName="depId" valName="depName" depts=depts />
                        </td>							
                        <td>
                         <div>  <label for="no" class="control-label x85">来文编号：</label>
                          <#if recForm.no??>
                       <input class="input-nm" type="text" name="no" id="search" value="${(recForm.no)!}" data-rule="required" maxlength="100"   onKeyUp="findNames();" autocomplete="off"  >
        			<#else>
                          <input class="input-nm" type="text" name="no" id="search" value="" data-rule="required" maxlength="100"   onKeyUp="findNames();" autocomplete="off"  >
               <div align="center"   id="pop"  style="position:absolute;z-index:222222222222222; ">
    			<table id="name_table" bgcolor="#FFFAFA" border="0" cellspacing="0" padding-left="95" cellpadding="0" style="font-size:18px;" >
           		 <tbody id="name_table_body">
  				
  				</tbody>
  				</table>
  				</div>
                          </#if>    
  				</div>
                        </td>							
					</tr>
                    <tr>
                        <td colspan="2">
                            <label for="docNo" class="control-label x85">收文编号：</label>
                       <#if recForm.docNo??>
                         <input type="text" name="docNo"  id="docNo" class="input-nm"  value="${(recForm.docNo)!}" data-rule="required" size="80" maxlength="100">
                       <#else>
                     <input type="text" name="docdep" class="input-nm" id="docdep" value="函" data-rule="required" size="10" maxlength="100" align="right" style="text-align:right">
                      <input type="text" name="docyear" class="input-nm" id="docyear" value="〔2015〕" data-rule="required" size="10" maxlength="100"  style="text-align:center">                        
                <input type="text" name="docnumber" class="input-nm" id="docnumber" value="号" data-rule="required" size="10" maxlength="100" style="text-align:right">
                   </#if>
                    
                        </td>							
					</tr>					
					<tr>
                        <td colspan="2">
                            <label for="title" class="control-label x85">来文标题：</label>
							<textarea name="title" id="title" cols="80" rows="2" data-toggle="autoheight" maxlength="500">${(recForm.title)!}</textarea>                            
                        </td>
					</tr>
					<tr>
                        <td>
                            <label for="secretClass" class="control-label x85">密级：</label>
                            <@p.secretSelector name="secretClass" value=(recForm.secretClass)! />
                            <#--
						    <select name="secretClass" id="secretClass" data-toggle="selectpicker">
						    	<option value="普通" <#if recForm.secretClass??&recForm.secretClass='普通'>selected</#if>>普通</option>
						    	<option value="秘密" <#if recForm.secretClass??&recForm.secretClass='秘密'>selected</#if>>秘密</option>
						    	<option value="机密" <#if recForm.secretClass??&recForm.secretClass='机密'>selected</#if>>机密</option>
						    	<option value="绝密" <#if recForm.secretClass??&recForm.secretClass='绝密'>selected</#if>>绝密</option>
						    </select>
						    -->                            
                        </td>					
                        <td>
                            
                            <label for="title" class="control-label x85">收文人：</label>
							<@p.userSelector  id=(recForm.receiverId)! val=(recForm.receiver)! idName="receiverId" valName="receiver" users=users curUser=curUser/>                            
                        </td>
					</tr>
					<tr>
                        <td>
                            <label for="recCount" class="control-label x85">来文份数：</label>
                            <input type="text" class="input-nm" name="recCount" id="recCount" value="${(recForm.recCount)!}" data-rule="integer" maxlength="10">
                        </td>
                        <td id="limitDiv" <#if recForm.id??&&recForm.deadline??><#else>style="display:none"</#if>>
                            <label for="deadline" class="control-label x85">限办时间：</label>
                            <input type="text" name="timeLimit" id="timeLimit" value="${(recForm.deadline?string('yyyy-MM-dd HH:mm:ss'))!}" readonly>
                            <button id="cancelDeadline" type="button" class="btn-default" data-icon="save" onclick="javascript:editLimit()">修改限时</button>
                        </td>
                        <td id="hourDiv" <#if recForm.id??&&recForm.deadline??>style="display:none"</#if>>
                            <label for="deadline" class="control-label x85">限办时间：</label>
                            <input type="radio" name="deadlineHour" data-toggle="icheck" value="6" data-label="6小时&nbsp;&nbsp;" >
                            <input type="radio" name="deadlineHour" data-toggle="icheck" value="24" data-label="一天" > 
                            <label  class="control-label x85">自定义：</label>   
                           	<input type="text" class="input-nm" name="deadlineHour" id="deadlineHour" value="" data-rule="integer" size="7" >                   
                        </td>                                                                        
					</tr>									
					<tr>      
	                    <td colspan="4">
	                        <label for="content" class="control-label x85">来文内容：</label>
	                        <div style="display: inline-block; vertical-align: middle;">
	                            <textarea name="content" id="content" class="j-content" style="width: 700px;" data-toggle="kindeditor" data-items=" bold" data-minheight="200">
	                              ${(recForm.content)!} 
	                            </textarea>
	                        </div>
	                    </td>
					</tr>
					<#--	<tr>      
	                         <td colspan="2">
                              <label for="content" class="control-label x85">来文内容：</label>
                              <textarea name="content" id="content" cols="50" rows="5">${(recForm.content)!}</textarea>
                             </td>
					   </tr>-->
					<tr>
					    <td colspan="4">
	                        <label for="remark" class="control-label x85">相关情况：</label>
	                        <div style="display: inline-block; vertical-align: middle;">
	                              <textarea name="remark" id="remark" class="j-content" style="width: 700px;" data-toggle="kindeditor" data-items=" bold" data-minheight="200" >
	                            ${(recForm.remark)!}
	                            </textarea>
	                        </div>
	                    </td>						
					</tr>
		<#--			 <tr>      
	                         <td colspan="2">
                              <label for="remark" class="control-label x85">相关情况：</label>
                              <textarea name="remark" id="remark" cols="50" rows="5">${(recForm.remark)!}</textarea>
                             </td>
					 </tr>	-->				
                </tbody>
            </table>
        </div>
       
    </form>
</div>
<script language="JavaScript" type="text/javascript" src="${wwwroot}/resources/js/ajax_search.js"></script>
<link href="${wwwroot}/resources/css/ajax.css" rel="stylesheet">
<script>
	$('#deadlineHour').bind("change",function(){
		$("input:radio[name='deadlineHour']").iCheck('uncheck');
	});

function editLimit()
{
	$('#limitDiv').hide();
	$('#hourDiv').show();
}
</script> 
