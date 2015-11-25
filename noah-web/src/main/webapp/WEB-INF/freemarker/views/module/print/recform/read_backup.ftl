<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>陕西省民政厅阅文处理专用单</title>
<style media="print">.printer {display:none;}</style>
</head>
<body>
<p>
<button type="button" onclick="window.print()" class="printer">打印</button>
</p>
<center></br>
<div>
 <p style="font-weight:bold;">
陕西省民政厅阅文处理专用单
</p>
</div>
<table  cellspacing="0" cellpadding="0" border="1">
  <tr>
    <td width="120" height="20"><p align="center">收文日期 </p></td>
    <td width="117" ><p align="center">${(recForm.createDate?string('yyyy-MM-dd'))!}</p></td>
    <td width="98"><p align="center">来文单位 </p></td>
    <td width="128"><p align="center">${(recForm.depName)!}</p></td>
    <td width="95"><p align="center">来文编号 </p></td>
    <td width="76"><p align="center">${(recForm.no)!}</p></td>
  </tr>
  <tr>
    <td width="100" height="20"><p align="center">来文标题 </p></td>
    <td width="514" colspan="5"><p align="left">${(recForm.title)!}</p></td>
  </tr>
  <tr>
    <td width="100" height="400"><p align="center">厅领导 </p>
        <p align="center">阅 批 </p></td>
    <td width="514" colspan="5" valign="top">
    	<p><strong>呈阅意见：</strong> </p>
    	${(recForm.submitAdvice)!}
    </td>
  </tr>
  <tr>
    <td width="100"><p align="center">拟办意见 </p></td>
    <td width="514" colspan="5" valign="top">
    	<p>&nbsp; </p>
        <p>&nbsp; </p>
        <p>&nbsp; </p>
        <p>&nbsp; </p>
        ${(recForm.draftAdvice)!}
        <p align="right" valign="bottom">承办人：${(recForm.contractor)!};负责人：${(recForm.chargeMan)!}</p>
    </td>
  </tr>
  <tr height="150">
    <td width="100"><p align="center">各处室 </p>
        <p align="center">传 阅 </p></td>
    <td width="514" colspan="5"><p>&nbsp; </p></td>
  </tr>
</table>
<p>
<@p.recFormRemark/> 
</p>
</center>
</body>
</html>
