<#macro pagination pageCtx pageParam> 
    <div class="bjui-footBar">
        <div class="pages">
            <span>每页&nbsp;</span>
            <div class="selectPagesize">
                <select data-toggle="selectpicker" data-toggle-change="changepagesize">
                	<option value="20" <#if pageParam.pageSize=20>selected</#if>>20</option>
                    <option value="30" <#if pageParam.pageSize=30>selected</#if>>30</option>
                    <option value="60" <#if pageParam.pageSize=60>selected</#if>>60</option>
                    <option value="120" <#if pageParam.pageSize=120>selected</#if>>120</option>
                    <option value="150" <#if pageParam.pageSize=150>selected</#if>>150</option>
                    <option value="1000" <#if pageParam.pageSize=1000>selected</#if>>1000</option>
                </select>
            </div>
            <span>&nbsp;条，共 ${(pageCtx.records)!} 条</span>
        </div>
        <div class="pagination-box" data-toggle="pagination" data-total="${(pageCtx.records)!}" data-page-size="${(pageParam.pageSize)!}" data-page-current="${(pageParam.pageCurrent)!}">
        </div>
    </div>
</#macro>  
<#macro userSelector id val idName valName users  curUser>
	<select name="${idName!}" id="${idName!}" data-toggle="selectpicker" data-rule="" onchange="javascript:alert($('#${valName!}').val());$('#${valName!}').val($(this).find("option:selected").text());$('#${valName!}').val());">
		<option value="" selected>---</option>
		<#list users as user>
			<option value="${(user.id)!}" <#if (id??&id=user.id)||(id=''&curUser??&user.id=curUser.id)>selected</#if>>${(user.realName)!}</option>
		</#list>
	</select>
	<input type="hidden" id="${valName!}" name="${valName!}" value="<#if val!=''>${val!}<#else>${(curUser.realName)!}</#if>">
<script>
    $("#${idName!}").change(function() {
    	$('#editForm input[id="${valName!}"]').val($(this).find("option:selected").text());
    }); 
</script>	
</#macro>
<#macro chargeMan id val idName valName users>
	<select name="${idName!}" id="${idName!}" data-toggle="selectpicker" data-rule="" onchange="javascript:alert($('#${valName!}').val());$('#${valName!}').val($(this).find("option:selected").text());$('#${valName!}').val());">
			<option value="">---</option>
		<#list users as user>
			<option value="${(user.id)!}" <#if id??&id=user.id>selected</#if>>${(user.realName)!}</option>
		</#list>
	</select>
	<input type="hidden" id="${valName!}" name="${valName!}" value="${val!}">
<script>
    $("#${idName!}").change(function() {
    	$('#editForm input[id="${valName!}"]').val($(this).find("option:selected").text());
    }); 
</script>	
</#macro>
<#macro deptSelector id val idName valName depts>
	<select name="${valName!}_dept" id="${valName!}_dept" data-toggle="selectpicker">    
    		<option value="">---</option>
    	<#list depts as dept>
    		<option value="${(dept.id)!}" <#if val??&val=dept.name>selected</#if>>${(dept.name)!}</option>
    	</#list>
    </select>
    <input type="text" name="${valName!}" id="${valName!}" value="${val!}" data-rule="required" size="20" class="input-nm">
    <input type="hidden" id="${idName!}" name="${idName!}" value="${id!}">
<script>
	$('#editForm input[id="${valName!}"]').change(function(){
		$('#editForm input[id="${idName!}"]').val('');
	});
    $("#${valName!}_dept").change(function() {
    	$('#editForm input[id="${valName!}"]').val($(this).find("option:selected").text());
    	$('#editForm input[id="${idName!}"]').val($(this).find("option:selected").val());
    }); 
</script>   
</#macro>
<#macro recFormRemark>
注 : 此单随文件一起运转、立卷、归档。 ${(redForm.Confidential)!}： ${(redForm.name)!} ${(redForm.phone)!} ${(redForm.phonenumber)!}
</#macro>

<#macro urgentSelector name value>
<#assign urgentList=['加急','特急']/> 
	<select name="${name!}" id="${name!}" data-toggle="selectpicker" data-rule="required">
			<option value="">---</option>
			<#list urgentList as urgent>
			<option value="${(urgent)!}" <#if urgent==value>selected</#if>>${urgent}</option>	
			</#list>
	</select>
</#macro>

<#macro secretSelector name value>
<#assign secretList=['秘密','机密','绝密']/> 
	<select name="${name!}" id="${name!}" data-toggle="selectpicker" data-rule="">
			<option value="">---</option>
			<#list secretList as secret>
			<option value="${(secret)!}" <#if secret==value>selected</#if>>${secret}</option>	
			</#list>
	</select>
</#macro>
<#macro secretPrintFormat secret>
${(secret?replace('密',''))!}
</#macro>
<#macro subStr content length>
	<#if content??>
		<#if (content?length<=length)>${content!}<#else>${content[0..length-1]!}...</#if>
	</#if>
</#macro>

