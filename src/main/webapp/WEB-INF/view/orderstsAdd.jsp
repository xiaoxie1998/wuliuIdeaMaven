<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1"><title>
	订单状态设置
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
    <div id="maintip"><strong>位置：</strong>订单状态设置</div></div>
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
                <p class="left_txt2">订单状态设置</p>
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
            		if(form1.ordername.value=="")
            		{
            			alert("请输入订单状态名称");
            			form1.ordername.focus();
            			return false;
            		}
                    if ($("#name").text().trim()=="不可用"){
                        alert("付款方式名称已存在");
                        form1.ordername.focus();
                        return false;
                    }
            		return true;
            	}
            </script>


                <script type="text/javascript">

                    layui.use('layer', function(){
                        var layer = layui.layer;
                        var orderAdd='${orderAdd}';
                        if(orderAdd!=""){
                            layer.open({
                                title:0
                                ,content:orderAdd
                                ,skin: 'demo-class'
                                ,offset: 'auto'
                                ,anim: 1
                                ,time:2000
                            })
                            if(orderAdd=="添加成功"){
                                window.setTimeout(function () {
                                    location.href="${pageContext.request.contextPath}/load/orderstslist.action";
                                },1000)
                            }
                        }
                    })

                </script>

                <script type="text/javascript">
                    $(function () {
                        $("#ordername").blur(function () {
                            var ordername=$(this).val();
                            if (ordername!=""){
                                $.ajax({
                                    url:'${pageContext.request.contextPath}/order/orderName.action'
                                    ,data:"ordername="+ordername
                                    ,success:function (res) {
                                        if(res>0)
                                            $("#name").html("不可用");
                                        else
                                            $("#name").html("可用");
                                    }
                                })
                            }
                        })
                        $("#ordername").focus(function(){
                            $("#name").html("");
                        })
                    })
                </script>
            <form action="${pageContext.request.contextPath}/order/orderAdd.action" method="post" name="form1" onsubmit="return check();">
            <table width="70%" border="0" align="left" cellpadding="2" cellspacing="1" >
			  <tr>
			    <td width="130" height="30" class="STYLE1" nowrap="nowrap" style="BORDER-BOTTOM: #c1dad7 1px solid"><div align="right">订单状态名称：</div></td>
			    <td class="STYLE1"  style="BORDER-BOTTOM: #c1dad7 1px solid"><input type="text" name="ordername" id="ordername">&nbsp;&nbsp;&nbsp;<font color="red"><span id="name"></span></font></td>
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
