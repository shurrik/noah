<div class="bjui-pageContent">
    <form action="${wwwroot}/admin/attachment/save" id="j_custom_form" data-toggle="validate" data-alertmsg="false" reloadNavtab="true">
        <input type="hidden" name="id" value="${(attachment.id)!}" />
        <div class="pageFormContent" data-layout-h="0">
            <table class="table table-condensed table-hover" width="100%">
                <tbody>
                    <tr>
                        <td>
                            <label for="attachType" class="control-label x85">附件类型：</label>
                            <input type="text" name="attachType" id="attachType" value="${(attachment.attachType)!}" data-rule="required" >
                        </td>							
                        <td>
                            <label for="docId" class="control-label x85">文档ID：</label>
                            <input type="text" name="docId" id="docId" value="${(attachment.docId)!}" data-rule="required" >
                        </td>							
                        <td>
                            <label for="attachUrl" class="control-label x85">附件地址：</label>
                            <input type="text" name="attachUrl" id="attachUrl" value="${(attachment.attachUrl)!}" data-rule="required" >
                        </td>							
					</tr>
					<tr>
                        <td>
                            <label for="createDate" class="control-label x85">创建日期：</label>
                            <input type="text" name="createDate" id="createDate" value="${(attachment.createDate)!}" data-rule="required" >
                        </td>							
                        <td>
                            <label for="updateDate" class="control-label x85">更新日期：</label>
                            <input type="text" name="updateDate" id="updateDate" value="${(attachment.updateDate)!}" data-rule="required" >
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
