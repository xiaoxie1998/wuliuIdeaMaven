<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1"><title>
	修改运输车辆
</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css" type="text/css" media="screen" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css" media="screen" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/invalid.css" type="text/css" media="screen" />

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/jquery-easyui-1.3.0/themes/default/easyui.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/jquery-easyui-1.3.0/themes/icon.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-easyui-1.3.0/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-easyui-1.3.0/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/DateFormat.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" media="all">
    <script src="${pageContext.request.contextPath}/layui/layui.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>

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
                        var transcarUpdate='${transcarUpdate}';
                        if(transcarUpdate!=""){
                            layer.open({
                                title:0
                                ,content:transcarUpdate
                                ,skin: 'demo-class'
                                ,offset: 'auto'
                                ,anim: 1
                                ,time:2000
                            })
                            if(transcarUpdate=="修改成功"){
                                window.setTimeout(function () {
                                    location.href="${pageContext.request.contextPath}/load/transCarlist.action";
                                },1000)
                            }
                        }
                    })

                </script>
	<form action="${pageContext.request.contextPath}/transcar/transCarUpdate.action" method="post" name="form1" onsubmit="return check();">
    	<input type="hidden" name="transid" value="${transCar.transid }"/>
        <input type="hidden" name="sendfee" value="${transCar.sendfee }"/>

        <input type="hidden" name="gcount" value="${transCar.gcount }"/>
    	<table align="center" border="1" cellpadding="2" cellspacing="1">
    		<tr>
    			<td align="right">运输车辆：</td>
    			<td>
						<select name="car.carid" style="width:155px">
						<c:forEach items="${cars}" var="car">
							<c:if test="${car.carid == transCar.car.carid}">
								<option value="${car.carid }" selected>${car.cardno }|${car.carname }</option>
							</c:if>
							<c:if test="${car.carid != transCar.car.carid}">
								<option value="${car.carid }">${car.cardno }|${car.carname }</option>
							</c:if>
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
							<c:if test="${area.areaid==transCar.sendcity.areaid}">
								<option value="${area.areaid }" selected>${area.areaname }</option>
							</c:if>
							<c:if test="${area.areaid != transCar.sendcity.areaid}">
								<option value="${area.areaid }">${area.areaname }</option>
							</c:if>
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
							<c:if test="${area.areaid==transCar.rececity.areaid}">
								<option value="${area.areaid }" selected>${area.areaname }</option>
							</c:if>
							<c:if test="${area.areaid != transCar.rececity.areaid}">
								<option value="${area.areaid }">${area.areaname }</option>
							</c:if>
						</c:forEach>
						</select>
				</td>
    			<td><font size="2" color="red">&nbsp;</font></td>
    		</tr>
    		<tr>
    			<td align="right">司机姓名：</td>
    			<td><input type="text" name="driver"  value="${transCar.driver }"></td>
    			<td><font size="2" color="red">&nbsp;</font></td>
    		</tr>
    		<tr>
    			<td align="right">司机电话：</td>
    			<td><input type="text" name="drivertel"  value="${transCar.drivertel }"></td>
    			<td><font size="2" color="red">&nbsp;</font></td>
    		</tr>
    		<tr>
    			<td align="right">跟车负责人：</td>
    			<td><input type="text" name="master"  value="${transCar.master }"></td>
    			<td><font size="2" color="red">&nbsp;</font></td>
    		</tr>
    		<tr>
    			<td align="right">负责人电话：</td>
    			<td><input type="text" name="mastertel"  value="${transCar.mastertel }"></td>
    			<td><font size="2" color="red">&nbsp;</font></td>
    		</tr>
    		<tr>
    			<td align="right">运输工具：</td>
    			<td>
						<select name="sendtype.sendtypeid" style="width:155px">
						<c:forEach items="${sendtypes}" var="sendtype">
							<c:if test="${sendtype.sendtypeid==transCar.sendtype.sendtypeid}">
								<option value="${sendtype.sendtypeid }" selected>${sendtype.sendtypename }</option>
							</c:if>
							<c:if test="${sendtype.sendtypeid != transCar.sendtype.sendtypeid}">
								<option value="${sendtype.sendtypeid }">${sendtype.sendtypename }</option>
							</c:if>
						</c:forEach>							

						</select>
				</td>
    			<td><font size="2" color="red">*必填</font></td>
    		</tr>
    		<tr>
    			<td align="right">发车时间：</td>
    			<td>

                        <div class="layui-input-inline">
                            <input type="text" value="<fmt:formatDate value="${transCar.sendtime }" pattern="yyyy-MM-dd"/>"  name="sendtime" class="layui-input" id="test1" placeholder="yyyy-MM-dd">
                        </div>

                    <script>
                        layui.use('laydate', function() {
                            var laydate = layui.laydate;

                            //常规用法
                            laydate.render({
                                elem: '#test1'
                                ,theme: 'molv'
                            });
                        })
                    </script>
                </td>
    			<td>&nbsp;</td>
    		</tr>
    		<tr>
    			<td align="right">车辆状态：</td>
    			<td>
					<select name="carstatus"  style="width:155px">

							<c:if test="${transCar.carstatus=='未发车' }">
								<option value="未发车" selected>未发车</option>
								<option value="已发车" >已发车</option>
								<option value="已到站" >已到站</option>

							</c:if>
						<c:if test="${transCar.carstatus=='已发车' }">
							<option value="未发车" >未发车</option>
							<option value="已发车" selected >已发车</option>
							<option value="已到站"  >已到站</option>

						</c:if>
						<c:if test="${transCar.carstatus=='已到站' }">
							<option value="未发车" >未发车</option>
							<option value="已发车" >已发车</option>
							<option value="已到站" selected >已到站</option>

						</c:if>

					</select>
				</td>
    			<td><font size="2" color="red">&nbsp;</font></td>
    		</tr>
    		<tr>
    			<td align="right">运输费用：</td>
    			<td><input type="text" name="carfee"  value="${transCar.carfee }"></td>
    			<td><font size="2" color="red">&nbsp;</font></td>
    		</tr>
    		<tr>
    			<td align="right">补充说明：</td>
    			<td><input type="text" name="demo" size="50"  value="${transCar.demo }"></td>
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
