<div class="bjui-pageContent">
    <form action="${wwwroot}/admin/backlog/check" id="checkForm" data-toggle="validate" data-alertmsg="false" reloadNavtab="true">
    <#--
        <input type="hidden" name="id" value="${(recForm.id)!}" />
        -->
        <input type="hidden" id="backLogId" name="backLogId" value="${(backLog.id)!}" />
		<input type="hidden" id="backLogStatus" name="backLogStatus" value="" />        
        <div class="pageFormContent" data-layout-h="0">
            <table class="table table-condensed table-hover" width="100%">
                 <tbody>
                
				<tr>
                    <td colspan="2">
                        <label for="title" class="control-label x85">标题：</label>
                        ${(sendForm.title)!}
                    </td>
				</tr>
                <tr>
                  <td>
		                <label for="draft_dep" class="control-label x85">拟文单位：</label>
		                ${(sendForm.draftDep)!}
	              </td>	
                 <td>
                    <label for="main_dep" class="control-label x85">发送单位：</label>
                    ${(sendForm.mainDep)!}
                 </td>						
                </tr>
                 <tr>
                      <td>
                        <label for="sub_dep" class="control-label x85">抄送单位：</label>
						${(sendForm.subDep)!}                         
	                 </td>	
	                  <td>
                            <label for="print_count" class="control-label x85">份数：</label>
                            ${(sendForm.printCount)!}
                      </td>	
                 </tr>
                  <tr>
		          <td>
                            <label for="secretClass" class="control-label x85">密级：</label>
                            ${(sendForm.secretClass)!}
                   </td>
                    <td>
                            <label for="draftor_name" class="control-label x85">拟文人：</label>
                            ${(sendForm.draftorName)!}
	                </td>
                 </tr>
                 <tr>
                    <td>
                            <label for="recType" class="control-label x85">发文类型：</label>
                            ${(sendForm.type)!}
                    </td>
		             <td>
		                <label for="open" class="control-label x85">公开情况：</label>
		                ${(sendForm.open)!}
		             </td>
                 </tr>
             
               <tr>
               <td>
                   <label for="urgentClass" class="control-label x85">紧急程度：</label>
                    ${(sendForm.urgentClass)!}
               </td>
                 <td>
                   <label for="deadline" class="control-label x85">期限：</label>
                    ${(sendForm.deadline?string('yyyy-MM-dd'))!}
                 </td>
               </tr>
                   <tr>
              
                 <td>
                    <label for="docLegality" class="control-label x85" style="width:150px;">规范性文件合法性检查：</label>
                    ${(sendForm.docLegality)!}
                 </td>
                 </tr>
				<#--><tr>
                    <td colspan="4">
	                        <label for="advice" class="control-label x85">意见：</label>
	                        <div style="display: inline-block; vertical-align: middle;">
	                            <textarea id="flowAdvice" name="advice" class="j-content" style="width: 700px;" data-toggle="kindeditor" data-items="fontname, fontsize, |, forecolor, hilitecolor, bold, italic, underline, removeformat, |, justifyleft, justifycenter, justifyright, insertorderedlist, insertunorderedlist, |, emoticons, image, link" data-minheight="200">
	                            </textarea>
	                        </div>
	                        
	                </td>						
				</tr>-->
				<tr>      
                     <td colspan="2">
                      <label for="advice" class="control-label x85">意见：</label>
                      <textarea name="advice" id="advice" cols="50" rows="5"></textarea>
                     </td>
				</tr>
    
              	<#--<tr>
                    <td colspan="2">
                        <label for="advice" class="control-label x85">意见：</label>
                        <textarea id="flowAdvice" name="advice" cols="50" rows="5"></textarea>
                    </td>							
				</tr>--> 
                </tbody>
            </table>
            <#if advices??&&advices?size gt 0>
	        <table class="table table-bordered table-striped table-hover">
	            <thead>
	                <tr>
	                    <th>姓名</th>
	                    <th>意见</th>
	                    <th>状态</th>
	                    <th>发表时间</th>
	                </tr>
	            </thead>
	            <tbody>
	            	<#list advices as advice>
	                <tr>
	                    <td>${(advice.realName)!}</td>
	                    <td>${(advice.advice)!}</td>
	                    <td>${(advice.status)!}</td>
	                    <td>${(advice.createDate?string('yyyy-MM-dd HH:mm:ss'))!}</td>
	                </tr>	            	
	            	</#list>
	            </tbody>
	        </table>            
            </#if>            
        </div>
        <div class="bjui-footBar">
            <ul>
            	<#list steps as step>
					<li><button type="button" class="btn-default" data-icon="save" onclick="javascript:check('${(step.afterStatus)!}')">${(step.name)!}</button></li>            	
            	</#list>
            	<#if flow.modifyFlag??&&flow.modifyFlag>
            		<li><button type="button" class="btn-red" data-icon="save" onclick="javascript:reject()">修改</button></li>
            	</#if>            	
            	<#--
                <li><button type="button" class="btn-close" data-icon="close">取消</button></li>
                <li><button type="submit" class="btn-default" data-icon="save">保存</button></li>
                -->
            </ul>
        </div>
    </form>
</div>
<script>
function reject()
{
	if($.trim($('#flowAdvice').val())!='')
	{
		$('#checkForm').attr('action','${wwwroot}/admin/backlog/reject');
		$('#checkForm').bjuiajax('ajaxForm');	
	}
	else
	{
		$("body").alertmsg('warn', '发起修改流程时，意见不得为空！');
		return false;
	}
}

function check(status)
{
	valStatus(status,submitForm);
	
}
function valStatus(status,callback)
{
	$('#backLogStatus').val(status);
	callback(); 
}
function submitForm()
{
	$('#checkForm').bjuiajax('ajaxForm');
}
</script>
