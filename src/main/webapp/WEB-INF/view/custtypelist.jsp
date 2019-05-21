<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1"><title>
	客户类型资料列表
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
    <div id="maintip"><strong>位置：</strong>客户类型资料列表</div></div>
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
                <p class="left_txt2">客户类型资料列表</p>
            </td>
            <td width="20%" align="right">
            <div align="center">
                <c:forEach items="${listAcc}" var="accmoudle">
                    <c:if test="${accmoudle.module.moduleid==38}">
                        <img src="${pageContext.request.contextPath}/images/ico_Form.gif" width="14" height="14" />&nbsp;<a href='${pageContext.request.contextPath}/load/custTypeAdd.action' >新增</a>&nbsp;&nbsp;&nbsp;&nbsp;
                    </c:if>

                </c:forEach>
            <img src="${pageContext.request.contextPath}/images/ico_Form.gif" width="14" height="14" />&nbsp;<a href='javascript:self.location.reload();' >刷新</a>&nbsp;&nbsp;&nbsp;&nbsp;
            <img src="${pageContext.request.contextPath}/images/002.gif" width="14" height="14" /><A href="javascript:self.history.back();">返回</A></div>
           </td>
            </tr>
            </table>
            </td>
        </tr>
       <%-- <tr>
        	<td colspan="2">
        	<a href="./CustTypeServlet?action=list&currPage=1&opr=first">首页</a>&nbsp;&nbsp;&nbsp;&nbsp;
        	<a href="./CustTypeServlet?action=list&currPage=${pages.currPage }&opr=prev">上一页</a>&nbsp;&nbsp;&nbsp;&nbsp;
        	<a href="./CustTypeServlet?action=list&currPage=${pages.currPage }&opr=next">下一页</a>&nbsp;&nbsp;&nbsp;&nbsp;
        	<a href="./CustTypeServlet?action=list&currPage=${pages.pageCount }&opr=last">末页</a>&nbsp;&nbsp;&nbsp;&nbsp;
        	第${pages.currPage }页&nbsp;&nbsp;&nbsp;&nbsp;
         	共${pages.pageCount }页&nbsp;&nbsp;&nbsp;&nbsp;
         	共${pages.rowCount }个类别&nbsp;&nbsp;&nbsp;&nbsp;
        	</td>
        </tr>--%>
        <tr>
            <td  colspan="2">
           
             <%--<table width="70%" border="0" align="left" cellpadding="2" cellspacing="1" >
			  <tr>
			    <td width="130" height="30" class="STYLE1" nowrap="nowrap" style="BORDER: #c1dad7 1px solid"><div align="center">客户类型编号</div></td>
			    <td class="STYLE1"  style="BORDER: #c1dad7 1px solid"><div align="center">客户类型名称</div></td>
			    <td class="STYLE1"  style="BORDER: #c1dad7 1px solid"><div align="center">操作</div></td>
			  </tr>
			  <c:forEach items="${custtype}" var="area">
			   <tr>
			    <td width="130" height="30" class="STYLE1" nowrap="nowrap" style="BORDER: #c1dad7 1px solid"><div align="center">${area.customertypeid }</div></td>
			    <td class="STYLE1"  style="BORDER: #c1dad7 1px solid"><div align="center">${area.customertypeName}</div></td>
			    <td class="STYLE1"  style="BORDER: #c1dad7 1px solid"><div align="center">
			    	<a href="./CustTypeServlet?action=update&customertypeid=${area.customertypeid }">修改</a>&nbsp;&nbsp;
			    	<a href="./CustTypeServlet?action=del&customertypeid=${area.customertypeid }&currPage=1&opr=first" onclick="return confirm('删除确认')">删除</a>&nbsp;&nbsp;
			    	
			    </div></td>
			  </tr>
			  </c:forEach>
			</table>--%>


				 <table id="demo" lay-filter="test" ></table>
				 <script>

                     layui.use('table', function(){
                         var table = layui.table;
                         table.render({
                             elem: '#demo'
                             ,url: '${pageContext.request.contextPath}/customertype/customertypePage.action' //数据接口
                             ,page: true //开启分页
                             ,limit:5
                             ,limits:[5,10,15,20]
                             ,cols: [[ //表头
                                 {field: 'customertypeid', title: '客户类型编号', width:'20%',align:'center' }
                                 ,{field: 'customertypename', title: '客户类型名称', width:'40%',align:'center'}
                                 ,{field: '', title: '操作', width:'40%',align:'center',toolbar:"#barDemo"}
                             ]]

                         });

                         table.on('tool(test)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
                             var data = obj.data; //获得当前行数据
                             var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
                             var tr = obj.tr; //获得当前行 tr 的DOM对象

                             if(layEvent === 'userUpdate'){ //修改
                                 location.href="${pageContext.request.contextPath}/load/custTypeUpdate.action?cusId="+data.customertypeid;
                                 //do somehing
                             } else if(layEvent === 'delete'){ //删除

                                 layer.confirm('真的删除行么', function(index){

                                     layer.close(index);
                                     //向服务端发送删除指令
                                     $.ajax({
                                         url:'${pageContext.request.contextPath}/customertype/customertypeDelete.action'
                                         ,data:"id="+data.customertypeid
                                         ,success:function (res) {
                                             if(res>0){
                                                 obj.del(); //删除对应行（tr）的DOM结构，并更新缓存

                                                 layer.msg("删除成功")
                                             } else
                                                 layer.msg("删除失败,该客户类型已被使用")
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
                         <c:if test="${accmoudle.module.moduleid==40}">
                             <a class="layui-btn layui-btn-xs" lay-event="userUpdate">修改</a>
                         </c:if>
                         <c:if test="${accmoudle.module.moduleid==39}">
                             <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="delete">删除</a>
                         </c:if>

                     </c:forEach>


				 </script>
            </td>
        </tr>
        <%--<tr>
        	<td colspan="2">
        	<a href="./CustTypeServlet?action=list&currPage=1&opr=first">首页</a>&nbsp;&nbsp;&nbsp;&nbsp;
        	<a href="./CustTypeServlet?action=list&currPage=${pages.currPage }&opr=prev">上一页</a>&nbsp;&nbsp;&nbsp;&nbsp;
        	<a href="./CustTypeServlet?action=list&currPage=${pages.currPage }&opr=next">下一页</a>&nbsp;&nbsp;&nbsp;&nbsp;
        	<a href="./CustTypeServlet?action=list&currPage=${pages.pageCount }&opr=last">末页</a>&nbsp;&nbsp;&nbsp;&nbsp;
        	第${pages.currPage }页&nbsp;&nbsp;&nbsp;&nbsp;
         	共${pages.pageCount }页&nbsp;&nbsp;&nbsp;&nbsp;
         	共${pages.rowCount }个类别&nbsp;&nbsp;&nbsp;&nbsp;
        	</td>
        </tr>--%>
    </table>
  </div></div></div></div>
    <SCRIPT src="${pageContext.request.contextPath}/js/transform.js" type=text/javascript></SCRIPT>
</body>
</html>
