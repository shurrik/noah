<div class="bjui-pageContent">
    <form action="${wwwroot}/admin/dictionary/save" id="editForm" data-toggle="validate" data-alertmsg="false" reloadNavtab="true">
         <div class="bjui-footBar">
            <ul>
                <li><button type="submit" class="btn btn-success" data-icon="save">保存</button></li>
                <li><button type="button" class="btn btn-danger" data-icon="close">取消</button></li>
            </ul>
        </div>
        <input type="hidden" name="id" value="${(dictionary.id)!}" />
        <div class="pageFormContent" data-layout-h="0">
            <table class="table table-condensed table-hover" width="100%">
                <tbody>
                    <tr>
                        <td>
                            <label for="Propertkey" class="control-label x85">属性名称：</label>
                            <input type="text" name="Propertkey" id="Propertkey" value="${(dictionary.propertkey)!}" data-rule="required" >
                        </td>							
                        <td>
                            <label for="Propertvalue" class="control-label x85">属性值：</label>
                            <input type="text" name="Propertvalue" id="Propertvalue" value="${(dictionary.propertvalue)!}" data-rule="required" >
                        </td>	
                        <!--						
                        <td>
                            <label for="createDate" class="control-label x85">创建日期：</label>
                       <input type="text" name="createDate" id="createDate" value="${(dictionary.createDate?string('yyyy-MM-dd'))!}" data-toggle="datepicker" data-rule="required;date" size="15">
                        </td>	
                        </tr>						
                        <td>
                            <label for="updateDate" class="control-label x85">更新日期：</label>
                             <input type="text" name="updateDate" id="updateDate" value="${(dictionary.updateDate?string('yyyy-MM-dd'))!}" data-toggle="datepicker" data-rule="required;date" size="15">
                           </td>	
                           -->				
                    </tr>
                </tbody>
            </table>
        </div>
       
    </form>
</div>
