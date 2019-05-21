<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.text.SimpleDateFormat" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1"><title>
	途径路线明细
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
    <div id="maintip"><strong>位置：</strong>途径路线明细</div></div>
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
                <p class="left_txt2">途径路线明细:<font color="red">车牌：${trans.car.cardno },起点站：${trans.sendcity.areaname }=====>终点站：${trans.rececity.areaname }====发出时间：<fmt:formatDate value="${trans.sendtime }" pattern="yyyy-MM-dd"/> </font></p>
            </td>
            <td width="20%" align="right">
            <div align="center">
            <img src="${pageContext.request.contextPath}/images/ico_Form.gif" width="14" height="14" />&nbsp;<a href='${pageContext.request.contextPath}/load/carRoad.action?transId=${trans.transid }'; >刷新</a>&nbsp;&nbsp;&nbsp;&nbsp;
            <img src="${pageContext.request.contextPath}/images/002.gif" width="14" height="14" /><A href="javascript:self.history.back();">返回</A></div>
           </td>
            </tr>
            </table>
            </td>
        </tr>
        <tr>
            <td  colspan="2">
            <script language="javascript">
            	function check(){
            		if($("#startcity").val()==$("#endcity").val())
            		{
            			alert("出发站和下一站不能相同");
            			return false;
            		}
            		if(new Date($("#test1").val()).getTime()>=new Date($("#test2").val()).getTime()){
                        alert("出发时间不能大于到达时间")
                        return false;
					}

            		return true;
            	}
            </script>
				<script type="text/javascript">

                    layui.use('layer', function(){
                        var layer = layui.layer;
                        var carroadAdd='${carroadAdd}';
                        if(carroadAdd!=""){
                            layer.open({
                                title:0
                                ,content:carroadAdd
                                ,skin: 'demo-class'
                                ,offset: 'auto'
                                ,anim: 1
                                ,time:2000
                            })
                        }
                    })
				</script>

				<c:forEach items="${listAcc}" var="accmoudle">
					<c:if test="${accmoudle.module.moduleid==32}">

						<form action="${pageContext.request.contextPath}/carroad/carroadAdd.action" method="post" name="form1" onsubmit="return check();">
								<%----%>
								<%--<input type="hidden" name="action" value="${road.action }"/>--%>
								<%--<input type="hidden" name="roadid" value="${road.roadid }"/>--%>
							<input type="hidden" name="transcar.transid" value="${trans.transid }"/>
							<table border="0" align="left" cellpadding="2" cellspacing="1" >
								<tr>
									<td height="30" class="STYLE1" nowrap="nowrap" style="BORDER-BOTTOM: #c1dad7 1px solid"><div align="right">出发站：</div></td>
									<td class="STYLE1"  style="BORDER-BOTTOM: #c1dad7 1px solid">
										<select name="startcity.areaid" id="startcity" style="width:155px">
											<c:forEach items="${areas}" var="area">
												<c:if test="${area.areaid==trans.sendcity.areaid}">
													<option value="${area.areaid }" selected>${area.areaname }</option>
												</c:if>
												<c:if test="${area.areaid != trans.sendcity.areaid}">
													<option value="${area.areaid }">${area.areaname }</option>
												</c:if>
											</c:forEach>
										</select>
									</td>
									<td height="30" class="STYLE1" nowrap="nowrap" style="BORDER-BOTTOM: #c1dad7 1px solid"><div align="right">出发时间：</div></td>
									<td class="STYLE1"  style="BORDER-BOTTOM: #c1dad7 1px solid">
											<%--<input type="text" name="starttime"  value="2019-1-12">--%>
										<div class="layui-input-inline">
											<input type="text" value=""  name="starttime" class="layui-input" id="test1" placeholder="yyyy-MM-dd">
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
									<td height="30" class="STYLE1" nowrap="nowrap" style="BORDER-BOTTOM: #c1dad7 1px solid"><div align="right">下一站：</div></td>
									<td class="STYLE1"  style="BORDER-BOTTOM: #c1dad7 1px solid">
										<select name="endcity.areaid" id="endcity" style="width:155px">
											<c:forEach items="${areas}" var="area">
												<c:if test="${area.areaid==trans.rececity.areaid}">
													<option value="${area.areaid }" selected>${area.areaname }</option>
												</c:if>
												<c:if test="${area.areaid != trans.rececity.areaid}">
													<option value="${area.areaid }">${area.areaname }</option>
												</c:if>
											</c:forEach>
										</select>

									</td>
									<td height="30" class="STYLE1" nowrap="nowrap" style="BORDER-BOTTOM: #c1dad7 1px solid"><div align="right">到达时间：</div></td>
									<td class="STYLE1"  style="BORDER-BOTTOM: #c1dad7 1px solid">

											<%--<input type="text" name="endtime"  value="2019-03-12">--%>
										<div class="layui-input-inline">
											<input type="text"   name="endtime" class="layui-input" id="test2" placeholder="yyyy-MM-dd">
										</div>

										<script>
                                            layui.use('laydate', function() {
                                                var laydate = layui.laydate;

                                                //常规用法
                                                laydate.render({
                                                    elem: '#test2'
                                                    ,theme: 'molv'
                                                    ,value:new Date()
                                                    ,min:new Date().Format("yyyy-MM-dd")
                                                });
                                            })
										</script>
									</td>
									<td><input type="submit" value=" 保 存 "></td>
								</tr>
								<tr>
									<td class="STYLE1"  style="BORDER-BOTTOM: #c1dad7 1px solid" colspan="9" align="center"><h3>途&nbsp;&nbsp;径&nbsp;&nbsp;路&nbsp;&nbsp;线&nbsp;&nbsp;明&nbsp;&nbsp;细</h3></td>
								</tr>
							</table>
						</form>

					</c:if>

				</c:forEach>

            </td>
        </tr>
        <tr>
        	<td>
        	<%--<table border="0" align="left" cellpadding="2" cellspacing="1" >
			  <tr>
			    <td height="30" class="STYLE1" nowrap="nowrap" style="BORDER: #c1dad7 1px solid">
			    <div align="center">出发站</div></td>
			    <td class="STYLE1"  style="BORDER: #c1dad7 1px solid"><div align="center">出发时间</div></td>
			    <td class="STYLE1"  style="BORDER: #c1dad7 1px solid"><div align="center">下一站</div></td>
			    <td class="STYLE1"  style="BORDER: #c1dad7 1px solid"><div align="center">到达时间</div></td>
			    <td class="STYLE1"  style="BORDER: #c1dad7 1px solid"><div align="center">操作</div></td>
			  </tr>
			  <%if(request.getAttribute("roads") !=null){ %>
			  <c:forEach items="${roads}" var="roads">
			   <tr>
			    <td height="30" class="STYLE1" nowrap="nowrap" style="BORDER: #c1dad7 1px solid"><div align="center">${roads.startcityname }</div></td>
			    <td class="STYLE1"  style="BORDER: #c1dad7 1px solid"><div align="center">${roads.starttime}</div></td>
			    <td class="STYLE1"  style="BORDER: #c1dad7 1px solid"><div align="center">${roads.endcityname}</div></td>
			    <td class="STYLE1"  style="BORDER: #c1dad7 1px solid"><div align="center">${roads.endtime}</div></td>
			    <td class="STYLE1"  style="BORDER: #c1dad7 1px solid"><div align="center">
					<a href="./CarRoadServlet?action=update&roadid=${roads.roadid }">修改</a>&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="./CarRoadServlet?action=del&roadid=${roads.roadid}" onclick="return confirm('删除确认')">删除</a>
			    </td>
			  </tr>
			  </c:forEach>
			  <%} %>
			</table>--%>

				<table id="demo" lay-filter="test" ></table>
				<script>

                    layui.use('table', function(){
                        var table = layui.table;
                        table.render({
                            elem: '#demo'
                            ,url: '${pageContext.request.contextPath}/carroad/carroadTansPage.action?transId=${trans.transid }' //数据接口
                            ,page: true //开启分页
                            ,limit:5
                            ,limits:[5,10,15,20]
                            ,cols: [[ //表头
                                {field: 'startcity.areaname', title: '出发站', width:220,align:'center',templet: function(res){
                                       return res.startcity.areaname;
                                    }  }
                                ,{field: 'starttime', title: '出发时间', width:250,align:'center',templet: function(res){
                                        var date = new Date(res.starttime).Format("yyyy-MM-dd");

                                        return date;
                                    } }
                                ,{field: 'endcity.areaname', title: '下一站', width:220,align:'center',templet: function(res){
                                       return res.endcity.areaname;
                                    } }
                                ,{field: 'endtime', title: '到达时间', width:250,align:'center',templet: function(res){
                                        var date = new Date(res.endtime).Format("yyyy-MM-dd");

                                        return date;
                                    } }

                                ,{field: 'score', title: '操作',align:'center',toolbar:"#barDemo"}
                            ]]

                        });

                        table.on('tool(test)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
                            var data = obj.data; //获得当前行数据
                            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
                            var tr = obj.tr; //获得当前行 tr 的DOM对象

                            if(layEvent === 'userUpdate'){ //修改
                                location.href="${pageContext.request.contextPath}/load/userUpdate.action?id="+data.id;
                                //do somehing
                            } else if(layEvent === 'delete'){ //删除

                                    layer.confirm('真的删除行么', function(index){

                                        //向服务端发送删除指令
                                        $.ajax({
                                            url:'${pageContext.request.contextPath}/carroad/carroadDelete.action'
                                            ,data:"id="+data.roadid
                                            ,success:function (res) {
                                                if(res>0){
                                                    obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
                                                    layer.close(index);
                                                    layer.msg("删除成功")
                                                }
                                                else
                                                    layer.msg("删除失败")
                                            }
                                        })
                                    });
                            }
                        });

                    })

				</script>

				<!--添加模板-->
				<script type="text/html" id="barDemo">

					<c:forEach items="${listAcc}" var="accmoudle">
						<c:if test="${accmoudle.module.moduleid==34}">
							<a class="layui-btn layui-btn-xs" lay-event="userUpdate">修改</a>&nbsp;&nbsp;&nbsp;&nbsp;
						</c:if>
						<c:if test="${accmoudle.module.moduleid==33}">
							<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="delete">删除</a>
						</c:if>

					</c:forEach>

				</script>
        	</td>
        </tr>
    </table>
  </div></div></div></div>
    <SCRIPT src="${pageContext.request.contextPath}/js/transform.js" type=text/javascript></SCRIPT>
</body>
</html>
