<div class="bjui-pageContent">
    <form action="${wwwroot}/admin/flow/save" id="j_custom_form" data-toggle="validate" data-alertmsg="false" reloadNavtab="true">
       <div class="bjui-footBar">
            <ul>
               <li><button type="button" class="btn btn-danger" data-icon="close">取消</button></li>  
              <li><button type="submit" class="btn btn-success" data-icon="save">保存</button></li>     
            </ul>
        </div>
        <input type="hidden" name="id" value="${(flow.id)!}" />
        <div class="pageFormContent" data-layout-h="0">
            <table class="table table-condensed table-hover" width="100%">
                <tbody>
                    <tr>
                        <td>
                            <label for="name" class="control-label x85">流程名称：</label>
                            <input type="text" name="name" id="name" value="${(flow.name)!}" data-rule="required" >
                        </td>							
                        <td>
                            <label for="tableName" class="control-label x85">数据表：</label>
                            <input type="text" name="tableName" id="tableName" value="${(flow.tableName)!}" data-rule="required" >
                        </td>
					</tr>
					<tr>					                        							
                        <td>
                            <label for="startStatus" class="control-label x85">开始状态：</label>
                            <input type="text" name="startStatus" id="startStatus" value="${(flow.startStatus)!}" data-rule="required" >
                        </td>							
                        <td>
                            <label for="endStatus" class="control-label x85">结束状态：</label>
                            <input type="text" name="endStatus" id="endStatus" value="${(flow.endStatus)!}" data-rule="required" >
                        </td>
                    </tr>
					<tr>
                        <td>
                            <label for="modifyFlag" class="control-label x85">可以修改：</label>
                            <select name="modifyFlag" id="modifyFlag" data-toggle="selectpicker">
                            	<option value="1" <#if flow.modifyFlag??&&flow.modifyFlag>selected</#if>>是</option>
                            	<option value="0" <#if flow.modifyFlag??&&!flow.modifyFlag>selected</#if>>否</option>
                            </select>
                        </td>					                                            
                        <td>
                            <label for="modifyStatus" class="control-label x85">修改状态：</label>
                            <input type="text" name="modifyStatus" id="modifyStatus" value="${(flow.modifyStatus)!}" >
                        </td>                        					
                    </tr>
					<tr>					                        							
                        <td>
                            <label for="nameSpace" class="control-label x85">命名空间：</label>
                            <input type="text" name="nameSpace" id="nameSpace" value="${(flow.nameSpace)!}" data-rule="required" >
                        </td>							
                    </tr>                    
                </tbody>
            </table>
        </div>
        
    </form>
</div>
