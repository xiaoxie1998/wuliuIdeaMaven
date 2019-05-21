<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.text.SimpleDateFormat" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1">
<title>收/付款开单</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css" type="text/css"
	media="screen" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css"
	media="screen" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/invalid.css" type="text/css"
	media="screen" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" media="all">
	<script src="${pageContext.request.contextPath}/layui/layui.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
</head>
<body>
	<div id="maintitle">
		<div id="mainico"></div>
		<div id="maintip">
			<strong>位置：</strong>收/付款开单
		</div>
	</div>
	<div class="content-box role">
		<div class="content-box-content">
			<div class="tab-content default-tab" id="form">
				<div>
					<table style="width: 100%;" border="0" cellpadding="0"
						cellspacing="0">
						<tr>
							<td style="BORDER-BOTTOM: #c1dad7 1px solid">
								<table style="width: 100%; height: 55px;" border="0"
									cellpadding="0" cellspacing="0">
									<tr>
										<td width="10%" height="55" valign="middle"><img
											src="${pageContext.request.contextPath}/images/user-info.gif" /></td>
										<td width="70%">
											<p class="left_txt2">收/付款开单</p>
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
									if (form1.facefee.value == "") {
										alert("请输入收/付款金额");
										form1.facefee.focus();
										return false;
									}
									if (isNaN(form1.facefee.value)) {
										alert("收/付款金额含有非法字符");
										form1.facefee.focus();
										return false;
									}
									if (parseInt(form1.facefee.value) <= 0) {
										alert("收付款金额必须大于0");
										form1.facefee.focus();
										return false;
									}
									if (form1.paidtime.value == "") {
										alert("请输入收/付款时间，格式如：2014-08-08");
										form1.paidtime.focus();
										return false;
									}
									return true;
								}
							</script>
<script type="text/javascript">
	$(function () {
		$("#paidtype").change(function () {
		    var paidtype=$(this).val();
			if(paidtype=="收款"){
			    $("#facefee").val('${cust.factmoney }');
			}else if(paidtype=="付款"){
                $("#facefee").val('${cust.paidmoney }');
			}
        })
    })
</script>
								<script type="text/javascript">

                                    layui.use('layer', function(){
                                        var layer = layui.layer;
                                        var balanceAdd='${balanceAdd}';
                                        if(balanceAdd!=""){
                                            layer.open({
                                                title:0
                                                ,content:balanceAdd
                                                ,skin: 'demo-class'
                                                ,offset: 'auto'
                                                ,anim: 1
                                                ,time:2000
                                            })
                                            if(balanceAdd=="添加成功"){
                                                window.setTimeout(function () {
                                                    location.href="${pageContext.request.contextPath}/load/customerlist.action";
                                                },1000)
                                            }
                                        }
                                    })

								</script>

								<form action="${pageContext.request.contextPath}/balance/balanceAdd.action"
									method="post" name="form1" onsubmit="return check();">
									<input type="hidden" name="users.id" value="${users.id}"/>
                                    <input type="hidden" name="isvalid" value="有效"/>
									<table align="center" border="1" cellpadding="2"
										cellspacing="1">
										<input type="hidden" name="customer.customerid"
											value="${cust.customerid }" />
										<tr>
											<td align="right">客户名称：</td>
											<td><font size="2" color="red">${cust.customername }&nbsp;&nbsp;&nbsp;&nbsp;联系人：${cust.contactname}&nbsp;&nbsp;&nbsp;&nbsp;电话：${cust.phone}&nbsp;&nbsp;&nbsp;&nbsp;应收金额：${cust.factmoney }&nbsp;&nbsp;&nbsp;&nbsp;应付金额${cust.paidmoney}</font></td>
											<td><font size="2" color="red">&nbsp;</font></td>
										</tr>
										<tr>
											<td align="right">类别：</td>
											<td><select name="paidtype" id="paidtype" style="width: 155px">
													<option value="收款">收款</option>
													<option value="付款">付款</option>
											</select></td>
											<td><font size="2" color="red">&nbsp;</font></td>
										</tr>

										<tr>
											<td align="right">收付款金额：</td>
											<td><input type="text" name="facefee" id="facefee"
												value="${cust.factmoney }"></td>
											<td><font size="2" color="red">&nbsp;</font></td>
										</tr>
										<tr>
											<td align="right">收付款时间：</td>
											<%
												//String strdate = new Date().toLocaleString();
                                                String strdate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
												//int pos = strdate.indexOf(' ');
												//String sdate = strdate.substring(0, pos);
											%>
											<td><input type="text" name="paidtime"
												value="<%=strdate%>" readonly><font size="2" color="red">格式：2014-03-10 00:00:00</font></td>
											<td><font size="2" color="red">&nbsp;</font></td>
										</tr>
										<tr>
											<td align="right">补充说明：</td>
											<td><input type="text" name="demo" size="50"></td>
											<td><font size="2" color="red">&nbsp;</font></td>
										</tr>
										<tr>
											<td colspan="3" align="center"><input type="submit"
												value="  收（付）款 "></td>
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
