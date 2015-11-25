<!DOCTYPE html>
<html>

<head>

  <meta charset="UTF-8">

  <title>OA安装步骤</title>

    <link rel="stylesheet" href="/civiloa/resources/css/install.css" media="screen" type="text/css" />

</head>

<body>

  <div class="container">  
  <form id="contact" action="step1.do" method="post">
    <h3>OA安装步骤-1</h3>
    <h4>安装进度1/2</h4>
    <fieldset>
      局域网IP:<input name="ip" placeholder="" type="text" value="192.168.1.101">
    </fieldset>
    <fieldset>
      web服务器端口:<input name="port" placeholder="" type="text" value="80">
    </fieldset>
    <fieldset>
      <button name="submit" type="submit" id="contact-submit" data-submit="...Sending">下一步&gt;</button>
    </fieldset>
  </form>
</div>
<div style="text-align:center;clear:both">
</div>
</body>

</html>
<#--
<form action="step1.do" method="post">
	ip:<input name="ip" value="192.168.1.101">
	port:<input name="port" value="80">
	<input type= "submit" value="提交">
</form>
-->