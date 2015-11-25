<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>陕西省民政办公系统</title>
<style type="text/css">
    *{margin:0;padding:0;border:0;}
    body {
        font-family: arial, 宋体, serif;
        font-size:16px;
    }
    #nav {
        width:190px;
        line-height: 50px;
        list-style-type: none;
        text-align:left;
    }
    /*==================一级目录===================*/
    #nav a {
        width: 199px;
        height:25px;
        padding-top:2px;
        display: block;
        padding-left:20px;
    }
    #nav li {
        background:#7DBBDA; /*一级目录的背景色*/
        border-bottom:#FFF 1px solid; /*下面的一条白边*/
        float:left;
    }
    #nav li a:hover{
        background:#6ccff7;
    }
    #nav a:link  {
        color:#666; text-decoration:none;
    }
    #nav a:visited  {
        color:#666;text-decoration:none;
    }
    #nav a:hover  {
        color:#FFF;text-decoration:none;font-weight:bold;
    }
    /*==================二级目录===================*/
    #nav li ul {
        list-style:none;
        text-align:left;
    }
    #nav li ul li{
        background: #F8F8F8; /*二级目录的背景色*/
    }
    #nav li ul a{
        padding-left:20px;
        width:199px;
    }
    /*下面是二级目录的链接样式*/
    #nav li ul a:link  {
        color:#666; text-decoration:none;
    }
    #nav li ul a:visited  {
        color:#666;text-decoration:none;
    }
    #nav li ul a:hover {
        color:#F3F3F3;
        text-decoration:none;
        font-weight:normal;
        background:#87CEFA;
        /* 二级onmouseover的字体颜色、背景色*/
    }
    /*==============================*/
    #nav li:hover ul {
        left: auto;
    }
    #nav li.sfhover ul {
        left: auto;
    }
    #content {
        clear: left;
    }
    #nav ul.collapsed {
        display: none;
    }
</style>

<!-- bootstrap - css -->
<link href="${wwwroot}/resources/BJUI/themes/css/bootstrap.css" rel="stylesheet">
<!-- core - css -->
<link href="${wwwroot}/resources/BJUI/themes/css/style.css" rel="stylesheet">
<link href="${wwwroot}/resources/BJUI/themes/blue/core.css" id="bjui-link-theme" rel="stylesheet">
<!-- plug - css -->
<link href="${wwwroot}/resources/BJUI/plugins/kindeditor_4.1.10/themes/default/default.css" rel="stylesheet">
<link href="${wwwroot}/resources/BJUI/plugins/colorpicker/css/bootstrap-colorpicker.min.css" rel="stylesheet">
<link href="${wwwroot}/resources/BJUI/plugins/niceValidator/jquery.validator.css" rel="stylesheet">
<link href="${wwwroot}/resources/BJUI/plugins/bootstrapSelect/bootstrap-select.css" rel="stylesheet">
<link href="${wwwroot}/resources/BJUI/themes/css/FA/css/font-awesome.min.css" rel="stylesheet">
<!--[if lte IE 7]>
<link href="${wwwroot}/resources/BJUI/themes/css/ie7.css" rel="stylesheet">
<![endif]-->
<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lte IE 9]>
    <script src="${wwwroot}/resources/BJUI/other/html5shiv.min.js"></script>
    <script src="${wwwroot}/resources/BJUI/other/respond.min.js"></script>
