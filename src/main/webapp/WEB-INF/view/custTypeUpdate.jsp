<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1"><title>
	客户类型修改
</title><meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css" type="text/css" media="screen" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css" media="screen" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/invalid.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" media="all">
    <script src="${pageContext.request.contextPath}/layui/layui.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
</head>
<body>
     <div id="maintitle"><div id="mainico"></div>
    <div id="maintip"><strong>位置：</strong>客户类型修改</div></div>
    <div class="content-box role">
	<div class="content-box-content">
	<div class="tab-content default-tab" id="form">
    <div>
    <table style="width:100%;" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td  style="BORDER-BOTTOM: #c1dad7 1px solid">
            <table style="width:100%;height:55px;" border="0" cellpadding="0" cellspacing="0">
            <tr>
            <td width="10%" height="55" valign="middle"><img src="${pageContext.request.contextPath}/images/user-info.gif" /></td>
            <td width="70%">
                <p class="left_txt2">客户类型修改</p>
            </td>
            <td width="20%" align="right">
            <div align="center">
            <img src="${pageContext.request.contextPath}/images/ico_Form.gif" width="14" height="14" />&nbsp;<a href='javascript:self.location.reload();' >刷新</a>&nbsp;&nbsp;&nbsp;&nbsp;
            <img src="${pageContext.request.contextPath}/images/002.gif" width="14" height="14" /><A href="javascript:self.history.back();">返回</A></div>
           </td>
            </tr>
            </table>
            </td>
        </tr>
        <tr>
            <td  colspan="2">
            <script language="javascript">
            	function check(){
            		if(form1.customertypename.value=="")
            		{
            			alert("请输入客户类型名称");
            			form1.customertypename.focus();
            			return false;
            		}
                    if ($("#name").text().trim()=="不可用"){
                        alert("客户类型已存在");
                        form1.customertypename.focus();
                        return false;
                    }
            		return true;
            	}
            </script>

                <script type="text/javascript">

                    layui.use('layer', function(){
                        var layer = layui.layer;
                        var customertypeUpdate='${customertypeUpdate}';
                        if(customertypeUpdate!=""){
                            layer.open({
                                title:0
                                ,content:customertypeUpdate
                                ,skin: 'demo-class'
                                ,offset: 'auto'
                                ,anim: 1
                                ,time:2000
                            })
                            if(customertypeUpdate=="修改成功"){
                                window.setTimeout(function () {
                                    location.href="${pageContext.request.contextPath}/load/custtypelist.action";
                                },1000)
                            }
                        }
                    })

                </script>

                <script type="text/javascript">
                    $(function () {
                        var customertypename2='${custType.customertypename }'; //获取原来区域名称
                        $("#customertypename").blur(function () {
                            var customertypename=$(this).val().trim();
                            if (customertypename!=""&&customertypename!=customertypename2){
                                $.ajax({
                                    url:'${pageContext.request.contextPath}/customertype/customertypeName.action'
                                    ,data:"customertypename="+customertypename
                                    ,success:function (res) {
                                        if(res>0)
                                            $("#name").html("不可用");
                                        else
                                            $("#name").html("可用");
                                    }
                                })
                            }else {
                                $("#name").html("");
                            }

                        })
                        $("#customertypename").focus(function(){
                            $("#name").html("");
                        })
                    })
                </script>
            <form action="${pageContext.request.contextPath}/customertype/customertypeUpdate.action" method="post" name="form1" onsubmit="return check();">
            	<input type="hidden" name="customertypeid" value="${custType.customertypeid }"/>
            <table width="70%" border="0" align="left" cellpadding="2" cellspacing="1" >
			  <tr>
			    <td width="130" height="30" class="STYLE1" nowrap="nowrap" style="BORDER-BOTTOM: #c1dad7 1px solid"><div align="right">客户类型名称：</div></td>
			    <td class="STYLE1"  style="BORDER-BOTTOM: #c1dad7 1px solid"><input type="text" name="customertypename" value="${custType.customertypename }" id="customertypename">&nbsp;&nbsp;&nbsp;<font color="red"><span id="name"></span></font></td>
			  </tr>
			   <tr>
			    <td width="130" height="30" class="STYLE1" nowrap="nowrap" style="BORDER-BOTTOM: #c1dad7 1px solid"><div align="right">&nbsp;</div></td>
			    <td class="STYLE1"  style="BORDER-BOTTOM: #c1dad7 1px solid"><input type="submit" value=" 保 存 "></td>
			  </tr>
			</table>
	</form>
            </td>
        </tr>
    </table>
  </div></div></div></div>
    <SCRIPT src="${pageContext.request.contextPath}/js/transform.js" type=text/javascript></SCRIPT>
</body>
</html>
