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
                        <td>
                            <label for="depId" class="control-label x85">来文单位：</label>
                            ${(recForm.depName)!}
                        </td>							
                        <td>
                            <label for="no" class="control-label x85">来文编号：</label>
                            ${(recForm.no)!}
                        </td>							
					</tr>
					<tr>
                        <td>
                            <label for="title" class="control-label x85">来文标题：</label>
                            ${(recForm.title)!}
                        </td>							
					</tr>
					<tr>
                        <td>
                            <label for="content" class="control-label x85">来文内容：</label>
                            ${(recForm.content)!}
                        </td>							
					</tr>
					<tr>
                        <td>
                            <label for="remark" class="control-label x85">相关情况：</label>
                            ${(recForm.remark)!}
                        </td>							
					</tr>										
					<tr>
                        <td>
                            <label for="chargeMan" class="control-label x85">负责人：</label>
                            ${(recForm.chargeMan)!}
                        </td>
                        <td>
                            <label for="contractor" class="control-label x85">承办人：</label>
                            ${(recForm.contractor)!}
                        </td>                                                						
					</tr>

					<tr>
                        <td>
                            <label for="advice" class="control-label x85">拟办意见：</label>
                            ${(recForm.advice)!}
                        </td>							
                        <td>
                            <label for="progress" class="control-label x85">办理情况：</label>
                            ${(recForm.progress)!}
                        </td>							
					</tr>
					<tr>
                        <td colspan="2">
                            <label for="advice" class="control-label x85">意见：</label>
                            <textarea name="advice" cols="50" rows="5"></textarea>
                        </td>
                        							
					</tr>					
                </tbody>
            </table>
        </div>
        <div class="bjui-footBar">
            <ul>
            	<#list steps as step>
					<li><button type="button" class="btn-default" data-icon="save" onclick="javascript:check('${(step.afterStatus)!}')">${(step.name)!}</button></li>            	
            	</#list>
            	<#--
                <li><button type="button" class="btn-close" data-icon="close">取消</button></li>
                <li><button type="submit" class="btn-default" data-icon="save">保存</button></li>
                -->
            </ul>
        </div>
    </form>
</div>
<script>
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
