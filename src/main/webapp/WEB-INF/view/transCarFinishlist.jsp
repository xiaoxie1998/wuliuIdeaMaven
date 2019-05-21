<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1"><title>
	已发车信息列表
</title><meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
    <div id="maintip"><strong>位置：</strong>已发车信息列表</div></div>
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
                <p class="left_txt2">已发车信息列表</p>
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
        <%--<tr>
        	<td colspan="2">
        	<a href="./TransCarServlet?action=initfinish&currPage=1&opr=first">首页</a>&nbsp;&nbsp;&nbsp;&nbsp;
        	<a href="./TransCarServlet?action=initfinish&currPage=${pages.currPage }&opr=prev">上一页</a>&nbsp;&nbsp;&nbsp;&nbsp;
        	<a href="./TransCarServlet?action=initfinish&currPage=${pages.currPage }&opr=next">下一页</a>&nbsp;&nbsp;&nbsp;&nbsp;
        	<a href="./TransCarServlet?action=initfinish&currPage=${pages.pageCount }&opr=last">末页</a>&nbsp;&nbsp;&nbsp;&nbsp;
        	第${pages.currPage }页&nbsp;&nbsp;&nbsp;&nbsp;
         	共${pages.pageCount }页&nbsp;&nbsp;&nbsp;&nbsp;
         	已发车的有${pages.rowCount }趟车&nbsp;&nbsp;&nbsp;&nbsp;
        	</td>
        </tr>--%>
        <tr>
            <td  colspan="2">
           
            <%--<table align="center" width="800" cellpadding="3" cellspacing="1" border="1">
    	<tr>
    		<td align="center" class="STYLE1" nowrap="nowrap" style="BORDER: #c1dad7 1px solid">车牌号</td>
    		<td align="center" class="STYLE1" nowrap="nowrap" style="BORDER: #c1dad7 1px solid">装车数量</td>
    		<td align="center" class="STYLE1" nowrap="nowrap" style="BORDER: #c1dad7 1px solid">出发地</td>
    		<td align="center" class="STYLE1" nowrap="nowrap" style="BORDER: #c1dad7 1px solid">目的地</td>
    		<td align="center" class="STYLE1" nowrap="nowrap" style="BORDER: #c1dad7 1px solid">发车时间</td>
      		<td align="center" class="STYLE1" nowrap="nowrap" style="BORDER: #c1dad7 1px solid">车辆状态</td>
     		<td align="center" class="STYLE1" nowrap="nowrap" style="BORDER: #c1dad7 1px solid">运输收入</td>
      		<td align="center" class="STYLE1" nowrap="nowrap" style="BORDER: #c1dad7 1px solid">运输成本</td>
    		<td align="center" class="STYLE1" nowrap="nowrap" style="BORDER: #c1dad7 1px solid">司机姓名</td>
    		<td align="center" class="STYLE1" nowrap="nowrap" style="BORDER: #c1dad7 1px solid">司机电话</td>
    		<td align="center" class="STYLE1" nowrap="nowrap" style="BORDER: #c1dad7 1px solid">负责人</td>
    		<td align="center" class="STYLE1" nowrap="nowrap" style="BORDER: #c1dad7 1px solid">负责人电话</td>
    		<td align="center" class="STYLE1" nowrap="nowrap" style="BORDER: #c1dad7 1px solid">运输工具</td>
    		<td align="center" class="STYLE1" nowrap="nowrap" style="BORDER: #c1dad7 1px solid">操作</td>
    	</tr>
    	<c:forEach items="${cars}" var="car">
	    	<tr>
	    		<td class="STYLE1" nowrap="nowrap" style="BORDER: #c1dad7 1px solid">${car.cardno }</td>
	    		<td class="STYLE1" nowrap="nowrap" style="BORDER: #c1dad7 1px solid">${car.gcount }</td>
	    		<td class="STYLE1" nowrap="nowrap" style="BORDER: #c1dad7 1px solid">${car.sendname }</td>
	    		<td class="STYLE1" nowrap="nowrap" style="BORDER: #c1dad7 1px solid">${car.recename}</td>
	    		<td class="STYLE1" nowrap="nowrap" style="BORDER: #c1dad7 1px solid">${car.sendTime }</td>
	    		<td class="STYLE1" nowrap="nowrap" style="BORDER: #c1dad7 1px solid">${car.carStatus }</td>
	    		<td class="STYLE1" nowrap="nowrap" style="BORDER: #c1dad7 1px solid">${car.sendFee }</td>
	    		<td class="STYLE1" nowrap="nowrap" style="BORDER: #c1dad7 1px solid">${car.carFee }</td>
	    		<td class="STYLE1" nowrap="nowrap" style="BORDER: #c1dad7 1px solid">${car.driver }</td>
	    		<td class="STYLE1" nowrap="nowrap" style="BORDER: #c1dad7 1px solid">${car.driverTel }</td>
	    		<td class="STYLE1" nowrap="nowrap" style="BORDER: #c1dad7 1px solid">${car.master }</td>
	    		<td class="STYLE1" nowrap="nowrap" style="BORDER: #c1dad7 1px solid">${car.masterTel }</td>
	    		<td class="STYLE1" nowrap="nowrap" style="BORDER: #c1dad7 1px solid">${car.sendtypename }</td>
	    		<td class="STYLE1" nowrap="nowrap" style="BORDER: #c1dad7 1px solid" align="center">
	    			<input type="hidden" name="isDel" value="${car.carStatus }" id="isDel"/>
	    			<a href="./CarRoadServlet?action=list&transId=${car.transId }">途径站点</a>&nbsp;&nbsp;
	    			<a href="./TransCarServlet?action=finish&transId=${car.transId }&currPage=1&opr=first">已到站</a>&nbsp;&nbsp;
	    			<a href="./CarDetailServlet?action=detail&transId=${car.transId }&currPage=1&opr=first">明细</a>
	    		</td>
	    	</tr>    	
    	</c:forEach>
    </table>--%>


				<table id="demo" lay-filter="test" ></table>
				<script>

                    layui.use('table', function(){
                        var table = layui.table;
                        table.render({
                            elem: '#demo'
                            ,url: '${pageContext.request.contextPath}/transcar/transcarCusPage.action?status=2' //数据接口
                            ,page: true //开启分页
                            ,limit:5
                            ,limits:[5,10,15,20]
                            ,cols: [[ //表头
                                {field: 'car.cardno', title: '车牌号', width:130,align:'center',templet: function(res){
                                        return res.car.cardno;
                                    }  }
                                ,{field: 'gcount', title: '装车数量', width:100,align:'center'}
                                ,{field: 'sendcity.areaname', title: '出发地', width:100,align:'center',templet: function(res){
                                        return res.sendcity.areaname;
                                    }}
                                ,{field: 'rececity.areaname', title: '目的地', width:100,align:'center',templet: function(res){
                                        return res.rececity.areaname;
                                    }}
                                ,{field: 'sendtime', title: '发车时间', width:110,align:'center',templet: function(res){
                                        var date = new Date(res.sendtime).Format("yyyy-MM-dd");
                                        return date;
                                    } }
                                ,{field: 'carstatus', title: '车辆状态', width: 110,align:'center'}
                                ,{field: 'sendfee', title: '运输收入', width:110,align:'center'}
                                ,{field: 'carfee', title: '运输成本', width:110,align:'center' }
                                ,{field: 'driver', title: '司机姓名', width:110,align:'center'}
                                ,{field: 'drivertel', title: '司机电话', width:130,align:'center'}
                                ,{field: 'master', title: '负责人', width:110,align:'center'}
                                ,{field: 'mastertel', title: '负责人电话', width:140,align:'center'}
                                ,{field: 'sendtype.sendtypename', title: '运输工具', width: 110,align:'center',templet: function(res){
                                        return res.sendtype.sendtypename;
                                    } }
                                ,{field: 'score', title: '操作', width: 200,align:'center',toolbar:"#barDemo"}
                            ]]

                        });

                        table.on('tool(test)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
                            var data = obj.data; //获得当前行数据
                            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
                            var tr = obj.tr; //获得当前行 tr 的DOM对象

                            if(layEvent === 'carDetail'){ //明细
                                location.href="${pageContext.request.contextPath}/load/carDetailbyTransIDlist.action?transId="+data.transid;
                                //do somehing
                            } else if(layEvent === 'transStatus'){ //删除

                                layer.confirm('真的修改为已到站么', function(index){


                                    //向服务端发送删除指令
                                    $.ajax({
                                        url:'${pageContext.request.contextPath}/transcar/transcarUpdateStatus.action?status=3'
                                        ,data:"transcarId="+data.transid
                                        ,success:function (res) {
                                            if(res>0){
                                                obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
                                                layer.close(index);
                                                layer.msg("修改成功")
                                            }
                                            else
                                                layer.msg("修改失败")
                                        }
                                    })
                                });
                            } else if(layEvent === 'carRoad') { //途径站点

                                location.href="${pageContext.request.contextPath}/load/carRoad.action?transId="+data.transid;
                            }

                        })


                    })

				</script>

				<!--添加模板-->
				<script type="text/html" id="barDemo">
					<a class="layui-btn layui-btn-xs" lay-event="carRoad">途径站点</a>
                    <c:forEach items="${listAcc}" var="accmoudle">
                        <c:if test="${accmoudle.module.moduleid==18}">
                            <a class="layui-btn layui-btn-xs" lay-event="transStatus">已到站</a>                        </c:if>


                    </c:forEach>

					<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="carDetail">明细</a>

				</script>
            </td>
        </tr>
        <%--<tr>
        	<td colspan="2">
        	<a href="./TransCarServlet?action=initfinish&currPage=1&opr=first">首页</a>&nbsp;&nbsp;&nbsp;&nbsp;
        	<a href="./TransCarServlet?action=initfinish&currPage=${pages.currPage }&opr=prev">上一页</a>&nbsp;&nbsp;&nbsp;&nbsp;
        	<a href="./TransCarServlet?action=initfinish&currPage=${pages.currPage }&opr=next">下一页</a>&nbsp;&nbsp;&nbsp;&nbsp;
        	<a href="./TransCarServlet?action=initfinish&currPage=${pages.pageCount }&opr=last">末页</a>&nbsp;&nbsp;&nbsp;&nbsp;
        	第${pages.currPage }页&nbsp;&nbsp;&nbsp;&nbsp;
         	共${pages.pageCount }页&nbsp;&nbsp;&nbsp;&nbsp;
         	已发车的有${pages.rowCount }趟车&nbsp;&nbsp;&nbsp;&nbsp;
        	</td>
        </tr>--%>
    </table>
  </div></div></div></div>
    <SCRIPT src="${pageContext.request.contextPath}/js/transform.js" type=text/javascript></SCRIPT>
</body>
</html>
