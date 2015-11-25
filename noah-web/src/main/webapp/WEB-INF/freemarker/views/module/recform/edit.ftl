<div class="bjui-pageContent">
    <form id="editForm" action="${wwwroot}/admin/recform/save" id="j_custom_form" data-toggle="validate" data-alertmsg="false" reloadNavtab="true">
        <div class="bjui-footBar">
            <ul>
             <li><button type="submit" class="btn-default" data-icon="save">保存</button></li>
                <li><button type="button" class="btn-close" data-icon="close">取消</button></li>               
            </ul>
        </div>
        <input type="hidden" name="id" value="${(recForm.id)!}" />
        <div class="pageFormContent" data-layout-h="0">
            <table class="table table-condensed table-hover" width="100%">
                <tbody>
                    <tr>
                        <td>
                            <label for="depId" class="control-label x85">来文单位：</label>
                            <@p.deptSelector name="depId" depts=depts />
                        </td>							
                        <td>
                            <label for="no" class="control-label x85">来文编号：</label>
                            <input type="text" name="no" id="no" value="${(recForm.no)!}" data-rule="required" >
                        </td>							
					</tr>
					<tr>
                        <td>
                            <label for="title" class="control-label x85">来文标题：</label>
                            <input type="text" name="title" id="title" value="${(recForm.title)!}" data-rule="required" >
                        </td>							
					</tr>
					<tr>
                        <td>
                            <label for="content" class="control-label x85">来文内容：</label>
                            <input type="text" name="content" id="content" value="${(recForm.content)!}" data-rule="required" >
                        </td>							
					</tr>
					<tr>
                        <td>
                            <label for="remark" class="control-label x85">相关情况：</label>
                            <input type="text" name="remark" id="remark" value="${(recForm.remark)!}" >
                        </td>							
					</tr>										
<#--					
					<tr>
                        <td>
                            <label for="chargeMan" class="control-label x85">负责人：</label>
                            <@p.userSelector name="chargeManId" users=users />
                        </td>
                        <td>
                            <label for="chargeMan" class="control-label x85">承办人：</label>
                            <@p.userSelector name="contractorId" users=users />
                        </td>                                                						
					</tr>

					<tr>
                        <td>
                            <label for="advice" class="control-label x85">拟办意见：</label>
                            <input type="text" name="advice" id="advice" value="${(recForm.advice)!}" >
                        </td>							
                        <td>
                            <label for="progress" class="control-label x85">办理情况：</label>
                            <input type="text" name="progress" id="progress" value="${(recForm.progress)!}">
                        </td>							
					</tr>
					-->					
                </tbody>
            </table>
        </div>
       
    </form>
</div>
