<script type="text/javascript">
//选择事件
function S_NodeCheck(e, treeId, treeNode) {
    var zTree = $.fn.zTree.getZTreeObj(treeId),
        nodes = zTree.getCheckedNodes(true)
    var ids = '', names = ''
    
    for (var i = 0; i < nodes.length; i++) {
        ids   += ','+ nodes[i].id
        names += ','+ nodes[i].name
    }
    if (ids.length > 0) {
        ids = ids.substr(1), names = names.substr(1)
    }
    
    $('#rids').val(ids);
    var $from = $('#'+ treeId).data('fromObj')
    
    if ($from && $from.length) $from.val(names)
}
//单击事件
function S_NodeClick(event, treeId, treeNode) {
    //var zTree = $.fn.zTree.getZTreeObj(treeId)
    
    //zTree.checkNode(treeNode, !treeNode.checked, true, true)
    
    event.preventDefault()
}
</script>

<div class="bjui-pageContent">
    <form action="${wwwroot}/admin/roleresource/save" id="j_custom_form" data-toggle="validate" data-alertmsg="false" reloadNavtab="true">
        
        <input type="hidden" id="rids" name="rids" value="${(rids)!}" />
        <input type="hidden" id="roleId" name="roleId" value="${(role.id)!}" />
        <div class="pageFormContent" data-layout-h="0">
            <table class="table table-condensed table-hover" width="100%">
                <tbody>
                    <tr>
                        <td>
                            <label for="roleId" class="control-label x85">角色名称：</label>
                            ${(role.name)!}
                            <#--
                            <input type="text" name="roleId" id="roleId" value="${(role.id)!}" data-rule="required" >
                            -->
                        </td>							
                            <td>
                            	<label for="roleId" class="control-label x85">选择资源：</label>
                                <input type="text" name="menus" id="j_ztree_menus1" data-toggle="selectztree" size="18" data-tree="#j_select_tree1" readonly>
                                <ul id="j_select_tree1" class="ztree hide" data-toggle="ztree" data-expand-all="true" data-check-enable="true" data-on-check="S_NodeCheck" data-on-click="S_NodeClick">
                                
									<@resourceList pid="root">
										<#list resources as topRes>
											<#assign roleTopRes=((roleResourceMap[topRes.id])!)>
											<li data-id="${(topRes.id)!}" data-pid="${(topRes.pid)!}" <#if roleTopRes??&&roleTopRes!="">data-checked="true"</#if>>${(topRes.name)!}</li>
										<@resourceList pid=topRes.id>
											<#list resources as res>
												<#assign roleRes=((roleResourceMap[res.id])!)>
												<li data-id="${(res.id)!}" data-pid="${(res.pid)!}" <#if roleRes??&&roleRes!="">data-checked="true"</#if>>${(res.name)!}</li>
											</#list>
										</@resourceList>											
										</#list>
									</@resourceList>
									<#--                                
                                    <li data-id="1" data-pid="0">表单元素</li>
                                    <li data-id="10" data-pid="1" data-url="form-button.html" data-tabid="form-button">按钮</li>
                                    <li data-id="11" data-pid="1" data-url="form-input.html" data-tabid="form-input">文本框</li>
                                    <li data-id="12" data-pid="1" data-url="form-select.html" data-tabid="form-select">下拉选择框</li>
                                    <li data-id="13" data-pid="1" data-url="form-checkbox.html" data-tabid="table">复选、单选框</li>
                                    <li data-id="14" data-pid="1" data-url="form.html" data-tabid="form">表单综合演示</li>
                                    <li data-id="2" data-pid="0">表格</li>
                                    <li data-id="20" data-pid="2" data-url="table.html" data-tabid="table">普通表格</li>
                                    <li data-id="21" data-pid="2" data-url="table-fixed.html" data-tabid="table-fixed">固定表头表格</li>
                                    <li data-id="22" data-pid="2" data-url="table-edit.html" data-tabid="table-edit">可编辑表格</li>
                                    -->
                                </ul>
                            </td>					
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="bjui-footBar">
            <ul>
             
                <li><button type="submit" class="btn-default" data-icon="save">保存</button></li>
                   <li><button type="button" class="btn-close" data-icon="close">取消</button></li>
            </ul>
        </div>
    </form>
</div>
