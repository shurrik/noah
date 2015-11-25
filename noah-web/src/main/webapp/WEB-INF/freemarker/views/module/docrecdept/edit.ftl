<div class="bjui-pageContent">
    <form action="${wwwroot}/admin/docrecdept/save" id="j_custom_form" data-toggle="validate" data-alertmsg="false" reloadNavtab="true">
        <input type="hidden" name="id" value="${(docRecDept.id)!}" />
        <div class="pageFormContent" data-layout-h="0">
            <table class="table table-condensed table-hover" width="100%">
                <tbody>
                    <tr>
                        <td>
                            <label for="depId" class="control-label x85">部门ID：</label>
                            <input type="text" name="depId" id="depId" value="${(docRecDept.depId)!}" data-rule="required" >
                        </td>							
                        <td>
                            <label for="depName" class="control-label x85">部门名称：</label>
                            <input type="text" name="depName" id="depName" value="${(docRecDept.depName)!}" data-rule="required" >
                        </td>							
                        <td>
                            <label for="formId" class="control-label x85">公文单ID：</label>
                            <input type="text" name="formId" id="formId" value="${(docRecDept.formId)!}" data-rule="required" >
                        </td>							
					</tr>
					<tr>
                        <td>
                            <label for="readFlag" class="control-label x85">已阅：</label>
                            <input type="text" name="readFlag" id="readFlag" value="${(docRecDept.readFlag)!}" data-rule="required" >
                        </td>							
                        <td>
                            <label for="createDate" class="control-label x85">创建日期：</label>
                            <input type="text" name="createDate" id="createDate" value="${(docRecDept.createDate)!}" data-rule="required" >
                        </td>							
                        <td>
                            <label for="updateDate" class="control-label x85">更新日期：</label>
                            <input type="text" name="updateDate" id="updateDate" value="${(docRecDept.updateDate)!}" data-rule="required" >
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
