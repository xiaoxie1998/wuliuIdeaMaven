<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1"><title>
	修改客户资料
</title><meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css" type="text/css" media="screen" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css" media="screen" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/invalid.css" type="text/css" media="screen" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" media="all">
	<script src="${pageContext.request.contextPath}/layui/layui.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
</head>
<body>
     <div id="maintitle"><div id="mainico"></div>
    <div id="maintip"><strong>位置：</strong>修改客户资料</div></div>
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
                <p class="left_txt2">修改客户资料</p>
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
			if(form1.customername.value==""){
				alert("请输入客名称");
				form1.customername.focus();
				return false;
			}


			return true;
		}
	</script>
				<script type="text/javascript">

                    layui.use('layer', function(){
                        var layer = layui.layer;
                        var customerUpdate='${customerUpdate}';
                        if(customerUpdate!=""){
                            layer.open({
                                title:0
                                ,content:customerUpdate
                                ,skin: 'demo-class'
                                ,offset: 'auto'
                                ,anim: 1
                                ,time:2000
                            })
                            if(customerUpdate=="修改成功"){
                                window.setTimeout(function () {
                                    location.href="${pageContext.request.contextPath}/load/customerlist.action";
                                },1000)
                            }
                        }
                    })

				</script>
			
	<form action="${pageContext.request.contextPath}/customer/customerUpdate.action" method="post" name="form1" onsubmit="return check();">
    	<input type ="hidden" name="customerid" value="${cust.customerid }"/>
    	<table align="center" border="1" cellpadding="2" cellspacing="1">
    		<tr>
    			<td align="right">客户名称：</td>
    			<td><input type="text" name="customername"  value="${cust.customername }"></td>
    			<td><font size="2" color="red">*公司名称，必填</font></td>
    		</tr>
    		<tr>
    			<td align="right">联系人：</td>
    			<td><input type="text" name="contactname"  value="${cust.contactname }"></td>
    			<td><font size="2" color="red">*必填</font></td>
    		</tr>
    		<tr>
    			<td align="right">联系电话：</td>
    			<td><input type="text" name="phone"  value="${cust.phone }"></td>
    			<td><font size="2" color="red">*必填</font></td>
    		</tr>
    		<tr>
    			<td align="right">客户类型：</td>
    			<td>
						<select name="customertype.customertypeid" style="width:155px">
						<c:forEach items="${custtypes}" var="custtype">
							<c:if test="${cust.customertype.customertypeid==custtype.customertypeid }">
								<option value="${custtype.customertypeid }" selected>${custtype.customertypename }</option>
							</c:if>
							<c:if test="${cust.customertype.customertypeid != custtype.customertypeid }">
								<option value="${custtype.customertypeid }">${custtype.customertypename }</option>
							</c:if>
						</c:forEach>							

						</select>
				</td>
    			<td><font size="2" color="red">*必填</font></td>
    		</tr>
    		<tr>
    			<td align="right">结算方式：</td>
    			<td>
						<select name="paidtype.paidid" style="width:155px">
						<c:forEach items="${paidtypes}" var="paidtype">
						<c:if test="${cust.paidtype.paidid==paidtype.paidid }">
							<option value="${paidtype.paidid }" selected>${paidtype.paidname }</option>
						</c:if>
						<c:if test="${cust.paidtype.paidid != paidtype.paidid }">
							<option value="${paidtype.paidid }">${paidtype.paidname }</option>
						</c:if>
						</c:forEach>							
						</select>
				</td>
    			<td><font size="2" color="red">*必填</font></td>
    		</tr>
    		<tr>
    			<td align="right">用户区域：</td>
    			<td>
						<select name="area.areaid" style="width:155px">
						<c:forEach items="${areas}" var="area">
						<c:if test="${cust.area.areaid==area.areaid }">
							<option value="${area.areaid }" selected>${area.areaname }</option>
						</c:if>
						<c:if test="${cust.area.areaid != area.areaid }">
							<option value="${area.areaid }">${area.areaname }</option>
						</c:if>
						</c:forEach>							
						</select>
				</td>
    			<td><font size="2" color="red">*必填</font></td>
    		</tr>
    		<tr>
    			<td align="right">应收账款：</td>
    			<td><input type="text" name="factmoney"  value="${cust.factmoney }" readonly="readonly"></td>
    			<td><font size="2" color="red">&nbsp;*不可修改</font></td>
    		</tr>
    		<tr>
    			<td align="right">应付账款：</td>
    			<td><input type="text" name="paidmoney"  value="${cust.paidmoney }" readonly="readonly"></td>
    			<td><font size="2" color="red">&nbsp;*不可修改</font></td>
    		</tr>
    		<tr>
    			<td align="right">通讯地址：</td>
    			<td><input type="text" name="addr"  value="${cust.addr }"></td>
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