<![endif]-->
<!-- jquery -->
<script src="${wwwroot}/resources/BJUI/js/jquery-1.7.2.min.js"></script>
<script src="${wwwroot}/resources/BJUI/js/jquery.cookie.js"></script>
<!--[if lte IE 9]>
<script src="${wwwroot}/resources/BJUI/other/jquery.iframe-transport.js"></script>    
<![endif]-->
<!-- BJUI.all 分模块压缩版 -->
<!--
<script src="${wwwroot}/resources/BJUI/js/bjui-all.js"></script>
-->
<!-- 以下是B-JUI的分模块未压缩版，建议开发调试阶段使用下面的版本 -->
<script src="${wwwroot}/resources/BJUI/js/bjui-core.js"></script>
<script src="${wwwroot}/resources/BJUI/js/bjui-regional.zh-CN.js"></script>
<script src="${wwwroot}/resources/BJUI/js/bjui-frag.js"></script>
<script src="${wwwroot}/resources/BJUI/js/bjui-extends.js"></script>
<script src="${wwwroot}/resources/BJUI/js/bjui-basedrag.js"></script>
<script src="${wwwroot}/resources/BJUI/js/bjui-slidebar.js"></script>
<script src="${wwwroot}/resources/BJUI/js/bjui-contextmenu.js"></script>
<script src="${wwwroot}/resources/BJUI/js/bjui-navtab.js"></script>
<script src="${wwwroot}/resources/BJUI/js/bjui-dialog.js"></script>
<script src="${wwwroot}/resources/BJUI/js/bjui-taskbar.js"></script>
<script src="${wwwroot}/resources/BJUI/js/bjui-ajax.js"></script>
<script src="${wwwroot}/resources/BJUI/js/bjui-alertmsg.js"></script>
<script src="${wwwroot}/resources/BJUI/js/bjui-pagination.js"></script>
<script src="${wwwroot}/resources/BJUI/js/bjui-util.date.js"></script>
<script src="${wwwroot}/resources/BJUI/js/bjui-datepicker.js"></script>
<script src="${wwwroot}/resources/BJUI/js/bjui-ajaxtab.js"></script>
<script src="${wwwroot}/resources/BJUI/js/bjui-tablefixed.js"></script>
<script src="${wwwroot}/resources/BJUI/js/bjui-tabledit.js"></script>
<script src="${wwwroot}/resources/BJUI/js/bjui-spinner.js"></script>
<script src="${wwwroot}/resources/BJUI/js/bjui-lookup.js"></script>
<script src="${wwwroot}/resources/BJUI/js/bjui-tags.js"></script>
<script src="${wwwroot}/resources/BJUI/js/bjui-upload.js"></script>
<script src="${wwwroot}/resources/BJUI/js/bjui-theme.js"></script>
<script src="${wwwroot}/resources/BJUI/js/bjui-initui.js"></script>
<script src="${wwwroot}/resources/BJUI/js/bjui-datagrid.js"></script>
<script src="${wwwroot}/resources/BJUI/js/bjui-plugins.js"></script>
<!-- plugins -->
<!-- swfupload for uploadify && kindeditor -->
<script src="${wwwroot}/resources/BJUI/plugins/swfupload/swfupload.js"></script>
<!-- kindeditor -->
<#--
<script src="${wwwroot}/resources/BJUI/plugins/kindeditor_4.1.10/kindeditor-all.min.js"></script>
-->
<script src="${wwwroot}/resources/BJUI/plugins/kindeditor_4.1.10/kindeditor-all.js"></script>
<script src="${wwwroot}/resources/BJUI/plugins/kindeditor_4.1.10/lang/zh_CN.js"></script>
<!-- colorpicker -->
<script src="${wwwroot}/resources/BJUI/plugins/colorpicker/js/bootstrap-colorpicker.min.js"></script>
<!-- ztree -->
<script src="${wwwroot}/resources/BJUI/plugins/ztree/jquery.ztree.all-3.5.js"></script>
<!-- nice validate -->
<script src="${wwwroot}/resources/BJUI/plugins/niceValidator/jquery.validator.js"></script>
<script src="${wwwroot}/resources/BJUI/plugins/niceValidator/jquery.validator.themes.js"></script>
<!-- bootstrap plugins -->
<script src="${wwwroot}/resources/BJUI/plugins/bootstrap.min.js"></script>
<script src="${wwwroot}/resources/BJUI/plugins/bootstrapSelect/bootstrap-select.min.js"></script>
<!-- icheck -->
<script src="${wwwroot}/resources/BJUI/plugins/icheck/icheck.min.js"></script>
<!-- dragsort -->
<script src="${wwwroot}/resources/BJUI/plugins/dragsort/jquery.dragsort-0.5.1.min.js"></script>
<!-- HighCharts -->
<script src="${wwwroot}/resources/BJUI/plugins/highcharts/highcharts.js"></script>
<script src="${wwwroot}/resources/BJUI/plugins/highcharts/highcharts-3d.js"></script>
<script src="${wwwroot}/resources/BJUI/plugins/highcharts/themes/gray.js"></script>
<!-- ECharts -->
<script src="${wwwroot}/resources/BJUI/plugins/echarts/echarts.js"></script>
<!-- other plugins -->
<script src="${wwwroot}/resources/BJUI/plugins/other/jquery.autosize.js"></script>
<link href="${wwwroot}/resources/BJUI/plugins/uploadify/css/uploadify.css" rel="stylesheet">
<script src="${wwwroot}/resources/BJUI/plugins/uploadify/scripts/jquery.uploadify.min.js"></script>
<!-- init -->
<script type="text/javascript">
$(function() {
    BJUI.init({
        JSPATH       : '${wwwroot}/resources/BJUI/',         //[可选]框架路径
        PLUGINPATH   : '${wwwroot}/resources/BJUI/plugins/', //[可选]插件路径
        loginInfo    : {url:'login_timeout.html', title:'登录', width:400, height:200}, // 会话超时后弹出登录对话框
        statusCode   : {ok:200, error:300, timeout:301}, //[可选]
        ajaxTimeout  : 5000, //[可选]全局Ajax请求超时时间(毫秒)
        alertTimeout : 3000, //[可选]信息提示[info/correct]自动关闭延时(毫秒)
        pageInfo     : {pageCurrent:'pageCurrent', pageSize:'pageSize', orderField:'orderField', orderDirection:'orderDirection'}, //[可选]分页参数
        keys         : {statusCode:'statusCode', message:'message'}, //[可选]
        ui           : {showSlidebar:true, clientPaging:true}, //[可选]clientPaging:在客户端响应分页及排序参数
        debug        : true,    // [可选]调试模式 [true|false，默认false]
        theme        : 'purple' // 若有Cookie['bjui_theme'],优先选择Cookie['bjui_theme']。皮肤[五种皮肤:default, orange, purple, blue, red, green]
    })
    //时钟
    var today = new Date(), time = today.getTime()
    $('#bjui-date').html(today.formatDate('yyyy/MM/dd'))
    setInterval(function() {
        today = new Date(today.setSeconds(today.getSeconds() + 1))
        $('#bjui-clock').html(today.formatDate('HH:mm:ss'))
    }, 1000)
})

