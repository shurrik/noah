<div class="bjui-pageContent">
    <form action="${wwwroot}/admin/flowadvice/save" id="j_custom_form" data-toggle="validate" data-alertmsg="false" reloadNavtab="true">
        <input type="hidden" name="id" value="${(flowAdvice.id)!}" />
        <div class="pageFormContent" data-layout-h="0">
            <table class="table table-condensed table-hover" width="100%">
                <tbody>
                    <tr>
                        <td>
                            <label for="docId" class="control-label x85">文单ID：</label>
                            <input type="text" name="docId" id="docId" value="${(flowAdvice.docId)!}" data-rule="required" >
                        </td>							
                        <td>
                            <label for="advice" class="control-label x85">意见：</label>
                            <input type="text" name="advice" id="advice" value="${(flowAdvice.advice)!}" data-rule="required" >
                        </td>							
                        <td>
                            <label for="userId" class="control-label x85">用户ID：</label>
                            <input type="text" name="userId" id="userId" value="${(flowAdvice.userId)!}" data-rule="required" >
                        </td>							
					</tr>
					<tr>
                        <td>
                            <label for="realName" class="control-label x85">姓名：</label>
                            <input type="text" name="realName" id="realName" value="${(flowAdvice.realName)!}" data-rule="required" >
                        </td>							
                        <td>
                            <label for="status" class="control-label x85">状态：</label>
                            <input type="text" name="status" id="status" value="${(flowAdvice.status)!}" data-rule="required" >
                        </td>							
                        <td>
                            <label for="createDate" class="control-label x85">创建日期：</label>
                            <input type="text" name="createDate" id="createDate" value="${(flowAdvice.createDate)!}" data-rule="required" >
                        </td>							
					</tr>
					<tr>
                        <td>
                            <label for="updateDate" class="control-label x85">更新日期：</label>
                            <input type="text" name="updateDate" id="updateDate" value="${(flowAdvice.updateDate)!}" data-rule="required" >
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
