<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1"><title>
	搜索目标客户
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
    <div id="maintip"><strong>位置：</strong>收付款管理</div></div>
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
                <p class="left_txt2">第一步：搜索目标客户</p>
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
            <form action="#" method="post" name="form1" onsubmit="return false;" >
            <table border="0" align="left" cellpadding="2" cellspacing="1" >
			  <tr>
			    <td height="30" class="STYLE1" nowrap="nowrap" style="BORDER-BOTTOM: #c1dad7 1px solid"><div align="right">客户名称：</div></td>
			    <td class="STYLE1"  style="BORDER-BOTTOM: #c1dad7 1px solid"><input type="text" name="customername" id="customername"></td>
			    <td height="30" class="STYLE1" nowrap="nowrap" style="BORDER-BOTTOM: #c1dad7 1px solid"><div align="right">客户类别：</div></td>
			    <td class="STYLE1"  style="BORDER-BOTTOM: #c1dad7 1px solid">
						<select name="customertypeid" id="customertypeid" style="width:155px">
						<option value="0">-----不选-----</option>
						<c:forEach items="${custtypes}" var="custtype">
							<option value="${custtype.customertypeid }">${custtype.customertypename }</option>
						</c:forEach>							
						</select>
				</td>
			  	<td><input type="submit" onclick="customerModify()" value=" 查 找 "></td>
			  </tr>
			   <tr>
			    <td class="STYLE1"  style="BORDER-BOTTOM: #c1dad7 1px solid" colspan="9" align="center"><h3>客&nbsp;&nbsp;户&nbsp;&nbsp;资&nbsp;&nbsp;料&nbsp;&nbsp;明&nbsp;&nbsp;细</h3></td>
			  </tr>
			</table>
	</form>
            </td>
        </tr>
        <tr>
        	<td>
        	<%--<table align="center" width="800" cellpadding="3" cellspacing="1" border="1">
    	<tr>
    		<td align="center" class="STYLE1" nowrap="nowrap" style="BORDER: #c1dad7 1px solid">客户名称</td>
    		<td align="center" class="STYLE1" nowrap="nowrap" style="BORDER: #c1dad7 1px solid">联系人</td>
    		<td align="center" class="STYLE1" nowrap="nowrap" style="BORDER: #c1dad7 1px solid">联系电话</td>
    		<td align="center" class="STYLE1" nowrap="nowrap" style="BORDER: #c1dad7 1px solid">结算方式</td>
    		<td align="center" class="STYLE1" nowrap="nowrap" style="BORDER: #c1dad7 1px solid">所在区域</td>
    		<td align="center" class="STYLE1" nowrap="nowrap" style="BORDER: #c1dad7 1px solid">客户类型</td>
    		<td align="center" class="STYLE1" nowrap="nowrap" style="BORDER: #c1dad7 1px solid">应收金额</td>
    		<td align="center" class="STYLE1" nowrap="nowrap" style="BORDER: #c1dad7 1px solid">应付金额</td>
    		<td align="center" class="STYLE1" nowrap="nowrap" style="BORDER: #c1dad7 1px solid">操作</td>
    	</tr>
    	<c:forEach items="${custs}" var="cust">
	    	<tr>
	    		<td class="STYLE1" nowrap="nowrap" style="BORDER: #c1dad7 1px solid">${cust.customername }</td>
	    		<td class="STYLE1" nowrap="nowrap" style="BORDER: #c1dad7 1px solid">${cust.contactname }</td>
	    		<td class="STYLE1" nowrap="nowrap" style="BORDER: #c1dad7 1px solid">${cust.phone }</td>
	    		<td class="STYLE1" nowrap="nowrap" style="BORDER: #c1dad7 1px solid">${cust.paidname }</td>
	    		<td class="STYLE1" nowrap="nowrap" style="BORDER: #c1dad7 1px solid">${cust.areaname }</td>
	    		<td class="STYLE1" nowrap="nowrap" style="BORDER: #c1dad7 1px solid">${cust.customertypename }</td>
	    		<td class="STYLE1" nowrap="nowrap" style="BORDER: #c1dad7 1px solid">${cust.faceMoney }</td>
	    		<td class="STYLE1" nowrap="nowrap" style="BORDER: #c1dad7 1px solid">${cust.paidMoney }</td>
	    		<td class="STYLE1" nowrap="nowrap" style="BORDER: #c1dad7 1px solid" align="center">
	    			<a href="./BalanceServlet?action=init&customerid=${cust.customerid }">收/付款</a>&nbsp;&nbsp;
	    			<a href="./BalanceServlet?action=list&currPage=1&opr=first&customerid=${cust.customerid }">收付款明细</a>&nbsp;&nbsp;
	    			<a href="./CarDetailServlet?action=cdetail&customerid=${cust.customerid}&currPage=1&opr=first">订单明细</a>&nbsp;&nbsp;
	    		</td>
	    	</tr>    	
    	</c:forEach>
    </table>
        	--%>


				<table id="demo" lay-filter="test" ></table>

				<script>
                    function customerModify() {
                        layui.use('table', function(){
                            var table = layui.table;
                            table.render({
                                elem: '#demo'
                                ,url: '${pageContext.request.contextPath}/customer/customerModify.action' //数据接口
                                ,method:"post"
                                ,where:{'customername':$("#customername").val(),
                                    'customertype.customertypeid':$("#customertypeid").val()
                                }
                                ,page: true //开启分页
                                ,limit:5
                                ,limits:[5,10,15,20]
                                ,cols: [[ //表头
                                    {field: 'customername', title: '客户名称', width:180,align:'center' }
                                    ,{field: 'contactname', title: '联系人', width:90,align:'center'}
                                    ,{field: 'phone', title: '联系电话', width:120,align:'center'}
                                    ,{field: 'paidtype.paidname', title: '结算方式', width:90,align:'center',templet:function (res) {
                                            return res.paidtype.paidname;
                                        }}
                                    ,{field: 'area.areaname', title: '所在区域', width:110,align:'center',templet :function (res) {
                                            return res.area.areaname;
                                        }}
                                    ,{field: 'customertype.customertypename', title: '客户类型', width: 110,align:'center',templet :function (res) {
                                            return res.customertype.customertypename;
                                        }}
                                    ,{field: 'factmoney', title: '应收金额', width: 100,align:'center'}
                                    ,{field: 'paidmoney', title: '应付金额', width: 100,align:'center'}
                                    ,{field: '', title: '操作',align:'center',toolbar:"#barDemo"}
                                ]]

                            });



                        })

                    }
                    layui.use('table', function() {
                        var table = layui.table;
                        table.on('tool(test)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
                            var data = obj.data; //获得当前行数据
                            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
                            var tr = obj.tr; //获得当前行 tr 的DOM对象

                            if(layEvent === 'balanceAdd'){ //收付款
                                location.href="${pageContext.request.contextPath}/load/balanceAdd.action?id="+data.customerid;
                                //do somehing
                            }else if(layEvent === 'balancelist'){ //收付款明细
                                location.href="${pageContext.request.contextPath}/load/balancelist.action?customerId="+data.customerid;
                                //do somehing
                            }else if(layEvent === 'cardetail'){ //订单明细
                                location.href="${pageContext.request.contextPath}/load/carDetailbyCustomerIDlist.action?customerId="+data.customerid;
                                //do somehing
                            }

                        });

                    })

				</script>

				<!--添加模板-->
				<script type="text/html" id="barDemo">

					<a class="layui-btn layui-btn-xs" lay-event="balanceAdd">收/付款</a>
					<a class="layui-btn layui-btn-xs" lay-event="balancelist">收付款明细</a>
					<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="cardetail">订单明细</a>

				</script>
        	</td>
        </tr>
    </table>
  </div></div></div></div>
    <SCRIPT src="${pageContext.request.contextPath}/js/transform.js" type=text/javascript></SCRIPT>
</body>
</html>