//console.log('IE:'+ (!$.support.leadingWhitespace))
//菜单-事件
function MainMenuClick(event, treeId, treeNode) {
    if (treeNode.isParent) {
        var zTree = $.fn.zTree.getZTreeObj(treeId)
        
        zTree.expandNode(treeNode)
        return
    }
    
    if (treeNode.target && treeNode.target == 'dialog')
        $(event.target).dialog({id:treeNode.tabid, url:treeNode.url, title:treeNode.name})
    else
        $(event.target).navtab({id:treeNode.tabid, url:treeNode.url, title:treeNode.name, fresh:treeNode.fresh, external:treeNode.external})
    event.preventDefault()
}
</script>
<!-- for doc begin -->
<link type="text/css" rel="stylesheet" href="${wwwroot}/resources/js/syntaxhighlighter-2.1.382/styles/shCore.css"/>
<link type="text/css" rel="stylesheet" href="${wwwroot}/resources/js/syntaxhighlighter-2.1.382/styles/shThemeEclipse.css"/>
<script type="text/javascript" src="${wwwroot}/resources/js/syntaxhighlighter-2.1.382/scripts/brush.js"></script>
<link href="${wwwroot}/resources/doc/doc.css" rel="stylesheet">
<script type="text/javascript">
$(function(){
    SyntaxHighlighter.config.clipboardSwf = '/js/syntaxhighlighter-2.1.382/scripts/clipboard.swf'
    $(document).on(BJUI.eventType.initUI, function(e) {
        SyntaxHighlighter.highlight();
    })
})
</script>
<!-- for doc end -->
</head>
<body >
    <!--[if lte IE 7]>
        <div id="errorie"><div>您还在使用的IE，正常使用系统前请升级您的浏览器到 IE8以上版本 <a target="_blank" href="http://windows.microsoft.com/zh-cn/internet-explorer/ie-8-worldwide-languages">点击升级</a>&nbsp;&nbsp;强烈建议您更改换浏览器：<a href="http://down.tech.sina.com.cn/content/40975.html" target="_blank">谷歌 Chrome</a></div></div>
    <![endif]-->
    <header id="bjui-header">
        <div class="bjui-navbar-header">
            <button type="button" class="bjui-navbar-toggle btn-default" data-toggle="collapse" data-target="#bjui-navbar-collapse">
                <i class="fa fa-bars"></i>
            </button>
            <a class="bjui-navbar-logo" href="#"><img style="padding:3px;" src="${wwwroot}/resources/img/logo.png"></a>
        </div>
        <nav id="bjui-navbar-collapse">
            <ul class="bjui-navbar-right">
                <li class="datetime"><div><i class="fa fa-clock-o"></i><span id="bjui-date"> </span> <span id="bjui-clock"></span></div></li>
                <@userMsgCount uid=uid>
                <li><a href="${wwwroot}/admin/message/mymsg" data-toggle="navtab" data-id="navtab-form" data-title="消息">消息 <span class="badge">${(unread)!0}</span></a></li>
                </@userMsgCount>  
                <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">我的账户 <span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="${wwwroot}/admin/changepwd" data-toggle="dialog" data-id="changepwd_page" data-mask="true" data-width="400" data-height="260">&nbsp;<span class="glyphicon glyphicon-lock"></span> 修改密码&nbsp;</a></li>
                                               <#--
                        <li><a href="#">&nbsp;<span class="glyphicon glyphicon-user"></span> 我的资料</a></li>
                        -->
                        <li class="divider"></li>
                        <li><a href="${wwwroot}/logout" class="red">&nbsp;<span class="glyphicon glyphicon-off"></span> 注销登陆</a></li>
                    </ul>
                </li>
                <li class="dropdown"><a href="#" class="dropdown-toggle theme purple" data-toggle="dropdown"><i class="fa fa-tree"></i></a>
                    <ul class="dropdown-menu" role="menu" id="bjui-themes">
                        <li><a href="javascript:;" class="theme_default" data-toggle="theme" data-theme="default">&nbsp;<i class="fa fa-tree"></i> 黑白分明&nbsp;&nbsp;</a></li>
                        <li><a href="javascript:;" class="theme_orange" data-toggle="theme" data-theme="orange">&nbsp;<i class="fa fa-tree"></i> 橘子红了</a></li>
                        <li class="active"><a href="javascript:;" class="theme_purple" data-toggle="theme" data-theme="purple">&nbsp;<i class="fa fa-tree"></i> 紫罗兰</a></li>
                        <li><a href="javascript:;" class="theme_blue" data-toggle="theme" data-theme="blue">&nbsp;<i class="fa fa-tree"></i> 青出于蓝</a></li>
                        <li><a href="javascript:;" class="theme_red" data-toggle="theme" data-theme="red">&nbsp;<i class="fa fa-tree"></i> 红红火火</a></li>
                        <li><a href="javascript:;" class="theme_green" data-toggle="theme" data-theme="green">&nbsp;<i class="fa fa-tree"></i> 绿草如茵</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
    </header>
    <div id="bjui-container" class="clearfix">
        <div id="bjui-leftside">
            <div id="bjui-sidebar-s">
                <div class="collapse"></div>
            </div>
            <div id="bjui-sidebar">
                <div class="toggleCollapse"><h2>导航栏</h2><a href="javascript:;" class="lock"><i class="fa fa-lock"></i></a></div>
                <div class="panel-group panel-main" data-toggle="accordion" id="bjui-accordionmenu" data-heightbox="#bjui-sidebar" data-offsety="26">
                    <div class="panel panel-default">
                        <div class="panel-heading panelContent">
                            <h3 class="panel-title"><a data-toggle="collapse" data-parent="#bjui-accordionmenu" href="#bjui-collapse0" class="active">主菜单</a></h3>
                        </div>
                        <div id="bjui-collapse0" class="panel-collapse panelContent collapse in">
                            <div class="panel-body" style="overflow-x:hidden;">
                               	    <ul id="nav">
										<@menuList pid="root" uid=uid >
											<#list resources as topRes>
												<li><a href="#Menu=${(topRes.id)!}"  onclick="javascript:DoMenu('${(topRes.id)!}')">${(topRes.name)!}</a>
											<@menuList pid=topRes.id uid=uid>
												<ul id="${(topRes.id)!}" class="collapsed">
												<#list resources as res>
													<li class="loadTab" data-url="${wwwroot}/${(res.url)!}"><a href="#">${(res.name)!}</a></li>
												</#list>
												</ul>
											</@menuList>
												</li>											
											</#list>
										</@menuList>
								
								<#--
								 <ul id="bjui-tree0" class="ztree ztree_main" data-toggle="ztree" data-on-click="MainMenuClick" data-expand-all="true">
							
									<@menuList pid="root">
										<#list resources as topRes>
											<li data-id="${(topRes.id)!}" data-pid="0" >${(topRes.name)!}</li>
										<@menuList pid=topRes.id>
											<#list resources as res>
												<li data-id="${(res.id)!}" data-pid="${(res.pid)!}" data-url="${wwwroot}/${(res.url)!}"data-tabid="main" >${(res.name)!}</li>
											</#list>
										</@menuList>											
										</#list>
									</@menuList>
									
									<li data-id="1" data-pid="0">公文管理</li>
									<li data-id="12" data-pid="1" data-url="${wwwroot}/admin/docrecdept/list" data-tabid="docrecdept">收文部门管理</li>
									<li data-id="13" data-pid="1" data-url="${wwwroot}/admin/sendform/listdraft" data-tabid="sendform">发文起草</li>									
									<li data-id="15" data-pid="1" data-url="${wwwroot}/admin/flowadvice/list" data-tabid="flowadvice">流程意见</li>
									<li data-id="16" data-pid="1" data-url="${wwwroot}/admin/backlog/listflow" data-tabid="backlog">待办任务</li>
									<li data-id="17" data-pid="1" data-url="${wwwroot}/admin/recform/listdraft" data-tabid="recdraft">收文登记</li>
									<li data-id="32" data-pid="1" data-url="${wwwroot}/admin/recform/listpress" data-tabid="recformpress">收文督办</li>
									<li data-id="18" data-pid="1" data-url="${wwwroot}/admin/recform/listhandle" data-tabid="recformhandle">收文办文</li>									
									<li data-id="19" data-pid="1" data-url="${wwwroot}/admin/recform/listverify" data-tabid="recformhandle">收文审核</li>
									<li data-id="20" data-pid="1" data-url="${wwwroot}/admin/recform/listrecord" data-tabid="recformrecord">收文归档</li>								
									<li data-id="22" data-pid="1" data-url="${wwwroot}/admin/sendform/listrecord" data-tabid="sendformrecord">发文归档</li>
									<li data-id="23" data-pid="1" data-url="${wwwroot}/admin/message/list" data-tabid="message">消息</li>
									<li data-id="2" data-pid="0">系统管理</li>
									<li data-id="21" data-pid="2" data-url="${wwwroot}/admin/dept/list" data-tabid="dept">部门管理</li>
									<li data-id="22" data-pid="2" data-url="${wwwroot}/admin/resource/list" data-tabid="resource">资源管理</li>
									<li data-id="23" data-pid="2" data-url="${wwwroot}/admin/user/list" data-tabid="user">用户管理</li>
									<li data-id="24" data-pid="2" data-url="${wwwroot}/admin/role/list" data-tabid="role">角色管理</li>
									<li data-id="25" data-pid="2" data-url="${wwwroot}/admin/roleresource/list" data-tabid="roleresource">角色资源管理</li>
									<li data-id="26" data-pid="2" data-url="${wwwroot}/admin/userrole/list" data-tabid="userrole">用户角色管理</li>
									<li data-id="27" data-pid="2" data-url="${wwwroot}/admin/flow/list" data-tabid="flow">流程管理</li>
									<li data-id="28" data-pid="2" data-url="${wwwroot}/admin/flowstep/list" data-tabid="flowstep">流程步骤管理</li>
									<li data-id="29" data-pid="2" data-url="${wwwroot}/admin/flowuser/list" data-tabid="flowuser">流程用户管理</li>
									-->
                                </ul>
                            </div>
                        </div>
                        <div class="panelFooter"><div class="panelFooterContent"></div></div>
                    </div>
                </div>
            </div>
        </div>
        <div id="bjui-navtab" class="tabsPage">
            <div class="tabsPageHeader">
                <div class="tabsPageHeaderContent">
                    <ul class="navtab-tab nav nav-tabs">
                        <li data-tabid="main" class="main active" data-url="${wwwroot}/home"><a href="javascript:;"><span style="font-size:15px;"><i class="fa fa-home"></i> #maintab#</span></a></li>
                    </ul>
                </div>
                <div class="tabsLeft"><i class="fa fa-angle-double-left"></i></div>
                <div class="tabsRight"><i class="fa fa-angle-double-right"></i></div>
                <div class="tabsMore"><i class="fa fa-angle-double-down"></i></div>
            </div>
            <ul class="tabsMoreList">
                <li><a href="javascript:;">#maintab#</a></li>
            </ul>
            
            <div class="navtab-panel tabsPageContent layoutBox">
                <div class="page unitBox">
                    <div class="bjui-pageHeader" style="background:#FFF;">
                        <div style="padding: 0 5px;">
                            <h4>欢迎${(username)!}登陆民政OA系统</h4>
                        </div>
                    </div>
                </div>
            </div>            
            <div id="audioDiv" style="display:none">
            </div>
            <bgsound id="bsound"> 
        </div>
    </div>
    <footer style="font-size:15px;" id="bjui-footer">
    	Copyright &copy; 陕西省民政厅　
    </footer>    
