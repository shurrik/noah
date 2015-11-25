<div class="bjui-pageContent">
    <form action="${wwwroot}/admin/flowuser/save" id="j_custom_form" data-toggle="validate" data-alertmsg="false" reloadNavtab="true">
<div class="bjui-footBar">
            <ul>              
                <li><button type="submit" class="btn btn-success" data-icon="save">保存</button></li>
                  <li><button type="button" class="btn btn-danger" data-icon="close">取消</button></li>
            </ul>
        </div>   
<input type="hidden" name="id" value="${(flowUser.id)!}" />
        <div class="pageFormContent" data-layout-h="0">
            <table class="table table-condensed table-hover" width="100%">
                <tbody>
                    <tr>
                        <td>
                            <label for="stepId" class="control-label x85">流程步骤：</label>
                            <select name="stepId" id="stepId" data-toggle="selectpicker">
                            	<#list steps as step>
                            		<option value="${(step.id)!}">${(step.name)!}</option>
                            	</#list>
                            </select>
                        </td>
                        <td>
                            <label for="userId" class="control-label x85">用户：</label>
                            <select name="userId" id="userId" data-toggle="selectpicker">
                            	<#list users as user>
                            		<option value="${(user.id)!}">${(user.realName)!}</option>
                            	</#list>
                            </select>
                        </td>                                                						
					</tr>
                </tbody>
            </table>
        </div>
       
    </form>
</div>
