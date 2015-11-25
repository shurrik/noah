<div class="bjui-pageContent">
    <form action="${wwwroot}/admin/dept/save" id="j_custom_form" data-toggle="validate" data-alertmsg="false" reloadNavtab="true">
         <div class="bjui-footBar" >
            <ul>
                <li><button type="button" class="btn btn-danger" data-icon="close">取消</button></li>  
              <li><button type="submit" class="btn btn-success" data-icon="save">保存</button></li>          
            </ul>
        </div>
        <input type="hidden" name="id" value="${(dept.id)!}" />
        <div class="pageFormContent" data-layout-h="0">
            <table class="table table-condensed table-hover" width="100%">
                <tbody>
                    <tr>
                        <td>
                            <label for="name" class="control-label x85">部门名称：</label>
                            <input type="text" name="name" id="name" value="${(dept.name)!}" data-rule="required" >
                        </td>
                        <#--
                        <td>
                            <label for="pid" class="control-label x85">上级部门：</label>
                            <select name="pid" id="pid" data-toggle="selectpicker">
                            	<#list depts as dept>
                            		<option value="${(dept.id)!}">${(dept.name)!}</option>
                            	</#list>
                            </select>
                        </td>                        
                        <td>
                            <label for="depOrder" class="control-label x85">顺序：</label>
                            <input type="text" name="depOrder" id="depOrder" value="${(dept.depOrder)!}" data-rule="required" >
                        </td> 
                        -->                       							
					</tr>
                </tbody>
            </table>
        </div>
       
    </form>
</div>
