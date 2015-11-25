<!DOCTYPE html>
<html>

<head>

  <meta charset="UTF-8">

  <title>OA安装步骤</title>

    <link rel="stylesheet" href="/civiloa/resources/css/install.css" media="screen" type="text/css" />
	<script src="${domain}/resources/BJUI/js/jquery-1.7.2.min.js"></script>
</head>

<body>

  <div class="container">
  <form id="contact"  method="post">  
	<h3>正在安装中,请耐心等待约1分钟……</h3>
	</form>
	</div>
<div style="text-align:center;clear:both">
</div>
</body>

</html>
<script>
var installFlag = false;

$(function(){
	setup();
});
 
function setup()
{
  var dataDic_name="${(dataDic_name)!}";
	$.ajax({ 
		type: "POST",
		url: "${domain}/install/setup.do",
		dataType: "text", 
		data : {
				dataDic_name : dataDic_name,
				time : (new Date()).getTime(),	
				cache : false
				},
		success: function(data){
	        if(data=='succ')
	        {
	        	installFlag = true;
	        	setInterval("testInstallOk()", 5000);//5秒一次
	        }
	 	}
	 });
} 
 
function goSuccPage()
{
	alert(testInstallOk());
	if(testInstallOk()==true)
	{
		window.location = "${domain}/install/success.do";
	}
	return false;
} 
	
function testInstallOk()
{
	var res = false;
	$.ajax({ 
		type: "POST",	
		url: "${domain}/installok",
		dataType: "text", 
		success: function(data){
	        if(data=='succ')
	        {
	        	//es = true;
	        	//return res;
	        	window.location = "${domain}/install/success.do";
	        }
	 	}
 	});
 	return res;
}

</script>