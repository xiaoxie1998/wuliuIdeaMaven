<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link rel="StyleSheet" href="${pageContext.request.contextPath}/css/dtree.css" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/menu.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
</head>
<body style="background-color:#FFFFFF;margin:0;">
<script type="text/javascript">

d = new dTree('d');
d.add(0,-1,'&nbsp;系统菜单','','${pageContext.request.contextPath}/images/daohang.jpg');
if(1=="1")
{
d.add(1,0,'&nbsp;用户管理','','${pageContext.request.contextPath}/images/ico_System.gif','${pageContext.request.contextPath}/images/ico_System.gif');
}

<c:forEach items="${listAcc}" var="accmoudle">
    <c:if test="${accmoudle.module.moduleid==1}">
        d.add(10,1,'&nbsp;新增用户','${pageContext.request.contextPath}/load/userAdd.action','${pageContext.request.contextPath}/images/send.jpg');
    </c:if>
<c:if test="${accmoudle.module.moduleid==5}">
d.add(91,9,'&nbsp;新增客户','${pageContext.request.contextPath}/load/customerAdd.action','${pageContext.request.contextPath}/images/ico_DecisionMaking.gif');
</c:if>
<c:if test="${accmoudle.module.moduleid==9}">
d.add(31,3,'&nbsp;新增汽车','${pageContext.request.contextPath}/load/carAdd.action','${pageContext.request.contextPath}/images/ico_Page.gif');
</c:if>
<c:if test="${accmoudle.module.moduleid==15}">
d.add(53,5,'&nbsp;未发车','${pageContext.request.contextPath}/load/transCarStartlist.action','${pageContext.request.contextPath}/images/ico_Expert.gif');
</c:if>
<c:if test="${accmoudle.module.moduleid==16}">
d.add(54,5,'&nbsp;已发车','${pageContext.request.contextPath}/load/transCarFinishlist.action','${pageContext.request.contextPath}/images/ico_Expert.gif');
</c:if>
<c:if test="${accmoudle.module.moduleid==19}">
d.add(55,5,'&nbsp;已到站','${pageContext.request.contextPath}/load/transCarOverlist.action','${pageContext.request.contextPath}/images/ico_Expert.gif');
</c:if>
<c:if test="${accmoudle.module.moduleid==29}">
d.add(72,7,'&nbsp;客户往来明细','${pageContext.request.contextPath}/load/balanceRep.action','${pageContext.request.contextPath}/images/Zxtj.gif');
</c:if>
<c:if test="${accmoudle.module.moduleid==30}">
d.add(73,7,'&nbsp;客户往来统计','${pageContext.request.contextPath}/load/balanceRep2.action','${pageContext.request.contextPath}/images/Zxtj.gif');
</c:if>
<c:if test="${accmoudle.module.moduleid==47}">
d.add(82,8,'&nbsp;权限设置','${pageContext.request.contextPath}/load/accModuleList.action','${pageContext.request.contextPath}/images/ico_Passenger.gif');
</c:if>

</c:forEach>



