<div class="bjui-pageContent">
    <form id="editForm" action="${wwwroot}/admin/recform/saveverify" id="j_custom_form" data-toggle="validate" data-alertmsg="false" reloadNavtab="true">
                <div class="bjui-footBar">
            <ul>            
                <li><button type="button" class="btn-close btn-nm" data-icon="close">取消</button></li>   
             <li><button type="submit" class="btn-default btn-nm" data-icon="save">保存</button></li>            
            </ul>
        </div>
        <input type="hidden" name="id" value="${(recForm.id)!}" />
        <div class="pageFormContent" data-layout-h="0">
            <table class="table table-condensed table-hover" width="100%">
                <tbody>
                    <tr>
                        <td>
                            <label for="depId" class="control-label x85">来文单位：</label>
                            <@p.deptSelector id=(recForm.depId)! val=(recForm.depName)! idName="depId" valName="depName" depts=depts />
                        </td>							
                        <td>
                            <label for="no" class="control-label x85">来文编号：</label>
                            <input type="text" name="no" id="no" value="${(recForm.no)!}" data-rule="required" maxlength="100">
                        </td>							
					</tr>
                    <tr>
                        <td colspan="2">
                            <label for="docNo" class="control-label x85">收文编号：</label>
                            <input type="text" name="docNo" id="docNo" value="${(recForm.docNo)!}" data-rule="required" size="80" maxlength="100">
                        </td>							
					</tr>					
					<tr>
                        <td colspan="2">
                            <label for="title" class="control-label x85">来文标题：</label>
							<textarea name="title" id="title" cols="80" rows="2" data-toggle="autoheight">${(recForm.title)!}</textarea>                            
                        </td>
					</tr>
					<tr>
                        <td>
                            <label for="secretClass" class="control-label x85">密级：</label>
                            <@p.secretSelector name="secretClass" value=(recForm.secretClass)! />
                            <#--
						    <select name="secretClass" id="secretClass" data-toggle="selectpicker">
						    	<option value="普通" <#if recForm.secretClass??&recForm.secretClass='普通'>selected</#if>>普通</option>
						    	<option value="秘密" <#if recForm.secretClass??&recForm.secretClass='秘密'>selected</#if>>秘密</option>
						    	<option value="机密" <#if recForm.secretClass??&recForm.secretClass='机密'>selected</#if>>机密</option>
						    	<option value="绝密" <#if recForm.secretClass??&recForm.secretClass='绝密'>selected</#if>>绝密</option>
						    </select>       
						    -->                     
                        </td>					
                        <td>
                            <label for="title" class="control-label x85">收文人：</label>
							<@p.userSelector id=(recForm.receiverId)! val=(recForm.receiver)! idName="receiverId" valName="receiver" users=users />                            
                        </td>
                        <#--
                        <td>
                            <label for="deadline" class="control-label x85">限办时间：</label>
                            <input type="text" name="deadline" id="deadline" value="${(recForm.deadline?string('yyyy-MM-dd HH:00:00'))!}" data-toggle="datepicker">
                        </td>
                        -->
					</tr>
					<tr>
                        <td>
                            <label for="recCount" class="control-label x85">来文份数：</label>
                            <input type="text" name="recCount" id="recCount" value="${(recForm.recCount)!}"  data-rule="integer" maxlength="10">
                        </td>
                        <td>
                          <#if recForm.deadline??>
                            <input type="text" name="timeLimit" id="timeLimit" value="${(recForm.deadline?string('yyyy-MM-dd HH:mm:ss'))!}" readonly>
                            <#else>
                            <input type="text" name="timeLimit" id="timeLimit" value="无限办时间" readonly>
                            </#if>    
                        </td>
                    </tr>					
					<tr>
                        <td>
                            <label for="recType" class="control-label x85">收文类型：</label>
                            <input type="radio" name="recType" data-toggle="icheck" value="阅文" data-label="阅文&nbsp;&nbsp;" <#if recForm.recType??&recForm.recType='阅文'>checked</#if> >
                            <input type="radio" name="recType" data-toggle="icheck" value="办文" data-label="办文" <#if !recForm.recType??||(recForm.recType??&recForm.recType='办文')>checked</#if> >
                        </td>
                    </tr>    
					<tr>
                        <td>
                            <label for="chargeManId" class="control-label x85">负责人：</label>
                            <@p.userSelector id=(recForm.chargeManId)! val=(recForm.chargeMan)! idName="chargeManId" valName="chargeMan" users=users />
                        </td>
                        <td>
                            <label for="contractorId" class="control-label x85">承办人：</label>
                            <@p.userSelector id=(recForm.contractorId)! val=(recForm.contractor)! idName="contractorId" valName="contractor" users=users />
                        </td>                                                						
					</tr>										
					<tr>
                        <td colspan="2">
                            <label for="content" class="control-label x85">来文内容：</label>
                            <textarea name="content" id="content" cols="50" rows="5" maxlength="150">${(recForm.content)!}</textarea>
                            <p align="center" style="font-family:幼圆; font-size:10pt;">(限0-150字以内可以输入!)</P>
                       
                        </td>							
					</tr>
					<tr>
                        <td colspan="2">
                            <label for="remark" class="control-label x85">相关情况：</label>
                            <textarea name="remark" id="remark" cols="50" rows="5" maxlength="150" placehold="限0-150字以内可以输入">${(recForm.remark)!}</textarea>
                            <p align="center" style="font-family:幼圆; font-size:10pt;">(限0-150字以内可以输入!)</P>
                        </td>							
					</tr>					
					<tr>
                        <td colspan="2">
                            <label for="draftAdvice" class="control-label x85">拟办意见：</label>
                            <textarea name="draftAdvice" id="draftAdvice" cols="50" rows="5">${(recForm.draftAdvice)!}</textarea>
                        </td>							
					</tr>
					<tr>
                        <td colspan="2">
                            <label for="progress" class="control-label x85">办理情况：</label>
                            <textarea name="progress" id="progress" cols="50" rows="5">${(recForm.progress)!}</textarea>
                        </td>							
					</tr>
					<tr>
                        <td colspan="2">
                        <#--
                            <label for="submitAdvice" class="control-label x85" id="submitAdviceLabel"><#if recForm.recType??&recForm.recType='办文'>呈批<#else>呈阅</#if>意见：</label>
                            -->
							<label for="submitAdvice" class="control-label x85" id="submitAdviceLabel">呈批/阅意见：</label>                            
                            <textarea name="submitAdvice" id="submitAdvice" cols="50" rows="5">${(recForm.submitAdvice)!}</textarea>
                        </td>							
					</tr>										
                </tbody>
            </table>
        </div>
        
    </form>
</div>
