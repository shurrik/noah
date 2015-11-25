<div class="bjui-pageContent">
    <form action="${wwwroot}/admin/role/save" id="j_custom_form" data-toggle="validate" data-alertmsg="false" reloadNavtab="true">
       <div class="bjui-footBar" >
            <ul>
             
                <li><button type="button" class="btn btn-danger" data-icon="close">取消</button></li>    
                  <li><button type="submit" class="btn btn-success" data-icon="save">保存</button></li>        
            </ul>
        </div>
        <input type="hidden" name="id" value="${(role.id)!}" />
        <div class="pageFormContent" data-layout-h="0">
            <table class="table table-condensed table-hover" width="100%">
                <tbody>
                    <tr>
                        <td>
                            <label for="name" class="control-label x85">角色名称：</label>
                            <input type="text" name="name" id="name" value="${(role.name)!}" data-rule="required" >
                        </td>							
					</tr>
                </tbody>
            </table>
        </div>
       
    </form>
</div>
