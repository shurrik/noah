<div class="bjui-pageContent">
    <form action="${wwwroot}/admin/backlog/save" id="j_custom_form" data-toggle="validate" data-alertmsg="false" reloadNavtab="true">
        <input type="hidden" name="id" value="${(backLog.id)!}" />
        <div class="pageFormContent" data-layout-h="0">
            <table class="table table-condensed table-hover" width="100%">
                <tbody>
                    <tr>
                        <td>
                            <label for="docId" class="control-label x85">文单ID：</label>
                            <input type="text" name="docId" id="docId" value="${(backLog.docId)!}" data-rule="required" >
                        </td>							
                        <td>
                            <label for="subject" class="control-label x85">主题：</label>
                            <input type="text" name="subject" id="subject" value="${(backLog.subject)!}" data-rule="required" >
                        </td>							
                        <td>
                            <label for="remark" class="control-label x85">备注：</label>
                            <input type="text" name="remark" id="remark" value="${(backLog.remark)!}" data-rule="required" >
                        </td>							
					</tr>
					<tr>
                        <td>
                            <label for="flowId" class="control-label x85">流程ID：</label>
                            <input type="text" name="flowId" id="flowId" value="${(backLog.flowId)!}" data-rule="required" >
                        </td>							
                        <td>
                            <label for="flowName" class="control-label x85">流程名称：</label>
                            <input type="text" name="flowName" id="flowName" value="${(backLog.flowName)!}" data-rule="required" >
                        </td>							
                        <td>
                            <label for="status" class="control-label x85">状态：</label>
                            <input type="text" name="status" id="status" value="${(backLog.status)!}" data-rule="required" >
                        </td>							
					</tr>
					<tr>
                        <td>
                            <label for="createDate" class="control-label x85">创建日期：</label>
                            <input type="text" name="createDate" id="createDate" value="${(backLog.createDate)!}" data-rule="required" >
                        </td>							
                        <td>
                            <label for="updateDate" class="control-label x85">更新日期：</label>
                            <input type="text" name="updateDate" id="updateDate" value="${(backLog.updateDate)!}" data-rule="required" >
                        </td>							
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="bjui-footBar">
            <ul>
                <li><button type="button" class="btn btn-danger" data-icon="close">取消</button></li>
                <li><button type="submit" class="btn btn-success" data-icon="save">保存</button></li>
            </ul>
        </div>
    </form>
</div>
