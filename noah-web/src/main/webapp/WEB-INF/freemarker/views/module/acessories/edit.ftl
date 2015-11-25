<div class="bjui-pageContent">
    <form action="${wwwroot}/admin/acessories/save" id="j_custom_form" data-toggle="validate" data-alertmsg="false" reloadNavtab="true">
        <input type="hidden" name="id" value="${(acessories.id)!}" />
        <div class="pageFormContent" data-layout-h="0">
            <table class="table table-condensed table-hover" width="100%">
                <tbody>
                    <tr>
                        <td>
                            <label for="fileType" class="control-label x85">附件类型</label>
                            <input type="text" name="fileType" id="fileType" value="${(acessories.fileType)!}" data-rule="required" >
                        </td>							
                        <td>
                            <label for="fileId" class="control-label x85">文档ID：</label>
                            <input type="text" name="fileId" id="fileId" value="${(acessories.fileId)!}" data-rule="required" >
                        </td>							
                        <td>
                            <label for="fileUrl" class="control-label x85">附件地址：</label>
                            <input type="text" name="fileUrl" id="fileUrl" value="${(acessories.fileUrl)!}" data-rule="required" >
                        </td>							
					</tr>
					<tr>
                        <td>
                            <label for="fileName" class="control-label x85">附件名称：</label>
                            <input type="text" name="fileName" id="fileName" value="${(acessories.fileName)!}" data-rule="required" >
                        </td>							
                        <td>
                            <label for="createDate" class="control-label x85">创建日期：</label>
                            <input type="text" name="createDate" id="createDate" value="${(acessories.createDate)!}" data-rule="required" >
                        </td>							
                        <td>
                            <label for="updateDate" class="control-label x85">更新日期：</label>
                            <input type="text" name="updateDate" id="updateDate" value="${(acessories.updateDate)!}" data-rule="required" >
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
