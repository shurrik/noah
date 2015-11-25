<div class="bjui-pageContent">
    <form action="${wwwroot}/admin/flowuser/save" id="j_custom_form" data-toggle="validate" data-alertmsg="false" reloadNavtab="true">
        <input type="hidden" name="id" value="${(flowUser.id)!}" />
        <div class="pageFormContent" data-layout-h="0">
            <table class="table table-condensed table-hover" width="100%">
                <tbody>
                    <tr>
                        <td>
                            <label for="flowId" class="control-label x85">流程ID：</label>
                            <input type="text" name="flowId" id="flowId" value="${(flowUser.flowId)!}" data-rule="required" >
                        </td>							
                        <td>
                            <label for="stepId" class="control-label x85">流程步骤ID：</label>
                            <input type="text" name="stepId" id="stepId" value="${(flowUser.stepId)!}" data-rule="required" >
                        </td>							
                        <td>
                            <label for="userId" class="control-label x85">用户ID：</label>
                            <input type="text" name="userId" id="userId" value="${(flowUser.userId)!}" data-rule="required" >
                        </td>							
					</tr>
					<tr>
                        <td>
                            <label for="realName" class="control-label x85">用户真名：</label>
                            <input type="text" name="realName" id="realName" value="${(flowUser.realName)!}" data-rule="required" >
                        </td>							
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="bjui-footBar">
            <ul>
                <li><button type="button" class="btn-close" data-icon="close">取消</button></li>
                <li><button type="submit" class="btn-default" data-icon="save">保存</button></li>
            </ul>
        </div>
    </form>
</div>
