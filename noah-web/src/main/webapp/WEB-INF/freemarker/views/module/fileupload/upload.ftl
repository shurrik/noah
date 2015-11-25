<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>附件上传，下载</title>
<meta name="Keywords" content="B-JUI,Bootstrap,DWZ,jquery,ui,前端,框架,开源,OSC,开源框架,knaan"/>
<meta name="Description" content="B-JUI, Bootstrap for DWZ富客户端框架，基于DWZ富客户端框架修改。主要针对皮肤，编辑器，表单验证等方面进行了大量修改，引入了Bootstrap，Font Awesome，KindEditor，jquery.validationEngine，iCheck等众多开源项目。交流QQ群：232781006。"/> 
<script src="${wwwroot}/resources/js/jquery-1.3.2.min.js"></script>
<script src="${wwwroot}/resources/js/progressBar.js"></script>
<link href="${wwwroot}/resources/js/progressBar.css" rel="stylesheet">
<script type="text/javascript">
</script>
</head>
 <body>
<<<<<<< .mine
  <iframe id='target_upload' name='target_upload' src=''
			style='display: none'></iframe>
   <form action="${wwwroot}/admin/acessories/upload" id="uploadForm" enctype="multipart/form-data" method="post" target="target_upload">
   <input type="file" name="upload"><input type="submit" id="subButton" name="subButton" value="上传">
=======
  <iframe id='target_upload' name='target_upload' src='' style='display: none'></iframe>
   <form action="" id="uploadForm" enctype="multipart/form-data" method="post" target="target_upload">
   <input type="file"  class="btn-green right" name="upload" >
   <a href="${wwwroot}/admin/user/upload" class="btn btn-green" target="target_upload">上传</a>
   <a href="${wwwroot}/admin/user/download" class="btn btn-green" target="target_download">下载</a>
>>>>>>> .r548
   </form>
<<<<<<< .mine

   <div id="progress">
   <div id="title"><span id="text">上传进度</span><div id="close">X</div></div>
   <div id="progressBar">
   	<div id="uploaded"></div>
   	</div>
   	<div id="info"></div>
   </div>
=======
>>>>>>> .r548
  </body>
</html>