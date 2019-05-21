<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1">
<title>客户收（付）款明细</title>
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
	<script src="${pageContext.request.contextPath}/js/date.js"></script>
</head>
<body>
	<div id="maintitle">
		<div id="mainico"></div>
		<div id="maintip">
			<strong>位置：</strong>客户收（付）款明细
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
											<p class="left_txt2">客户收（付）款明细</p>
										</td>
										<td width="20%" align="right">
											<div align="center">
												<img src="${pageContext.request.contextPath}/images/ico_Form.gif" width="14" height="14" />&nbsp;<a
													href='${pageContext.request.contextPath}/load/balanceAdd.action?id=${customerId}'>收/付款</a>&nbsp;&nbsp;&nbsp;&nbsp;
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
								href="./BalanceServlet?action=list&currPage=1&opr=first&customerid=${customerid }">首页</a>&nbsp;&nbsp;&nbsp;&nbsp;
								<a
								href="./BalanceServlet?action=list&currPage=${pages.currPage }&opr=prev&customerid=${customerid }">上一页</a>&nbsp;&nbsp;&nbsp;&nbsp;
								<a
								href="./BalanceServlet?action=list&currPage=${pages.currPage }&opr=next&customerid=${customerid }">下一页</a>&nbsp;&nbsp;&nbsp;&nbsp;
								<a
								href="./BalanceServlet?action=list&currPage=${pages.pageCount }&opr=last&customerid=${customerid }">末页</a>&nbsp;&nbsp;&nbsp;&nbsp;
								第${pages.currPage }页&nbsp;&nbsp;&nbsp;&nbsp; 共${pages.pageCount }页&nbsp;&nbsp;&nbsp;&nbsp;
								共${pages.rowCount }笔记录&nbsp;&nbsp;&nbsp;&nbsp;</td>
						</tr>--%>
						<tr>
							<td colspan="2">

								<%--<table align="center" width="800" cellpadding="3"
									cellspacing="1" border="1">
									<tr>
										<td align="center" class="STYLE1" nowrap="nowrap"
											style="BORDER: #c1dad7 1px solid">客户名称</td>
										<td align="center" class="STYLE1" nowrap="nowrap"
											style="BORDER: #c1dad7 1px solid">收(付)款类别</td>
										<td align="center" class="STYLE1" nowrap="nowrap"
											style="BORDER: #c1dad7 1px solid">收(付)款金额</td>
										<td align="center" class="STYLE1" nowrap="nowrap"
											style="BORDER: #c1dad7 1px solid">是否有效</td>
										<td align="center" class="STYLE1" nowrap="nowrap"
											style="BORDER: #c1dad7 1px solid">收(付)款时间</td>
										<td align="center" class="STYLE1" nowrap="nowrap"
											style="BORDER: #c1dad7 1px solid">操作用户</td>
										<td align="center" class="STYLE1" nowrap="nowrap"
											style="BORDER: #c1dad7 1px solid">其他说明</td>
										<td align="center" class="STYLE1" nowrap="nowrap"
											style="BORDER: #c1dad7 1px solid">操作</td>
									</tr>
									<c:forEach items="${bals}" var="bal">
										<tr>
											<td class="STYLE1" nowrap="nowrap"
												style="BORDER: #c1dad7 1px solid">${bal.customername }</td>
											<td class="STYLE1" nowrap="nowrap"
												style="BORDER: #c1dad7 1px solid">${bal.paidType }</td>
											<td class="STYLE1" nowrap="nowrap"
												style="BORDER: #c1dad7 1px solid">${bal.faceFee }</td>
											<td class="STYLE1" nowrap="nowrap"
												style="BORDER: #c1dad7 1px solid"><font color="red">${bal.isvalid }</font></td>
											<td class="STYLE1" nowrap="nowrap"
												style="BORDER: #c1dad7 1px solid">${bal.paidtime }</td>
											<td class="STYLE1" nowrap="nowrap"
												style="BORDER: #c1dad7 1px solid">${bal.userid }</td>
											<td class="STYLE1" nowrap="nowrap"
												style="BORDER: #c1dad7 1px solid">${bal.demo }</td>
											<td class="STYLE1" nowrap="nowrap"
												style="BORDER: #c1dad7 1px solid" align="center"><a
												href="./BalanceServlet?action=invalid&currPage=1&opr=first&customerid=${bal.customerid }&balanceid=${bal.balanceid}"
												onclick="return confirm('作废确定');">作废</a>&nbsp;&nbsp;&nbsp;&nbsp;
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
                                                ,url: '${pageContext.request.contextPath}/balance/balanceCusPage.action?customerId=${customerId}' //数据接口
                                                ,page: true //开启分页
                                                ,limit:5
                                                ,limits:[5,10,15,20]
                                                ,cols: [[ //表头
                                                    {field: 'customer.customername', title: '客户名称', width:200,align:'center',templet: function(res){
                                                                return res.customer.customername;
                                                        } }
                                                    ,{field: 'paidtype', title: '收(付)款类别', width:130,align:'center'}
                                                    ,{field: 'facefee', title: '收(付)款金额', width:130,align:'center'}
                                                    ,{field: 'isvalid', title: '是否有效', width:110,align:'center',style:"color:#f00"}
                                                    ,{field: 'paidtime', title: '收(付)款时间', width:170,align:'center',templet: function(res){
                                                        var date = new Date(res.paidtime).Format("yyyy-MM-dd");
                                                            return date;
                                                        }}
                                                    ,{field: 'users.username', title: '操作用户', width: 110,align:'center',templet: function(res){
                                                            return res.users.username;
                                                        } }
                                                    ,{field: 'demo', title: '其他说明', width: 250,align:'center'}
                                                    ,{field: 'nowrap', title: '操作',align:'center',toolbar:"#barDemo"}
                                                ]]

                                            });

                                            table.on('tool(test)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
                                                var data = obj.data; //获得当前行数据
                                                var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
                                                var tr = obj.tr; //获得当前行 tr 的DOM对象

                                               if(layEvent === 'balanceUpdate'){ //修改状态

												   var isvalid="";
												   if(data.isvalid=="作废"){
												      isvalid="有效"
												   }else if(data.isvalid=="有效") {
                                                       isvalid = "作废"; //获取状态

                                                   }
														layer.confirm("是否修改状态",function () {
                                                            //同步更新缓存对应的值
                                                            obj.update({
                                                                isvalid: isvalid
                                                            });
                                                            $.ajax({
                                                                url:'${pageContext.request.contextPath}/balance/balanceUpdateIsvalid.action?balanceId='+data.balanceid
                                                                ,data:"isvalid="+isvalid
                                                                ,success:function (res) {
                                                                    if(res>0)
                                                                        layer.msg("修改成功")
                                                                    else
                                                                        layer.msg("修改失败")
                                                                }
                                                            })
                                                        })

												   }

                                            });

                                        })

									</script>

									<!--添加模板-->
									<script type="text/html" id="barDemo">

										<c:forEach items="${listAcc}" var="accmoudle">
											<c:if test="${accmoudle.module.moduleid==31}">
												<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="balanceUpdate">修改状态</a>
											</c:if>


										</c:forEach>

									</script>
							</td>
						</tr>
						<%--<tr>
							<td colspan="2"><a
								href="./BalanceServlet?action=list&currPage=1&opr=first&customerid=${customerid }">首页</a>&nbsp;&nbsp;&nbsp;&nbsp;
								<a
								href="./BalanceServlet?action=list&currPage=${pages.currPage }&opr=prev&customerid=${customerid }">上一页</a>&nbsp;&nbsp;&nbsp;&nbsp;
								<a
								href="./BalanceServlet?action=list&currPage=${pages.currPage }&opr=next&customerid=${customerid }">下一页</a>&nbsp;&nbsp;&nbsp;&nbsp;
								<a
								href="./BalanceServlet?action=list&currPage=${pages.pageCount }&opr=last&customerid=${customerid }">末页</a>&nbsp;&nbsp;&nbsp;&nbsp;
								第${pages.currPage }页&nbsp;&nbsp;&nbsp;&nbsp; 共${pages.pageCount }页&nbsp;&nbsp;&nbsp;&nbsp;
								共${pages.rowCount }笔记录&nbsp;&nbsp;&nbsp;&nbsp;</td>
						</tr>--%>
					</table>
				</div>
			</div>
		</div>
	</div>
	<SCRIPT src="${pageContext.request.contextPath}/js/transform.js" type=text/javascript></SCRIPT>
</body>
</html>
