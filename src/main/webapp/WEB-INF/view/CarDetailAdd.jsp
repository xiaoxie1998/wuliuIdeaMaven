<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1">
<title>订单管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css" type="text/css"
	media="screen" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css"
	media="screen" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/invalid.css" type="text/css"
	media="screen" />

<script type="text/javascript" src="${pageContext.request.contextPath}/js/DateFormat.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" media="all">
	<script src="${pageContext.request.contextPath}/layui/layui.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
	<script src="${pageContext.request.contextPath}/js/date.js"></script>

</head>
<body>
	<div id="maintitle">
		<div id="mainico"></div>
		<div id="maintip">
			<strong>位置：</strong>订单管理
		</div>
	</div>
	<div class="content-box role">
		<div class="content-box-content">
			<div class="tab-content default-tab" id="form">
				<div>
					<table style="width: 100%;" border="0" cellpadding="0"
						cellspacing="0">
						<tr>
							<td style="BORDER: #c1dad7 1px solid">
								<table style="width: 100%; height: 55px;" border="0"
									cellpadding="0" cellspacing="0">
									<tr>
										<td width="10%" height="55" valign="middle"><img
											src="${pageContext.request.contextPath}/images/user-info.gif" /></td>
										<td width="70%">
											<p class="left_txt2">订单管理</p>
										</td>
										<td width="20%" align="right">
											<div align="center">
												<img src="${pageContext.request.contextPath}/images/ico_Form.gif" width="14" height="14" />&nbsp;<a
													href='javascript:self.location.reload();'>刷新</a>&nbsp;&nbsp;&nbsp;&nbsp;
												<img src="${pageContext.request.contextPath}/images/002.gif" width="14" height="14" /><A
													href="javascript:self.history.back();">返回</A>
											</div>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<script type="text/javascript">
								function check() {
									if (form1.detailid.value == "") {
										alert("请输入订单号");
										form1.detailid.focus();
										return false;
									}

									if ($("#sendcustid").val()==$("#rececustid").val()) {
										alert("发货单位不能和收货单位相同");
										return false;
									}
                                    if($("#sendcity").val()==$("#rececity").val())
                                    {
                                        alert("发货城市和收货城市不能相同");
                                        return false;
                                    }

									if (form1.sendtime.value == "") {
										alert("请输入发送时间");
										form1.sendTime.focus();
										return false;
									}
									if (form1.goodsname.value == "") {
										alert("请输入货物名称");
										form1.goodsname.focus();
										return false;
									}
									if (form1.gcount.value == "") {
										alert("货号或件数不能为空");
										form1.gcount.focus();
										return false;
									}
									if (isNaN(form1.gcount.value)) {
										alert("货号或件数只能为0~9之间的数字");
										form1.gcount.focus();
										return false;
									}
									if (form1.sendfee.value == "") {
										alert("请输入运输费用");
										form1.sendfee.focus();
										return false;
									}
									if (isNaN(form1.sendfee.value)) {
										alert("运输费用含有非法字符");
										form1.sendfee.focus();
										return false;
									}

									if (form1.insurancefee.value == "") {
										alert("请输入保险费用");
										form1.insurancefee.focus();
										return false;
									}
									if (isNaN(form1.insurancefee.value)) {
										alert("保险费用只能为0~9之间的数字");
										form1.insurancefee.focus();
										return false;
									}
									if (form1.otherfee.value == "") {
										alert("请输入其他费用");
										form1.otherfee.focus();
										return false;
									}
									if (isNaN(form1.otherfee.value)) {
										alert("费用只能为0~9之间的数字");
										form1.otherfee.focus();
										return false;
									}

									return true;
								}
							</script>
								<script type="text/javascript">

                                    layui.use('layer', function(){
                                        var layer = layui.layer;
                                        var cardetailAdd='${cardetailAdd}';
                                        if(cardetailAdd!=""){
                                            layer.open({
                                                title:0
                                                ,content:cardetailAdd
                                                ,skin: 'demo-class'
                                                ,offset: 'auto'
                                                ,anim: 1
                                                ,time:2000
                                            })
                                            if(cardetailAdd=="添加成功"){
                                                window.setTimeout(function () {
                                                    location.href="${pageContext.request.contextPath}/load/carDetaillist.action";
                                                },1000)
                                            }
                                        }
                                    })

								</script>
								<form
									action="${pageContext.request.contextPath}/cardetail/cardetailAdd.action"
									method="post" name="form1" onsubmit="return check();">
									<input type="hidden" name="users.id" value="${sessionScope.users.id}"/>
									<input type="hidden" name="orderid" value="未处理"/>
									<table align="center" border="1" cellpadding="2"
										cellspacing="1">
										<tr>
											<td align="right">订单号：</td>
											<%
												String date = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
											%>
											<td><input type="text" name="detailid" value="<%=date%>" readonly>&nbsp;&nbsp;<font color="red">不可编辑</font></td>
											<td align="right">托运日期：</td>

											<td><%--<input type="text" name="sendTime" id="d_sr"
												cssClass="easyui-datebox"
												value="<%=strdate.substring(0, pos)%>"><font
													size="2" color="red">格式:2008-8-8</font>--%>
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
											<td align="right">运输车辆：</td>
											<td><select name="transcar.transid" style="width: 330px">
													<c:forEach items="${transCars}" var="car">
														<option value="${car.transid }">${car.car.cardno }，<fmt:formatDate value="${car.sendtime }" pattern="yyyy-MM-dd"/> ==&nbsp;&nbsp;${car.sendcity.areaname }--->${car.rececity.areaname }</option>
													</c:forEach>
											</select></td>
										</tr>
										<tr>
											<td align="right">发货单位：</td>
											<td><select name="sendcustid.customerid" id="sendcustid" style="width: 255px">
													<c:forEach items="${custs}" var="custs">
														<option value="${custs.customerid }">${custs.customername }|${custs.contactname }|${custs.phone }</option>
													</c:forEach>
											</select></td>
											<td align="right">发货城市：</td>
											<td><select name="sendcity.areaid" id="sendcity" style="width: 155px">
													<c:forEach items="${areas}" var="area">
														<option value="${area.areaid }">${area.areaname }</option>
													</c:forEach>
											</select></td>
											<td align="right">发货地址：</td>
											<td><input type="text" name="startaddr" size="50"></td>
										</tr>
										<tr>
											<td align="right">收货单位：</td>
											<td><select name="rececustid.customerid" id="rececustid" style="width: 255px">
													<c:forEach items="${custs}" var="custs">
														<option value="${custs.customerid }">${custs.customername }|${custs.contactname }|${custs.phone }</option>
													</c:forEach>
											</select></td>
											<td align="right">收货城市：</td>
											<td><select name="rececity.areaid" id="rececity" style="width: 155px">
													<c:forEach items="${areas}" var="area">
														<option value="${area.areaid }">${area.areaname }</option>
													</c:forEach>
											</select></td>
											<td align="right">收货地址：</td>
											<td><input type="text" name="endaddr" size="50"></td>
										</tr>
										<tr>
											<td align="right">收货人：</td>
											<td><input type="text" name="receperson"></td>
											<td align="right">电话：</td>
											<td><input type="text" name="phone"></td>
											<td align="right">随货通行：</td>
											<td><input type="text" name="sendgoods" size="50"></td>
										</tr>
										<tr>
											<td colspan="6" align="center"><h3>订&nbsp;&nbsp;单&nbsp;&nbsp;明&nbsp;&nbsp;细</h3></td>
										</tr>
										<tr>
											<td colspan="6">
												<table align="center" border="1" cellpadding="0"
													cellspacing="0" width="100%">
													<tr>
														<td style="BORDER: #c1dad7 1px solid" align="center">货物名称</td>
														<td style="BORDER: #c1dad7 1px solid" align="center">包装</td>
														<td style="BORDER: #c1dad7 1px solid" align="center">货号/件数</td>
														<td style="BORDER: #c1dad7 1px solid" align="center">运费</td>
														<td style="BORDER: #c1dad7 1px solid" align="center">保险3%<sub>0</sub></td>
														<td style="BORDER: #c1dad7 1px solid" align="center">其他费用</td>
														<td style="BORDER: #c1dad7 1px solid" align="center">结算方式</td>
													</tr>
													<tr align="center">
														<td style="BORDER: #c1dad7 1px solid"><input
															type="text" name="goodsname"></td>
														<td style="BORDER: #c1dad7 1px solid"><input
															type="text" name="unitname" size="10"></td>
														<td style="BORDER: #c1dad7 1px solid"><input
															type="text" name="gcount" size="10" value="0"></td>
														<td style="BORDER: #c1dad7 1px solid"><input
															type="text" name="sendfee" size="10" value="0"></td>
														<td style="BORDER: #c1dad7 1px solid"><input
															type="text" name="insurancefee" size="10" value="0"></td>
														<td style="BORDER: #c1dad7 1px solid"><input
															type="text" name="otherfee" size="10" value="0"></td>
														<td style="BORDER: #c1dad7 1px solid"><select
															name="paidtype.paidid" style="width: 155px">
																<c:forEach items="${paidtypes}" var="paidtype">
																	<option value="${paidtype.paidid }">${paidtype.paidname }</option>
																</c:forEach>
														</select></td>
													</tr>
												</table>
											</td>
										</tr>
										<tr>


											<td align="right">补充说明：</td>
											<td colspan="4"><input type="text" name="demo"
												size="100"></td>
											<td align="left">是否结算：<select name="paidstuats">
												<option value="未付款">未付款</option>
												<option value="已付款">已付款</option>
											</select> </td>

										</tr>
										<tr>
											<td colspan="6" align="center"><input type="submit"
												value="  保 存 "></td>
										</tr>
									</table>
								</form></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
	<SCRIPT src="js/transform.js" type=text/javascript></SCRIPT>
</body>
</html>
