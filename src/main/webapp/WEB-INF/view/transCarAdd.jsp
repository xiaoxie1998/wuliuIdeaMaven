<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1"><title>
	添加运输车辆管理
</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css" type="text/css" media="screen" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css" media="screen" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/invalid.css" type="text/css" media="screen" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" media="all">
	<script src="${pageContext.request.contextPath}/layui/layui.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
	<script src="${pageContext.request.contextPath}/js/date.js"></script>
</head>
<body>
     <div id="maintitle"><div id="mainico"></div>
    <div id="maintip"><strong>位置：</strong>运输车辆管理</div></div>
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
                <p class="left_txt2">运输车辆管理</p>
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
		<script type="text/javascript">
			function check(){
				if(form1.sendtime.value=="")
				{
					alert("请输入发送时间");
					form1.sendtime.focus();
					return false;
				}
				if(form1.carfee.value==""){
					alert("请输入运输费用");
					form1.carfee.focus();
					return false;
				}
				if(isNaN(form1.carfee.value)){
					alert("运输费用含有非法字符");
					form1.carfee.focus();
					return false;
				}
                if($("#sendcity").val()==$("#rececity").val())
                {
                    alert("发货城市和收货城市不能相同");
                    return false;
                }
				return true;
			}
		</script>
				<script type="text/javascript">

                    layui.use('layer', function(){
                        var layer = layui.layer;
                        var transcarAdd='${transcarAdd}';
                        if(transcarAdd!=""){
                            layer.open({
                                title:0
                                ,content:transcarAdd
                                ,skin: 'demo-class'
                                ,offset: 'auto'
                                ,anim: 1
                                ,time:2000
                            })
                            if(transcarAdd=="添加成功"){
                                window.setTimeout(function () {
                                    location.href="${pageContext.request.contextPath}/load/transCarlist.action";
                                },1000)
                            }
                        }
                    })

				</script>
	<form action="${pageContext.request.contextPath}/transcar/transCarAdd.action" method="post" name="form1" onsubmit="return check();">
    	<table align="center" border="1" cellpadding="2" cellspacing="1">
			<input type="hidden" name="sendfee" value="0"/>
			<input type="hidden" name="carstatus" value="未发车"/>
			<input type="hidden" name="gcount" value="0"/>
    		<tr>
    			<td align="right">运输车辆：</td>
    			<td>
						<select name="car.carid" style="width:155px">
						<c:forEach items="${cars}" var="car">
							<option value="${car.carid }">${car.cardno }|${car.carname }</option>
						</c:forEach>
						</select>
				</td>
    			<td><font size="2" color="red">*必填</font></td>
    		</tr>
    		<tr>
    			<td align="right">出发地：</td>
    			<td>
						<select name="sendcity.areaid" id="sendcity" style="width:155px">
						<c:forEach items="${areas}" var="area">
							<option value="${area.areaid }">${area.areaname }</option>
						</c:forEach>
						</select>
				</td>
    			<td><font size="2" color="red">&nbsp;</font></td>
    		</tr>
    		<tr>
    			<td align="right">目的地：</td>
    			<td>
					<select name="rececity.areaid" id="rececity" style="width:155px">
						<c:forEach items="${areas}" var="area">
							<option value="${area.areaid }">${area.areaname }</option>
						</c:forEach>
						</select>
				</td>
    			<td><font size="2" color="red">&nbsp;</font></td>
    		</tr>
    		<tr>
    			<td align="right">司机姓名：</td>
    			<td><input type="text" name="driver" ></td>
    			<td><font size="2" color="red">&nbsp;</font></td>
    		</tr>
    		<tr>
    			<td align="right">司机电话：</td>
    			<td><input type="text" name="drivertel"></td>
    			<td><font size="2" color="red">&nbsp;</font></td>
    		</tr>
    		<tr>
    			<td align="right">跟车负责人：</td>
    			<td><input type="text" name="master"></td>
    			<td><font size="2" color="red">&nbsp;</font></td>
    		</tr>
    		<tr>
    			<td align="right">负责人电话：</td>
    			<td><input type="text" name="mastertel"></td>
    			<td><font size="2" color="red">&nbsp;</font></td>
    		</tr>
    		<tr>
    			<td align="right">运输工具：</td>
    			<td>
						<select name="sendtype.sendtypeid" style="width:155px">
						<c:forEach items="${sendtypes}" var="sendtype">
							<option value="${sendtype.sendtypeid }">${sendtype.sendtypename }</option>
						</c:forEach>							

						</select>
				</td>
    			<td><font size="2" color="red">*必填</font></td>
    		</tr>
    		<tr>
    			<td align="right">发车时间：</td>

    			<td>
					<div class="layui-input-inline">
						<input type="text"   name="sendtime" class="layui-input" id="test1" placeholder="yyyy-MM-dd">
					</div>

					<script>
                        layui.use('laydate', function() {
                            var laydate = layui.laydate;

                            //常规用法
                            laydate.render({
                                elem: '#test1'
                                ,theme: 'molv'
                                ,value:new Date()
                                ,min:new Date().Format("yyyy-MM-dd")
                            });
                        })
					</script>
    			</td>
    			<td>&nbsp;</td>
    		</tr>
    		<tr>
    			<td align="right">运输费用：</td>
    			<td><input type="text" name="carfee" value=""></td>
    			<td><font size="2" color="red">&nbsp;</font></td>
    		</tr>
    		<tr>
    			<td align="right">补充说明：</td>
    			<td><input type="text" name="demo" size="50"></td>
    			<td><font size="2" color="red">&nbsp;</font></td>
    		</tr>
    		<tr>
    			<td colspan="3" align="center"><input type="submit" value="  保 存 "></td>
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
