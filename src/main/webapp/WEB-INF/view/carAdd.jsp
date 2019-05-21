<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1">
<title>新增汽车资料</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css" type="text/css"
	media="screen" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css"
	media="screen" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/invalid.css" type="text/css"
	media="screen" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" media="all">
	<script src="${pageContext.request.contextPath}/layui/layui.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
</head>
<body>
	<div id="maintitle">
		<div id="mainico"></div>
		<div id="maintip">
			<strong>位置：</strong>新增汽车资料
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
											<p class="left_txt2">新增汽车资料</p>
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
									if (form1.cardno.value == "") {
										alert("请输入车牌号");
										form1.cardno.focus();
										return false;
									}
                                    if ($("#name").text().trim()=="不可用"){
                                        alert("车牌号已存在");
                                        form1.cardno.focus();
                                        return false;
                                    }
									return true;
								}
							</script>

								<script type="text/javascript">

                                    layui.use('layer', function(){
                                        var layer = layui.layer;
                                        var carAdd='${carAdd}';
                                        if(carAdd!=""){
                                            layer.open({
                                                title:0
                                                ,content:carAdd
                                                ,skin: 'demo-class'
                                                ,offset: 'auto'
                                                ,anim: 1
                                                ,time:2000
                                            })
                                            if(carAdd=="添加成功"){
                                                window.setTimeout(function () {
                                                    location.href="${pageContext.request.contextPath}/load/carlist.action";
                                                },1000)
                                            }
                                        }
                                    })

								</script>
								<script type="text/javascript">
                                    $(function () {
                                        $("#cardno").blur(function () {
                                            var cardno=$(this).val();
                                            if (cardno!=""){
                                                $.ajax({
                                                    url:'${pageContext.request.contextPath}/car/carName.action'
                                                    ,data:"cardno="+cardno
                                                    ,success:function (res) {
                                                        if(res>0)
                                                            $("#name").html("不可用");
                                                        else
                                                            $("#name").html("可用");
                                                    }
                                                })
                                            }else
                                                $("#name").html("*必填");

                                        })
                                        $("#cardno").focus(function(){
                                            $("#name").html("");
                                        })
                                    })
								</script>

								<form action="${pageContext.request.contextPath}/car/carAdd.action"
									method="post" name="form1" onsubmit="return check();">
									<table align="center" border="1" cellpadding="2"
										cellspacing="1">
										<tr>
											<td align="right">车牌号：</td>
											<td><input type="text" name="cardno" id="cardno">&nbsp;&nbsp;&nbsp;<font color="red"><span id="name">*必填</span></font></td>
											<td><font size="2" color="red"></font></td>
										</tr>
										<tr>
											<td align="right">车主姓名：</td>
											<td><input type="text" name="carname"></td>
											<td><font size="2" color="red">&nbsp;</font></td>
										</tr>
										<tr>
											<td align="right">车辆型号：</td>
											<td><input type="text" name="model"></td>
											<td><font size="2" color="red">&nbsp;</font></td>
										</tr>
										<tr>
											<td align="right">公司名称：</td>
											<td><select name="customer.customerid" style="width: 155px">
													<c:forEach items="${custs}" var="cust">
														<option value="${cust.customerid }">${cust.customername }</option>
													</c:forEach>

											</select></td>
											<td><font size="2" color="red">*必填</font></td>
										</tr>
										<tr>
											<td align="right">车辆状态：</td>
											<td><select name="status" style="width: 155px">
													<option value="空闲中">空闲中</option>
													<option value="运货中">运货中</option>
											</select></td>
											<td><font size="2" color="red">*必填</font></td>
										</tr>
										<tr>
											<td align="right">所属地区：</td>
											<td><select name="area.areaid" style="width: 155px">
													<c:forEach items="${areas}" var="area">
														<option value="${area.areaid }">${area.areaname }</option>
													</c:forEach>
											</select></td>
											<td><font size="2" color="red">&nbsp;</font></td>
										</tr>
										<tr>
											<td align="right">联系人：</td>
											<td><input type="text" name="contact"></td>
											<td><font size="2" color="red">&nbsp;</font></td>
										</tr>
										<tr>
											<td align="right">联系电话：</td>
											<td><input type="text" name="mobile"></td>
											<td><font size="2" color="red">&nbsp;</font></td>
										</tr>
										<tr>
											<td align="right">QQ号码：</td>
											<td><input type="text" name="qq"></td>
											<td><font size="2" color="red">&nbsp;</font></td>
										</tr>
										<tr>
											<td align="right">邮箱地址：</td>
											<td><input type="text" name="email"></td>
											<td><font size="2" color="red">&nbsp;</font></td>
										</tr>
										<tr>
											<td align="right">补充说明：</td>
											<td><input type="text" name="demo" size="50"></td>
											<td><font size="2" color="red">&nbsp;</font></td>
										</tr>
										<tr>
											<td colspan="3" align="center"><input type="submit"
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