</body>
</html>
<script>
var audioFlag=false; //只第一次提醒
setInterval("newMsg()", 3600000);//30分钟一次

function newMsg()
{
	$.ajax({ 
        type: "post", 
        url: "${wwwroot}/admin/usermsgcount/unreadcount", 
        dataType: "text", 
        success: function (data) {
        	if(data>0)
        	{
        		var op = {okCall:msgCome};
				$("body").alertmsg('warn', '您有新消息！',op);
				if(!audioFlag)
				{
					playTip();
					audioFlag=true;
				}  
				
        	}
        }
    });
}

function msgCome()
{
	$("body").navtab({id:'navtab-form', url:'${wwwroot}/admin/message/mymsg', title:'消息', fresh:true});
	audioFlag = false;
}

function playTip()
{
	if($.browser.msie && $.browser.version=='8.0'){ 
		//本来这里用的是<bgsound src="system.wav"/>,结果IE8不播放声音,于是换成了embed 
		$('#audioDiv').html('<embed src="${wwwroot}/resources/audio/tip.wav"/>'); 
	}else{ 
		//IE9+,Firefox,Chrome均支持<audio/> 
		$('#audioDiv').html('<audio autoplay="autoplay"><source src="${wwwroot}/resources/audio/tip.wav"' 
		+ 'type="audio/wav"/></audio>'); 
	}
}
</script>
<script type=text/javascript>
var LastLeftID = "";
function menuFix() {
    var obj = document.getElementById("nav").getElementsByTagName("li");
    for (var i=0; i<obj.length; i++) {
        obj[i].onmouseover=function() {
            this.className+=(this.className.length>0? " ": "") + "sfhover";
        }
        obj[i].onMouseDown=function() {
            this.className+=(this.className.length>0? " ": "") + "sfhover";
        }
        obj[i].onMouseUp=function() {
            this.className+=(this.className.length>0? " ": "") + "sfhover";
        }
        obj[i].onmouseout=function() {
            this.className=this.className.replace(new RegExp("( ?|^)sfhover\\b"), "");
        }
    }
}
function DoMenu(emid)
{
    var obj = document.getElementById(emid);
    obj.className = (obj.className.toLowerCase() == "expanded"?"collapsed":"expanded");
    if((LastLeftID!="")&&(emid!=LastLeftID)) //关闭上一个Menu
    {
        document.getElementById(LastLeftID).className = "collapsed";
    }
    LastLeftID = emid;
}
function GetMenuID()
{
    var MenuID="";
    var _paramStr = new String(window.location.href);
    var _sharpPos = _paramStr.indexOf("#");

    if (_sharpPos >= 0 && _sharpPos < _paramStr.length - 1)
    {
        _paramStr = _paramStr.substring(_sharpPos + 1, _paramStr.length);
    }
    else
    {
        _paramStr = "";
    }

    if (_paramStr.length > 0)
    {
        var _paramArr = _paramStr.split("&");
        if (_paramArr.length>0)
        {
            var _paramKeyVal = _paramArr[0].split("=");
            if (_paramKeyVal.length>0)
            {
                MenuID = _paramKeyVal[1];
            }
        }
    }
    if(MenuID!="")
    {
        DoMenu(MenuID)
    }
}
GetMenuID();
menuFix();

$(function(){
	$('li.loadTab').click(function(){
		var url = $(this).attr("data-url");
            $('#bjui-navtab').find('.navtab-tab').find('li.main').navtab({id:'main', url:url, fresh:true})
	});
});
</script>