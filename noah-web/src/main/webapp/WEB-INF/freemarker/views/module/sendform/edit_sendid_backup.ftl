<div class="bjui-pageContent">
    <form id="editForm" action="${wwwroot}/admin/sendform/sendformidsave"  data-toggle="validate" data-alertmsg="false" reloadNavtab="true">
        <input type="hidden" name="id" value="${(sendForm.id)!}" />
        <div class="pageFormContent" data-layout-h="0">
            <table class="table table-condensed table-hover" width="100%">
                <tbody>
               
                 <tr>
	                  
                     <td>
                        <label for="no" class="control-label x85">发文编号：</label>
                        <input type="text" name="no" id="no" value="${(sendForm.no)!}" >
                    </td>
                  </tr>

                </tbody>
            </table>
        </div>
        <div class="bjui-footBar">
            <ul>
                <li><button type="button" class="btn-close" data-icon="close">取消</button></li>
                <li><button type="submit" class="btn-default" data-icon="save">保存</button></li>
            </ul>
        </div>
    </form>
</div>
