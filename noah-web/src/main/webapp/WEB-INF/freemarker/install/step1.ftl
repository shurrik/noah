<!DOCTYPE html>
<html>

<head>

  <meta charset="UTF-8">

  <title>OA安装步骤</title>
    <script src="${domain}/resources/js/jquery-1.11.1.min.js"></script> 
    <link rel="stylesheet" href="/civiloa/resources/css/install.css" media="screen" type="text/css" />
		<script type="text/javascript">
		   function SumbitFrom(){
		        var jdbc_host=document.getElementById("jdbc_host").value;
		        var jdbc_port=document.getElementById("jdbc_port").value;
		        var jdbc_username=document.getElementById("jdbc_username").value;
		        var jdbc_password=document.getElementById("jdbc_password").value;
		        if(jdbc_host==""||jdbc_host==null)
				{
					alert("请输入IP！");
					return false;
				}else if(jdbc_port==""||jdbc_port==null){
				    alert("请输入端口号！");
		            return false;
		        }else if(jdbc_username==""||jdbc_username==null){
				    alert("请输入用户名！");
		            return false;
		        }else if(jdbc_password==""||jdbc_password==null){
				    alert("请输入密码！");
		            return false;
				}else{
				    jQuery.ajax({
				        url:"${domain}/install/checkConnect.do",
						type : "post",
						dataType: "text",
						data : {
								jdbc_host : jdbc_host,
								jdbc_port : jdbc_port,
								jdbc_username : jdbc_username,
								jdbc_password : jdbc_password,
							time : (new Date()).getTime(),
							cache : false
						},
						success:function(result){
						    if(result=="succ")
						    {
						        alert("连接成功！");
							}else{
								alert("连接失败！");
							}
						},
						failure : function(result) {
							alert("参数错误");
						}
					});
		          }
              	}
</script>
</head>

<body>

  <div class="container">  
  <form id="contact" action="${domain}/install/step2.do" method="post">
    <h3>OA安装步骤-2</h3>
    <h4>安装进度2/2</h4>
    <fieldset>
     数据库IP:<input name="jdbc_host" id="jdbc_host" placeholder="数据库IP" type="text" value="127.0.0.1">
    </fieldset>
    <fieldset>
    数据库端口:<input name="jdbc_port" id="jdbc_port" placeholder="数据库端口" type="text" value="3306">
    </fieldset>
    <fieldset>
    数据库管理员账号:<input name="jdbc_username" id="jdbc_username" placeholder="数据库管理员账号" type="text" value="root">
    </fieldset>
    <fieldset>
   数据库管理员密码:<input name="jdbc_password" id="jdbc_password" placeholder="数据库管理员密码" type="text" value="root">
    </fieldset>        
    <fieldset>
    <a  href="javascript:void(0);" onclick="SumbitFrom()">连接测试</a>
    <a  href="javascript:void(0);" onclick=history.back();><上一步</a>
    <#--
    <input name="dataDic" type="checkbox">是否重建表结构？
    -->
      <button name="button" type="submit" id="contact-submit" data-submit="...Sending">下一步&gt;</button>
    </fieldset>
  </form>

</div>
<div style="text-align:center;clear:both">
</div>
</body>

</html>
<#--
<script src="${domain}/resources/BJUI/js/jquery-1.7.2.min.js"></script>
<form action="${domain}/install/step2.do" method="post">
	jdbc_host:<input name="jdbc_host" value="127.0.0.1">
	jdbc_port:<input name="jdbc_port" value="3306">
	jdbc_username:<input name="jdbc_username" value="root">
	jdbc_password:<input name="jdbc_password" value="root">
	<input type= "submit" value="提交">
</form>
-->