<script type="text/javascript">
function do_open_layout(event, treeId, treeNode) {
    if (treeNode.isParent) {
        var zTree = $.fn.zTree.getZTreeObj(treeId)
        
        zTree.expandNode(treeNode)
        return
    }
    $(event.target).bjuiajax('doLoad', {url:treeNode.url, target:treeNode.divid})
    
    event.preventDefault()
}
</script>
<div class="bjui-pageContent">
    <div class="" data-layout-h="0">
        <div style="float:left; width:200px;">
            <ul id="layout-tree" class="ztree" data-toggle="ztree" data-expand-all="true" data-on-click="do_open_layout">
                <li data-id="1" data-pid="0">第一业务</li>
                <li data-id="10" data-pid="1" data-url="layout/layout-01.html" data-divid="#layout-01">业务1</li>
                <li data-id="11" data-pid="1" data-url="layout/layout-02.html" data-divid="#layout-02">业务2</li>
                <li data-id="2" data-pid="0">第二业务</li>
                <li data-id="20" data-pid="2" data-url="layout/layout-03.html" data-divid="#layout-01">业务3</li>
                <li data-id="21" data-pid="2" data-url="layout/layout-04.html" data-divid="#layout-02">业务4</li>
            </ul>
        </div>
        <div style="margin-left:210px; height:99.9%; overflow:hidden;">
            <div style="height:50%; overflow:hidden;">
                <fieldset style="height:100%;">
                    <legend>第一/三业务区</legend>
                    <div id="layout-01" style="height:94%; overflow:hidden;">
                        
                    </div>
                </fieldset>
            </div>
            <div style="height:50%; overflow:hidden;">
                <fieldset style="height:100%;">
                    <legend>第二/四业务区</legend>
                    <div id="layout-02" style="height:94%; overflow:hidden;">
                        
                    </div>
                </fieldset>
            </div>
        </div>
    </div>
</div>