<div class="bjui-pageContent">
    <form action="${wwwroot}/admin/processunit/save" id="editForm" data-toggle="validate" data-alertmsg="false" reloadNavtab="true">
         <div class="bjui-footBar" >
            <ul>
                <li><button type="button" class="btn btn-danger" data-icon="close">取消</button></li>  
              <li><button type="submit" class="btn btn-success" data-icon="save">保存</button></li>          
            </ul>
        </div>
        <input type="hidden" name="id" value="${(processunit.id)!}" />
        <div class="pageFormContent" data-layout-h="0">
            <table class="table table-condensed table-hover" width="100%">
                <tbody>
                    <tr>
                        <td>
                            <label for="unitname" class="control-label x85">单位名称：</label>
                            <input type="text" name="unitname" id="unitname" value="${(processunit.unitname)!}" data-rule="required" >
                        </td>	
                        <!--						
                        <td>
                            <label for="createDate" class="control-label x85">创建日期：</label>
                       <input type="text" name="createDate" id="createDate" value="${(processunit.createDate?string('yyyy-MM-dd'))!}" data-toggle="datepicker" data-rule="required;date" size="15">
                        </td>							
                        <td>
                            <label for="updateDate" class="control-label x85">更新日期：</label>
                             <input type="text" name="updateDate" id="updateDate" value="${(processunit.updateDate?string('yyyy-MM-dd'))!}" data-toggle="datepicker" data-rule="required;date" size="15">
                            </td>	
                            -->						
                    </tr>
                </tbody>
            </table>
        </div>
        
    </form>
</div>
