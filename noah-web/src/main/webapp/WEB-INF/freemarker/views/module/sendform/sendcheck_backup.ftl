<div class="bjui-pageContent">
    <form action="${wwwroot}/admin/backlog/check" id="checkForm" data-toggle="validate" data-alertmsg="false" reloadNavtab="true">
    <#--
        <input type="hidden" name="id" value="${(recForm.id)!}" />
        -->
        <input type="hidden" id="backLogId" name="backLogId" value="${(backLog.id)!}" />
		<input type="hidden" id="backLogStatus" name="backLogStatus" value="" />        
        <div class="pageFormContent" data-layout-h="0">
            <table class="table table-condensed table-hover" width="100%">
                 <tbody>
                
                <tr>
                  <td>
		                <label for="draft_dep" class="control-label x85">拟文单位：</label>
						<@p.deptSelector id=(sendForm.draftDepId)! val=(sendForm.draftDep)! idName="draftDepId" valName="draftDep" depts=depts />                            
	              </td>	
              	  <td>
                        <label for="title" class="control-label x85">标题：</label>
                        <input type="text" name="title" id="title" value="${(sendForm.title)!}" data-rule="required" >
                  </td>							
                </tr>
                 <tr>
	                 <td>
                        <label for="main_dep" class="control-label x85">发送单位：</label>
						<@p.deptSelector id=(sendForm.mainDepId)! val=(sendForm.mainDep)! idName="mainDepId" valName="mainDep" depts=depts />                            
	                 </td>	 
                     <td>
                        <label for="no" class="control-label x85">发文编号：</label>
                        <input type="text" name="no" id="no" value="${(sendForm.no)!}" data-rule="required" >
                    </td>
                  </tr>
                 <tr>
                      <td>
                        <label for="sub_dep" class="control-label x85">抄送单位：</label>
						<@p.deptSelector id=(sendForm.subDepId)! val=(sendForm.subDep)! idName="subDepId" valName="subDep" depts=depts />                            
	                 </td>	
	                  <td>
                            <label for="print_count" class="control-label x85">份数：</label>
                            <input type="text" name="printCount" id="printCount" value="${(sendForm.printCount)!}" size="7" data-rule="integer" >
                      </td>	
                 </tr>
                  <tr>
		          <td>
                            <label for="secretClass" class="control-label x85">密级：</label>
						    <select name="secretClass" id="secretClass" data-toggle="selectpicker">
						    	<option value="普通" <#if sendForm.secretClass??&sendForm.secretClass='普通'>selected</#if>>普通</option>
						    	<option value="秘密" <#if sendForm.secretClass??&sendForm.secretClass='秘密'>selected</#if>>秘密</option>
						    	<option value="机密" <#if sendForm.secretClass??&sendForm.secretClass='机密'>selected</#if>>机密</option>
						    	<option value="绝密" <#if sendForm.secretClass??&sendForm.secretClass='绝密'>selected</#if>>绝密</option>
						    </select>                            
                   </td>
                    <td>
                            <label for="draftor_name" class="control-label x85">拟文人：</label>
							<@p.userSelector id=(sendForm.draftorId)! val=(sendForm.draftorName)! idName="draftorId" valName="draftorName" users=users />                            
	                </td>
                 </tr>
                 <tr>
                    <td>
                            <label for="recType" class="control-label x85">发文类型：</label>
                            <input type="radio" name="type" data-toggle="icheck" value="单独发文" data-label="单独发文" <#if sendForm.type??&sendForm.type='单独发文'>checked</#if> >
                            <input type="radio" name="type" data-toggle="icheck" value="会签发文" data-label="会签发文" <#if !sendForm.type??||(sendForm.type??&sendForm.type='会签发文')>checked</#if> >
                    </td>
                 </tr>
                 <tr>
                      <#--<td colspan="2">
                            <label for="advice" class="control-label x85">意见：</label>
                            <textarea name="advice" id="advice" cols="50" rows="5" text-align:left>
                        			<#list flowadvicelist as flowadvice>
		                            ${(flowadvice.status)!}:${(flowadvice.advice)!}
	                               </#list>
                            </textarea>
                        </td>
                        <td>
                              <#list flowadvicelist as flowadvice>
	                           <input type="" id="hadvice" name="hadvice" value="${(flowadvice.status)!}:${(flowadvice.advice)!}" />
                              </#list>
                          
                        </td>	
                 </tr>--> 
               
                 <tr>
                
                 <td>
                 <label for="advice" class="control-label x85">审核意见：</label>
                  <textarea name="advice" id="advice" cols="50" rows="5" text-align:left>
                        			  <#list flowadvicelist as flowadvice>
                        			<#if flowadvice.status="审核">
		                            ${(flowadvice.status)!}:${(flowadvice.advice)!}
	                               </#if>  </#list>
                            </textarea>
                 </td>
                
                 </tr>
                 <tr>
                    
                 <td>
                 <label for="advice" class="control-label x85">核稿意见：</label>
                  <textarea name="advice1" id="advice" cols="50" rows="5" text-align:left>
                        			 <#list flowadvicelist as flowadvice>
                        			<#if flowadvice.status="核稿">
		                            ${(flowadvice.status)!}:${(flowadvice.advice)!}
	                               </#if>
	                               </#list>
                            </textarea>
                 </td> 
                 </tr>
                 <tr>  
                 <td>
                 <label for="advice" class="control-label x85">签发意见：</label>
                  <textarea name="advice2" id="advice" cols="50" rows="5" text-align:left>
                        		 <#list flowadvicelist as flowadvice>  
                        		<#if flowadvice.status="签发">
		                            ${(flowadvice.status)!}:${(flowadvice.advice)!}
	                               </#if>
	                               </#list>
                            </textarea>
                 
                 </td> 
                 </tr>
                  
                </tbody>
            </table>
        </div>
        <div class="bjui-footBar">
            <ul>
            	<#list steps as step>
					<li><button type="button" class="btn-default" data-icon="save" onclick="javascript:check('${(step.afterStatus)!}')">${(step.name)!}</button></li>            	
            	</#list>
            	<#--
                <li><button type="button" class="btn-close" data-icon="close">取消</button></li>
                <li><button type="submit" class="btn-default" data-icon="save">保存</button></li>
                -->
            </ul>
        </div>
    </form>
</div>
<script>
function check(status)
{
	valStatus(status,submitForm);
	
}
function valStatus(status,callback)
{
	$('#backLogStatus').val(status);
	callback(); 
}
function submitForm()
{
	$('#checkForm').bjuiajax('ajaxForm');
}
</script>
