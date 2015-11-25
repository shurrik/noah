<div class="bjui-pageContent">
    <form action="${wwwroot}/admin/flowstep/save" id="j_custom_form" data-toggle="validate" data-alertmsg="false" reloadNavtab="true">
     <div class="bjui-footBar" >
            <ul>
               <li><button type="button" class="btn btn-danger" data-icon="close">取消</button></li>  
              <li><button type="submit" class="btn btn-success" data-icon="save">保存</button></li>            
            </ul>
        </div>
        <input type="hidden" name="id" value="${(flowStep.id)!}" />
        <div class="pageFormContent" data-layout-h="0">
            <table class="table table-condensed table-hover" width="100%">
                <tbody>
                    <tr>
                    <#--
                        <td>
                            <label for="flowId" class="control-label x85">流程ID：</label>
                            <input type="text" name="flowId" id="flowId" value="${(flowStep.flowId)!}" data-rule="required" >
                        </td>							
                        <td>
                            <label for="flowName" class="control-label x85">流程名称：</label>
                            <input type="text" name="flowName" id="flowName" value="${(flowStep.flowName)!}" data-rule="required" >
                        </td>	
                        -->
                        <td>
                            <label for="flowId" class="control-label x85">流程名称：</label>
                            <select name="flowId" id="flowId" data-toggle="selectpicker">
                            	<#list flows as flow>
                            		<option value="${(flow.id)!}">${(flow.name)!}</option>
                            	</#list>
                            </select>
                        </td>                        						
                        <td>
                            <label for="name" class="control-label x85">步骤名称：</label>
                            <input type="text" name="name" id="name" value="${(flowStep.name)!}" data-rule="required" >
                        </td>							
					</tr>
					<tr>
                        <td>
                            <label for="beforeStatus" class="control-label x85">处理前状态：</label>
                            <input type="text" name="beforeStatus" id="beforeStatus" value="${(flowStep.beforeStatus)!}" data-rule="required" >
                        </td>							
                        <td>
                            <label for="afterStatus" class="control-label x85">处理后状态：</label>
                            <input type="text" name="afterStatus" id="afterStatus" value="${(flowStep.afterStatus)!}" data-rule="required" >
                        </td>							
                        <td>
                            <label for="stepOrder" class="control-label x85">步骤顺序：</label>
                            <input type="text" name="stepOrder" id="stepOrder" value="${(flowStep.stepOrder)!}" data-rule="required" >
                        </td>							
					</tr>
                </tbody>
            </table>
        </div>
        
    </form>
</div>
