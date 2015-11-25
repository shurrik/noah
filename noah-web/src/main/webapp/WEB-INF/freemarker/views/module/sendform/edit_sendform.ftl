<div class="bjui-pageContent">
    <form id="editForm" action="${wwwroot}/admin/sendform/save"  data-toggle="validate" data-alertmsg="false" reloadNavtab="true">
        <input type="hidden" name="id" value="${(sendForm.id)!}" />
        <div class="pageFormContent" data-layout-h="0">
            <table class="table table-condensed table-hover" width="100%">
                <tbody>
				<tr>
                    <td colspan="2">
                        <label for="title" class="control-label x85">标题：</label>
                        <input type="text" name="title" id="title" value="${(sendForm.title)!}" data-rule="required" size="80" maxlength="50">
                    </td>
				</tr>
                <tr>
                  <td>
		                <label for="draft_dep" class="control-label x85">拟文单位：</label>
						<@p.deptSelector id=(sendForm.draftDepId)! val=(sendForm.draftDep)! idName="draftDepId" valName="draftDep" depts=depts />                            
	              </td>	
                 <td>
                    <label for="main_dep" class="control-label x85">发送单位：</label>
					<@p.deptSelector id=(sendForm.mainDepId)! val=(sendForm.mainDep)! idName="mainDepId" valName="mainDep" depts=depts />                            
                 </td>						
                </tr>
                 <tr>
                      <td>
                        <label for="sub_dep" class="control-label x85">抄送单位：</label>
						<@p.deptSelector id=(sendForm.subDepId)! val=(sendForm.subDep)! idName="subDepId" valName="subDep" depts=depts />                            
	                 </td>	
	                  <td>
                            <label for="print_count" class="control-label x85">份数：</label>
                            <input type="text" name="printCount" id="printCount" value="${(sendForm.printCount)!}" size="7" >
                      </td>	
                 </tr>
                 <tr>
                 <td>
                            <label for="open" class="control-label x85">公开情况：</label>
                            <input type="text" name="open" id="open" value="${(sendForm.open)!}" size="20" maxlength="20">
                 </td>
                  <td>
                            <label for="urgent_class" class="control-label x85">紧急程度：</label>
                            <@p.urgentSelector name="urgentClass" value=(sendForm.urgentClass)! />
                   </td>
                 </tr>
                 <tr>
                 <#--
		             <td>
		                        <label for="deadline" class="control-label x85">期限：</label>
		                        <input type="text" name="deadline" id="deadline" value="2015-04-24" value="${(sendForm.deadline)!}" size="10" >
		             </td>-->
            
                 <td>
                            <label for="docLegality" class="control-label x85" style="width:150px;">规范性文件合法性检查：</label>
                            <input type="text" name="docLegality" id="docLegality" value="${(sendForm.docLegality)!}" size="30"  maxlength="20">
                 </td>
                   <td>
                        <label for="deadline" class="control-label x85">期限：</label>
                        <input type="text" name="deadline" id="deadline" value="${(sendForm.deadline?string('yyyy-MM-dd'))!}" data-toggle="datepicker" data-rule="required;date" size="15">
                    </td>
                 </tr>
                  <tr>
		          <td>
                            <label for="secretClass" class="control-label x85">密级：</label>
							<@p.secretSelector name="secretClass" value=(sendForm.secretClass)! />                            
                            <#--
						    <select name="secretClass" id="secretClass" data-toggle="selectpicker">
						    	<option value="普通" <#if sendForm.secretClass??&sendForm.secretClass='普通'>selected</#if>>普通</option>
						    	<option value="秘密" <#if sendForm.secretClass??&sendForm.secretClass='秘密'>selected</#if>>秘密</option>
						    	<option value="机密" <#if sendForm.secretClass??&sendForm.secretClass='机密'>selected</#if>>机密</option>
						    	<option value="绝密" <#if sendForm.secretClass??&sendForm.secretClass='绝密'>selected</#if>>绝密</option>
						    </select> 
						    -->                                                   
                   </td>
                    <td>
                            <label for="draftor_name" class="control-label x85">拟文人：</label>
							<@p.userSelector id=(sendForm.draftorId)! val=(sendForm.draftorName)! idName="draftorId" valName="draftorName" users=users />                            
	                </td>
                 </tr>
                 <tr>
                    <td>
                            <label for="recType" class="control-label x85">发文类型：</label>
                            <input type="radio" name="type" data-toggle="icheck" value="单独发文" data-label="单独发文" <#if !sendForm.type??||(sendForm.type??&sendForm.type='单独发文')>checked</#if> >
                            <input type="radio" name="type" data-toggle="icheck" value="会签发文" data-label="会签发文" <#if sendForm.type??&sendForm.type='会签发文'>checked</#if> >
                    </td>
                 </tr>
                 <tr>
                  <td colspan="2">
                        <label for="comment" class="control-label x85">备注：</label>
                        <input type="text" name="comment" id="comment" value="${(sendForm.comment)!}" data-rule="required" size="80" maxlength="20">
                    </td>
                 </tr>
                </tbody>
            </table>
            
            <#if advices??&&advices?size gt 0>
	        <table class="table table-bordered table-striped table-hover">
	            <thead>
	                <tr>
	                    <th>姓名</th>
	                    <th>意见</th>
	                    <th>状态</th>
	                    <th>发表时间</th>
	                </tr>
	            </thead>
	            <tbody>
	            	<#list advices as advice>
	                <tr>
	                    <td>${(advice.realName)!}</td>
	                    <td>${(advice.advice)!}</td>
	                    <td>${(advice.status)!}</td>
	                    <td>${(advice.createDate?string('yyyy-MM-dd HH:mm:ss'))!}</td>
	                </tr>	            	
	            	</#list>
	            </tbody>
	        </table>            
            </#if>
            
        </div>
        
        <div class="bjui-footBar">
            <ul>
                <li><button type="button" class="btn-close" data-icon="close">取消</button></li>
                <li><button type="submit" class="btn-default" data-icon="save">保存</button></li>
            </ul>
        </div>
    </form>
</div>