if(1=="1")
{
d.add(11,1,'&nbsp;用户列表','${pageContext.request.contextPath}/load/userlist.action','${pageContext.request.contextPath}/images/ico_System.gif');
}
if(1=="1")
{
//d.add(12,1,'&nbsp;修改资料','kjsdx.aspx','images/ico_Sms.gif');
}
if(1=="1")
{
d.add(15,1,'&nbsp;修改密码','${pageContext.request.contextPath}/load/modifypwd.action','${pageContext.request.contextPath}/images/ico_Search.gif');
}
if(1=="1")
{
d.add(9,0,'&nbsp;客户管理','','${pageContext.request.contextPath}/images/ico_Log.gif','${pageContext.request.contextPath}/images/ico_Log.gif');
}
/*if(1=="1")
{
d.add(91,9,'&nbsp;新增客户','${pageContext.request.contextPath}/load/customerAdd.action','${pageContext.request.contextPath}/images/ico_DecisionMaking.gif');
}*/
if(1=="1")
{
//d.add(92,9,'&nbsp;修改资料','SendDBMsg.jsp','images/ico_Form.gif');
}
if(1=="1")
{
d.add(93,9,'&nbsp;客户资料','${pageContext.request.contextPath}/load/customerlist.action','${pageContext.request.contextPath}/images/ico_DataDict.gif');
}
if(0=="1")
{
//d.add(94,9,'&nbsp;批量发送记录','kdxfsjls.aspx','images/ico_Passenger.gif');
}
if(1=="1")
{
d.add(3,0,'&nbsp;运输工具','','${pageContext.request.contextPath}/images/ico_MaterialClass.gif','${pageContext.request.contextPath}/images/ico_MaterialClass.gif');
}
/*if(1=="1")
{
d.add(31,3,'&nbsp;新增汽车','${pageContext.request.contextPath}/load/carAdd.action','${pageContext.request.contextPath}/images/ico_Page.gif');
}*/
if(1=="1")
{
d.add(32,3,'&nbsp;资料列表','${pageContext.request.contextPath}/load/carlist.action','${pageContext.request.contextPath}/images/ico_Passenger.gif');
}
if(1=="1")
{
d.add(5,0,'&nbsp;运输管理','','${pageContext.request.contextPath}/images/ico_User.gif','${pageContext.request.contextPath}/images/ico_User.gif');
}
if(1=="1")
{
d.add(51,5,'&nbsp;车辆调度','${pageContext.request.contextPath}/load/transCarlist.action','${pageContext.request.contextPath}/images/ico_Role.gif');
}
if(1=="1")
{
d.add(52,5,'&nbsp;订单管理','${pageContext.request.contextPath}/load/carDetaillist.action','${pageContext.request.contextPath}/images/ico_EventSign.gif');
}
/*if(1=="1")
{
d.add(53,5,'&nbsp;未发车','${pageContext.request.contextPath}/load/transCarStartlist.action','${pageContext.request.contextPath}/images/ico_Expert.gif');
}
if(1=="1")
{
d.add(54,5,'&nbsp;已发车','${pageContext.request.contextPath}/load/transCarFinishlist.action','${pageContext.request.contextPath}/images/ico_Expert.gif');
}
if(1=="1")
{
d.add(55,5,'&nbsp;已到站','${pageContext.request.contextPath}/load/transCarOverlist.action','${pageContext.request.contextPath}/images/ico_Expert.gif');
}*/
if(1=="1")
{
d.add(56,5,'&nbsp;订单明细','${pageContext.request.contextPath}/load/carDetailRep.action','${pageContext.request.contextPath}/images/ico_Excel.gif');
}
if(1=="1")
{
//d.add(57,5,'&nbsp;付款状态','kyftj.aspx','images/yw.gif');
}
if(1=="1")
{
//d.add(58,5,'&nbsp;车辆货物明细','kndtj.aspx','images/Zxtj.gif');
}
if(1=="1")
{
d.add(7,0,'&nbsp;财务管理','','${pageContext.request.contextPath}/images/Zxmxtj.gif','${pageContext.request.contextPath}/images/Zxmxtj.gif');
}
if(1=="1")
{
d.add(71,7,'&nbsp;收付款管理','${pageContext.request.contextPath}/load/customerRep.action','${pageContext.request.contextPath}/images/yw.gif');
}
/*if(1=="1")
{
d.add(72,7,'&nbsp;客户往来明细','${pageContext.request.contextPath}/load/balanceRep.action','${pageContext.request.contextPath}/images/Zxtj.gif');
}
if(1=="1")
{
d.add(73,7,'&nbsp;客户往来统计','${pageContext.request.contextPath}/load/balanceRep2.action','${pageContext.request.contextPath}/images/Zxtj.gif');
}*/


if(1=="1")
{
d.add(6,0,'&nbsp;系统管理','','${pageContext.request.contextPath}/images/ico_Resource.gif','${pageContext.request.contextPath}/images/ico_Resource.gif');
}
if(1=="1")
{
d.add(61,6,'&nbsp;区域设置','${pageContext.request.contextPath}/load/arealist.action','${pageContext.request.contextPath}/images/ico_Refresh.gif');
}
if(1=="1")
{
d.add(62,6,'&nbsp;运输工具类别','${pageContext.request.contextPath}/load/sendTypelist.action','${pageContext.request.contextPath}/images/sound.gif');
}
if(1=="1")
{
d.add(63,6,'&nbsp;客户类型设置','${pageContext.request.contextPath}/load/custtypelist.action','${pageContext.request.contextPath}/images/2.gif');
}
if(1=="1")
{
d.add(64,6,'&nbsp;付款方式设置','${pageContext.request.contextPath}/load/paidTypelist.action','${pageContext.request.contextPath}/images/xtyh.gif');
}
if(1=="1")
{
d.add(65,6,'&nbsp;订单状态设置','${pageContext.request.contextPath}/load/orderstslist.action','${pageContext.request.contextPath}/images/xtyh.gif');
}
if(1=="1")
{
d.add(8,0,'&nbsp;安全管理','','${pageContext.request.contextPath}/images/ico_MaterialClass.gif','${pageContext.request.contextPath}/images/ico_MaterialClass.gif');
}
if(1=="1")
{
//d.add(81,8,'&nbsp;模块管理','consumeAction!listmsg2.action','images/ico_Page.gif');
}
/*if(1=="1")
{
d.add(82,8,'&nbsp;权限设置','${pageContext.request.contextPath}/load/accModuleList.action','${pageContext.request.contextPath}/images/ico_Passenger.gif');
}*/
document.write(d);
</script>
</body>
</html>
