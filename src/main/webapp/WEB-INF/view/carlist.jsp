<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1">
<title>汽车资料列表 </title>
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
			<strong>位置：</strong>汽车资料列表
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
											<p class="left_txt2">
												汽车资料列表&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="red">${delErrror }
											</p>
										</td>
										<td width="20%" align="right">
											<div align="center">
												<c:forEach items="${listAcc}" var="accmoudle">
													<c:if test="${accmoudle.module.moduleid==9}">
														<img src="${pageContext.request.contextPath}/images/ico_Form.gif" width="14" height="14" />&nbsp;<a
														href='${pageContext.request.contextPath}/load/carAdd.action'>新增</a>&nbsp;&nbsp;&nbsp;&nbsp;                     </c:if>
												</c:forEach>

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
						<%--<tr>
							<td colspan="2"><a
								href="./CarServlet?action=list&currPage=1&opr=first">首页</a>&nbsp;&nbsp;&nbsp;&nbsp;
								<a
								href="./CarServlet?action=list&currPage=${pages.currPage }&opr=prev">上一页</a>&nbsp;&nbsp;&nbsp;&nbsp;
								<a
								href="./CarServlet?action=list&currPage=${pages.currPage }&opr=next">下一页</a>&nbsp;&nbsp;&nbsp;&nbsp;
								<a
								href="./CarServlet?action=list&currPage=${pages.pageCount }&opr=last">末页</a>&nbsp;&nbsp;&nbsp;&nbsp;
								第${pages.currPage }页&nbsp;&nbsp;&nbsp;&nbsp; 共${pages.pageCount }页&nbsp;&nbsp;&nbsp;&nbsp;
								共${pages.rowCount }辆车&nbsp;&nbsp;&nbsp;&nbsp;</td>
						</tr>--%>
						<tr>
							<td colspan="2">

								<%--<table align="center" width="800" cellpadding="3"
									cellspacing="1" border="1">
									<tr>
										<td align="center" class="STYLE1" nowrap="nowrap"
											style="BORDER: #c1dad7 1px solid">车牌号</td>
										<td align="center" class="STYLE1" nowrap="nowrap"
											style="BORDER: #c1dad7 1px solid">车主姓名</td>
										<td align="center" class="STYLE1" nowrap="nowrap"
											style="BORDER: #c1dad7 1px solid">型号</td>
										<td align="center" class="STYLE1" nowrap="nowrap"
											style="BORDER: #c1dad7 1px solid">公司名称</td>
										<td align="center" class="STYLE1" nowrap="nowrap"
											style="BORDER: #c1dad7 1px solid">联系人</td>
										<td align="center" class="STYLE1" nowrap="nowrap"
											style="BORDER: #c1dad7 1px solid">联系电话</td>
										<td align="center" class="STYLE1" nowrap="nowrap"
											style="BORDER: #c1dad7 1px solid">QQ号码</td>
										<td align="center" class="STYLE1" nowrap="nowrap"
											style="BORDER: #c1dad7 1px solid">邮箱地址</td>
										<td align="center" class="STYLE1" nowrap="nowrap"
											style="BORDER: #c1dad7 1px solid">所属城市</td>
										<td align="center" class="STYLE1" nowrap="nowrap"
											style="BORDER: #c1dad7 1px solid">车辆状态</td>
										<td align="center" class="STYLE1" nowrap="nowrap"
											style="BORDER: #c1dad7 1px solid">操作</td>
									</tr>
									<c:forEach items="${cars}" var="car">
										<tr>
											<td class="STYLE1" nowrap="nowrap"
												style="BORDER: #c1dad7 1px solid">${car.cardNo }</td>
											<td class="STYLE1" nowrap="nowrap"
												style="BORDER: #c1dad7 1px solid">${car.carName }</td>
											<td class="STYLE1" nowrap="nowrap"
												style="BORDER: #c1dad7 1px solid">${car.model }</td>
											<td class="STYLE1" nowrap="nowrap"
												style="BORDER: #c1dad7 1px solid">${car.customername }</td>
											<td class="STYLE1" nowrap="nowrap"
												style="BORDER: #c1dad7 1px solid">${car.contact }</td>
											<td class="STYLE1" nowrap="nowrap"
												style="BORDER: #c1dad7 1px solid">${car.mobile }</td>
											<td class="STYLE1" nowrap="nowrap"
												style="BORDER: #c1dad7 1px solid">${car.qq }</td>
											<td class="STYLE1" nowrap="nowrap"
												style="BORDER: #c1dad7 1px solid">${car.email }</td>
											<td class="STYLE1" nowrap="nowrap"
												style="BORDER: #c1dad7 1px solid">${car.areaname }</td>
											<td class="STYLE1" nowrap="nowrap"
												style="BORDER: #c1dad7 1px solid">${car.status }</td>
											<td class="STYLE1" nowrap="nowrap"
												style="BORDER: #c1dad7 1px solid" align="center"><a
												href="./CarServlet?action=update&carID=${car.carID }">修改</a>&nbsp;&nbsp;&nbsp;&nbsp;
												<a
												href="./CarServlet?action=del&currPage=1&opr=first&carID=${car.carID }"
												onclick="return confirm('删除确认')">删除</a>&nbsp;&nbsp;&nbsp;&nbsp;
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
                                                ,url: '${pageContext.request.contextPath}/car/carPage.action' //数据接口
                                                ,page: true //开启分页
                                                ,limit:5
                                                ,limits:[5,10,15,20]
                                                ,cols: [[ //表头
                                                    {field: 'cardno', title: '车牌号', width:110,align:'center' }
                                                    ,{field: 'carname', title: '车主姓名', width:100,align:'center'}
                                                    ,{field: 'model', title: '型号', width:100,align:'center'}
                                                    ,{field: 'customer.customername', title: '公司名称', width:170,align:'center',templet: function(res){
                                                                return res.customer.customername;
                                                        } }
                                                    ,{field: 'contact', title: '联系人', width:100,align:'center'}
                                                    ,{field: 'mobile', title: '联系电话', width: 120,align:'center'}
                                                    ,{field: 'qq', title: 'QQ号码',align:'center', width: 120}
                                                    ,{field: 'email', title: '邮箱地址', width:170,align:'center'}
                                                    ,{field: 'area.areaname', title: '所属城市', width:100,align:'center',templet: function(res){
                                                                return res.area.areaname;
                                                        } }
                                                    ,{field: 'status', title: '车辆状态', width: 120,align:'center'}
                                                    ,{field: 'score', title: '操作',align:'center',toolbar:"#barDemo"}
                                                ]]

                                            });

                                            table.on('tool(test)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
                                                var data = obj.data; //获得当前行数据
                                                var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
                                                var tr = obj.tr; //获得当前行 tr 的DOM对象

                                                if(layEvent === 'userUpdate'){ //修改
                                                    location.href="${pageContext.request.contextPath}/load/carUpdate.action?id="+data.carid;
                                                    //do somehing
                                                } else if(layEvent === 'delete'){ //删除

                                                        layer.confirm('真的删除行么', function(index){

                                                            obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
                                                            layer.close(index);
                                                            //向服务端发送删除指令
                                                            $.ajax({
                                                                url:'${pageContext.request.contextPath}/car/carDelete.action'
                                                                ,data:"id="+data.carid
                                                                ,success:function (res) {
                                                                    if(res>0)
                                                                        layer.msg("删除成功")
                                                                    else
                                                                        layer.msg("删除失败")
                                                                }
                                                            })
                                                        });


                                                } else if(layEvent === 'del'){ //修改状态

                                                    //do something
                                                    var staus=data.staus; //获取状态
                                                    if (staus==1){
                                                        staus=0;
                                                    }else if(staus==0){
                                                        staus=1
                                                    }
                                                    //同步更新缓存对应的值
                                                    obj.update({
                                                        staus: staus
                                                    });

                                                    $.ajax({
                                                        url:'${pageContext.request.contextPath}/users/updateStaus.action?id='+data.id
                                                        ,data:"staus="+staus
                                                        ,success:function (res) {
                                                            if(res>0)
                                                                layer.msg("修改成功")
                                                            else
                                                                layer.msg("修改失败")
                                                        }
                                                    })
                                                }
                                            });

                                        })

									</script>

									<!--添加模板-->
									<script type="text/html" id="barDemo">

										<c:forEach items="${listAcc}" var="accmoudle">
											<c:if test="${accmoudle.module.moduleid==11}">
												<a class="layui-btn layui-btn-xs" lay-event="userUpdate">修改</a>
											</c:if>
											<c:if test="${accmoudle.module.moduleid==10}">
												<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="delete">删除</a>
											</c:if>

										</c:forEach>


									</script>
							</td>
						</tr>
						<%--<tr>
							<td colspan="2"><a
								href="./CarServlet?action=list&currPage=1&opr=first">首页</a>&nbsp;&nbsp;&nbsp;&nbsp;
								<a
								href="./CarServlet?action=list&currPage=${pages.currPage }&opr=prev">上一页</a>&nbsp;&nbsp;&nbsp;&nbsp;
								<a
								href="./CarServlet?action=list&currPage=${pages.currPage }&opr=next">下一页</a>&nbsp;&nbsp;&nbsp;&nbsp;
								<a
								href="./CarServlet?action=list&currPage=${pages.pageCount }&opr=last">末页</a>&nbsp;&nbsp;&nbsp;&nbsp;
								第${pages.currPage }页&nbsp;&nbsp;&nbsp;&nbsp; 共${pages.pageCount }页&nbsp;&nbsp;&nbsp;&nbsp;
								共${pages.rowCount }辆车&nbsp;&nbsp;&nbsp;&nbsp;</td>
						</tr>--%>
					</table>
				</div>
			</div>
		</div>
	</div>
	<SCRIPT src="${pageContext.request.contextPath}/js/transform.js" type=text/javascript></SCRIPT>
</body>
</html>
