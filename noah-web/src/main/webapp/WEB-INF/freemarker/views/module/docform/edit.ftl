<div class="bjui-pageContent">
    <form action="${wwwroot}/admin/docform/save" id="j_custom_form" data-toggle="validate" data-alertmsg="false" reloadNavtab="true">
        <input type="hidden" name="id" value="${(docForm.id)!}" />
        <div class="pageFormContent" data-layout-h="0">
            <table class="table table-condensed table-hover" width="100%">
                <tbody>
                    <tr>
                        <td>
                            <label for="title" class="control-label x85">标题：</label>
                            <input type="text" name="title" id="title" value="${(docForm.title)!}" data-rule="required" >
                        </td>							
                        <td>
                            <label for="sendDepId" class="control-label x85">发文单位ID：</label>
                            <input type="text" name="sendDepId" id="sendDepId" value="${(docForm.sendDepId)!}" data-rule="required" >
                        </td>							
                        <td>
                            <label for="sendDep" class="control-label x85">发文单位：</label>
                            <input type="text" name="sendDep" id="sendDep" value="${(docForm.sendDep)!}" data-rule="required" >
                        </td>							
					</tr>
					<tr>
                        <td>
                            <label for="no" class="control-label x85">发文编号：</label>
                            <input type="text" name="no" id="no" value="${(docForm.no)!}" data-rule="required" >
                        </td>							
                        <td>
                            <label for="content" class="control-label x85">发文内容：</label>
                            <input type="text" name="content" id="content" value="${(docForm.content)!}" data-rule="required" >
                        </td>							
                        <td>
                            <label for="remark" class="control-label x85">相关情况：</label>
                            <input type="text" name="remark" id="remark" value="${(docForm.remark)!}" data-rule="required" >
                        </td>							
					</tr>
					<tr>
                        <td>
                            <label for="chargeManId" class="control-label x85">负责人ID：</label>
                            <input type="text" name="chargeManId" id="chargeManId" value="${(docForm.chargeManId)!}" data-rule="required" >
                        </td>							
                        <td>
                            <label for="chargeMan" class="control-label x85">负责人：</label>
                            <input type="text" name="chargeMan" id="chargeMan" value="${(docForm.chargeMan)!}" data-rule="required" >
                        </td>							
                        <td>
                            <label for="contractorId" class="control-label x85">承办人ID：</label>
                            <input type="text" name="contractorId" id="contractorId" value="${(docForm.contractorId)!}" data-rule="required" >
                        </td>							
					</tr>
					<tr>
                        <td>
                            <label for="contractor" class="control-label x85">承办人：</label>
                            <input type="text" name="contractor" id="contractor" value="${(docForm.contractor)!}" data-rule="required" >
                        </td>							
                        <td>
                            <label for="year" class="control-label x85">年份：</label>
                            <input type="text" name="year" id="year" value="${(docForm.year)!}" data-rule="required" >
                        </td>							
                        <td>
                            <label for="month" class="control-label x85">月份：</label>
                            <input type="text" name="month" id="month" value="${(docForm.month)!}" data-rule="required" >
                        </td>							
					</tr>
					<tr>
                        <td>
                            <label for="quarter" class="control-label x85">季度：</label>
                            <input type="text" name="quarter" id="quarter" value="${(docForm.quarter)!}" data-rule="required" >
                        </td>							
                        <td>
                            <label for="progress" class="control-label x85">办理情况：</label>
                            <input type="text" name="progress" id="progress" value="${(docForm.progress)!}" data-rule="required" >
                        </td>							
                        <td>
                            <label for="status" class="control-label x85">状态：</label>
                            <input type="text" name="status" id="status" value="${(docForm.status)!}" data-rule="required" >
                        </td>							
					</tr>
					<tr>
                        <td>
                            <label for="createDate" class="control-label x85">创建日期：</label>
                            <input type="text" name="createDate" id="createDate" value="${(docForm.createDate)!}" data-rule="required" >
                        </td>							
                        <td>
                            <label for="updateDate" class="control-label x85">更新日期：</label>
                            <input type="text" name="updateDate" id="updateDate" value="${(docForm.updateDate)!}" data-rule="required" >
                        </td>							
                        <td>
                            <label for="publishDate" class="control-label x85">发文日期：</label>
                            <input type="text" name="publishDate" id="publishDate" value="${(docForm.publishDate)!}" data-rule="required" >
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
