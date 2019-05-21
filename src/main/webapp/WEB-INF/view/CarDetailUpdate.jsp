<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1">
<title>订单修改</title>
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
							<td colspan="2"><script type="text/javascript">
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
                                        var cardetailUpdate='${cardetailUpdate}';
                                        if(cardetailUpdate!=""){
                                            layer.open({
                                                title:0
                                                ,content:cardetailUpdate
                                                ,skin: 'demo-class'
                                                ,offset: 'auto'
                                                ,anim: 1
                                                ,time:2000
                                            })
                                            if(cardetailUpdate=="修改成功"){
                                                window.setTimeout(function () {
                                                    location.href="${pageContext.request.contextPath}/load/carDetaillist.action";
                                                },1000)
                                            }
                                        }
                                    })

								</script>
								<form
									action="${pageContext.request.contextPath}/cardetail/cardetailUpdate.action"
									method="post" name="form1" onsubmit="return check();">
									<input type="hidden" name="users.id" value="${carDetail.users.id}"/>
									<input type="hidden" name="orderid" value="${carDetail.orderid}"/>
									<table align="center" border="1" cellpadding="2"
										cellspacing="1">
										<tr>
											<td align="right">订单号：</td>
											<input type="hidden" name="detailid"
												value="${carDetail.detailid }" />
											<td>${carDetail.detailid }</td>
											<td align="right">托运日期：</td>
											<td><%--<input type="text" name="sendTime" id="d_sr"
												cssClass="easyui-datebox" / value="${carDetail.sendTime }"><font
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
                                                            ,value:new Date('${carDetail.sendtime }')
                                                            ,min:new Date().Format("yyyy-MM-dd")
                                                        });
                                                    })
												</script>
											</td>
											<td align="right">运输车辆：</td>
											<td><select name="transcar.transid" style="width: 330px">
													<c:forEach items="${transCars}" var="car">
														<c:if test="${car.transid==carDetail.transcar.transid}">
															<option value="${car.transid }" selected>${car.car.cardno }，<fmt:formatDate value="${car.sendtime }" pattern="yyyy-MM-dd"/> ==&nbsp;&nbsp;${car.sendcity.areaname }--->${car.rececity.areaname }</option>
														</c:if>
														<c:if test="${car.transid != carDetail.transcar.transid}">
															<option value="${car.transid }">${car.car.cardno }，<fmt:formatDate value="${car.sendtime }" pattern="yyyy-MM-dd"/> ==&nbsp;&nbsp;${car.sendcity.areaname }--->${car.rececity.areaname }</option>
														</c:if>
													</c:forEach>
											</select></td>
										</tr>
										<tr>
											<td align="right">发货单位：</td>
											<td><select name="sendcustid.customerid"  id="sendcustid" style="width: 255px">
													<c:forEach items="${custs}" var="custs">
														<c:if test="${custs.customerid== carDetail.sendcustid.customerid}">
															<option value="${custs.customerid }" selected>${custs.customername }|${custs.contactname }|${custs.phone }</option>
														</c:if>
														<c:if test="${custs.customerid != carDetail.sendcustid.customerid}">
															<option value="${custs.customerid }">${custs.customername }|${custs.contactname }|${custs.phone }</option>
														</c:if>
													</c:forEach>
											</select></td>
											<td align="right">发货城市：</td>
											<td><select name="sendcity.areaid" id="sendcity" style="width: 155px">
													<c:forEach items="${areas}" var="area">
														<c:if test="${area.areaid==carDetail.sendcity.areaid}">
															<option value="${area.areaid }" selected>${area.areaname }</option>
														</c:if>
														<c:if test="${area.areaid != carDetail.sendcity.areaid}">
															<option value="${area.areaid }">${area.areaname }</option>
														</c:if>
													</c:forEach>
											</select></td>
											<td align="right">发货地址：</td>
											<td><input type="text" name="startaddr" size="50"
												value="${carDetail.startaddr }"></td>
										</tr>
										<tr>
											<td align="right">收货单位：</td>
											<td><select name="rececustid.customerid" id="rececustid"  style="width: 255px">
													<c:forEach items="${custs}" var="custs">
														<c:if test="${custs.customerid==carDetail.rececustid.customerid}">
															<option value="${custs.customerid }" selected>${custs.customername }|${custs.contactname }|${custs.phone }</option>
														</c:if>
														<c:if test="${custs.customerid !=carDetail.rececustid.customerid}">
															<option value="${custs.customerid }">${custs.customername }|${custs.contactname }|${custs.phone }</option>
														</c:if>
													</c:forEach>
											</select></td>
											<td align="right">收货城市：</td>
											<td><select name="rececity.areaid" id="rececity"  style="width: 155px">
													<c:forEach items="${areas}" var="area">
														<c:if test="${area.areaid==carDetail.rececity.areaid}">
															<option value="${area.areaid }" selected>${area.areaname }</option>
														</c:if>
														<c:if test="${area.areaid != carDetail.rececity.areaid}">
															<option value="${area.areaid }">${area.areaname }</option>
														</c:if>
													</c:forEach>
											</select></td>
											<td align="right">收货地址：</td>
											<td><input type="text" name="endaddr" size="50"
												value="${carDetail.endaddr }"></td>
										</tr>
										<tr>
											<td align="right">收货人：</td>
											<td><input type="text" name="receperson"
												value="${carDetail.receperson }"></td>
											<td align="right">电话：</td>
											<td><input type="text" name="phone"
												value="${carDetail.phone }"></td>
											<td align="right">随货通行：</td>
											<td><input type="text" name="sendgoods" size="50"
												value="${carDetail.sendgoods }"></td>
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
													<tr>
														<td style="BORDER: #c1dad7 1px solid"><input
															type="text" name="goodsname"
															value="${carDetail.goodsname }"></td>
														<td style="BORDER: #c1dad7 1px solid"><input
															type="text" name="unitname" size="10"
															value="${carDetail.unitname }"></td>
														<td style="BORDER: #c1dad7 1px solid"><input
															type="text" name="gcount" size="10"
															value="${carDetail.gcount }"></td>
														<td style="BORDER: #c1dad7 1px solid"><input
															type="text" name="sendfee" size="10"
															value="${carDetail.sendfee }"></td>
														<td style="BORDER: #c1dad7 1px solid"><input
															type="text" name="insurancefee" size="10"
															value="${carDetail.insurancefee }"></td>
														<td style="BORDER: #c1dad7 1px solid"><input
															type="text" name="otherfee" size="10"
															value="${carDetail.otherfee }"></td>
														<td style="BORDER: #c1dad7 1px solid"><select
															name="paidtype.paidid" style="width: 155px">
																<c:forEach items="${paidtypes}" var="paidtype">
																	<c:if test="${paidtype.paidid==carDetail.paidtype.paidid}">
																		<option value="${paidtype.paidid }" selected>${paidtype.paidname }</option>
																	</c:if>
																	<c:if test="${paidtype.paidid != carDetail.paidtype.paidid}">
																		<option value="${paidtype.paidid }">${paidtype.paidname }</option>
																	</c:if>
																</c:forEach>
														</select></td>
													</tr>
												</table>
											</td>
										</tr>
										<tr>
											<td align="right">补充说明：</td>
											<td colspan="4"><input type="text" name="demo"
												size="100" value="${carDetail.demo }"></td>

											<td align="left">是否结算：<select name="paidstuats">
												<c:if test="${carDetail.paidstuats=='未付款'}">
													<option value="未付款" selected>未付款</option>
													<option value="已付款">已付款</option>
												</c:if>
												<c:if test="${carDetail.paidstuats=='已付款'}">
													<option value="未付款">未付款</option>
													<option value="已付款" selected>已付款</option>
												</c:if>

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
	<SCRIPT src="${pageContext.request.contextPath}/js/transform.js" type=text/javascript></SCRIPT>
</body>
</html>
