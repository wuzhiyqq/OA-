<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>办公自动化管理系统</title>
		<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.11.1.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.validate.min.js"></script>
		<script type="text/javascript" >
			$(function(){
				$("#myForm").validate({
					
					rules:{
						"dstartTime":{required:true,dateISO:true,remote:"${pageContext.request.contextPath}/leave/startTime.action"},
						"dendTime":{required:true,dateISO:true,remote:"${pageContext.request.contextPath}/leave/endTime.action"},
						"days":{required:true,min:0},
						"reason":{required:true}
					},
					messages:{
						"dstartTime":{required:"开始时间不能为空!",dateISO:"开始时间格式不正确!",remote:"请假开始时间不能小于现在时间"},
						"dendTime":{required:"结束时间不能为空",dateISO:"结束时间格式不正确!",remote:"请假结束时间不能小于现在时间"},
						"days":{required:"天数不能为空!",min:"开始日期不能大于结束日期!"},
						"reason":{required:"请填写休假原因!"}
					}
				}); 
			});	
			function logout(){
				
				if(confirm("确认退出吗")){
					location.href="${pageContext.request.contextPath}/user/logout.do";
				}
			}
			
			function comeback(){
				
				if(confirm("确认返回吗")){
					location.href="${pageContext.request.contextPath}/leave/leave.action";	
				}
			}
			function adcomeback(){
				
				if(confirm("确认返回吗")){
					location.href="${pageContext.request.contextPath}/leave/adminleave.action";	
				}
			}
			
	        function sc(){
	           var date2 = document.getElementById("startTime").value;
	           var date1 = document.getElementById("endTime").value;
	           var result = (new Date(date1).getTime() - new Date(date2))/(24*3600*1000);
	           document.getElementById("days").value = result;
	            
	        }
	        function c(){
		           var date2 = document.getElementById("startTime").value;
		           var date1 = document.getElementById("endTime").value;
		           var result = (new Date(date1).getTime() - new Date(date2))/(24*3600*1000);
		           document.getElementById("days").value = result;
		            
		        }
		</script>
	</head>
	
	<body>
		<div class="top">
			<div class="global-width">
				<img src="${pageContext.request.contextPath}/Images/logo.gif" class="logo" />
			</div>
		</div>
		<div class="status">
			<div class="global-width">
				${sessionUser.username} 你好！欢迎访问办公管理系统！&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" onclick="logout()">注销</a>
			</div>
		</div>
		<form id="myForm" name="myForm" action="${pageContext.request.contextPath}/leave/doaskforleave.action" method="post" >
		<input type="hidden" name="applyID" value="${sessionUser.id }"/>
		<div class="main">
			<div class="global-width">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>办公自动化管理系统</title>
		<link href="css/style.css" rel="stylesheet" type="text/css" />
	</head>
  
  <body>
    <div class="nav" id="nav">
					<div class="t"></div>
					<dl>
							<dt onclick="this.parentNode.className=this.parentNode.className=='open'?'':'open';">信息管理 
						</dt>
						<dd>
							<a href="${pageContext.request.contextPath }/user/index.do" target="_self">个人信息</a>
						</dd>
					</dl>
					<dl>
						<dt
							onclick="this.parentNode.className=this.parentNode.className=='open'?'':'open';">
							邮件管理
						</dt>
						<dd>
							<a href="${pageContext.request.contextPath }/mail/mailWrite.action" target="_self">写邮件</a>
						</dd>
						<dd>
							<a href="${pageContext.request.contextPath }/mail/receive.action" target="_self">收邮件</a>
						</dd>
						<dd>
							<a href="${pageContext.request.contextPath }/mail/garage.action" target="_self">垃圾邮件</a>
						</dd>
					</dl>
					<dl>
						<dt
							onclick="this.parentNode.className=this.parentNode.className=='open'?'':'open';">
							考勤管理
						</dt>
						<dd>
							<c:if test="${sessionUser.isadmin==1 }">
								<a href="${pageContext.request.contextPath }/leave/leave.action" target="_self">休假</a>
							</c:if>
							<c:if test="${sessionUser.isadmin==0 }">
								<a href="${pageContext.request.contextPath }/leave/adminleave.action" target="_self">休假</a>
							</c:if>
						</dd> 
					</dl>
					
					<dl >
					
						<dt
							onclick="this.parentNode.className=this.parentNode.className=='open'?'':'open';">
							权限管理
						</dt>
						<dd>
							<a href="${pageContext.request.contextPath }/user/singleAccountData.action" target="_self">个人账户</a>
						</dd>
						<c:if test="${sessionUser.isadmin==0 }">
							<dd>
								<a href="${pageContext.request.contextPath }/user/findAccountData.action" target="_self">查看所有账户</a>
							</dd>
							
						</c:if>
						
					</dl>
				</div>
  </body>
</html>
					<div class="action">
						<div class="t">
							申请休假
						</div>
						<div class="pages">
							<table width="90%" border="0" cellspacing="0" cellpadding="0">
								<tr >
									<td align="right" width="30%">姓名：</td><td  align="left"><input type="text" value="${sessionUser.nickname }" id="nickname" readonly="readonly"/></td>
								</tr>
								<tr >
									<td align="right" width="30%">开始时间：</td><td  align="left"><input type="date" name="dstartTime" id="startTime" value="${sTime }" onchange="sc()" /></td>
								</tr>
								<tr >
									<td align="right" width="30%">结束时间：</td><td  align="left">
										<input type="date" name="dendTime" id="endTime" onchange="c()" />
								</tr>
								<tr >
									<td align="right" width="30%">请假天数：</td><td  align="left"><input type="text" name="days" id="days" /></td>
								</tr>
								<tr >
									<td align="right" width="30%">请假原因：</td><td  align="left">
										<textarea name="reason" cols="80" rows="5"></textarea>
									</td>
								</tr>
								<tr >
									<td align="right" width="30%">审批人：</td><td  align="left">
										<select name="approveID">
										<option>请选择</option>
										<c:forEach items="${approves }" var="approve">
											<option value="${approve.id }">${approve.nickname }</option>
										</c:forEach>
										</select>
									</td>
								</tr>
								<tr >
									<td align="center" colspan="2"><br/><input type="submit"  id="save1" value="提交申请"  />
										<c:if test="${sessionUser.isadmin==1 }">
											<input type="button"  id="save2" value="返回" onclick="comeback()" />
										</c:if>
										<c:if test="${sessionUser.isadmin==0 }">
											<input type="button"  id="save3" value="返回" onclick="adcomeback()" />
										</c:if>
									</td>
								</tr>
								
								</table>
								
						</div>
					</div>
			</div>
		</div>
		</form>
		<div class="copyright">
			Copyright &nbsp; &copy; &nbsp; 
		</div>
 
	</body>
	<script>
	var cs=document.getElementsByName("approveID")[0].getElementsByTagName("option");
	var cid="${approve.id }";
	for (var i = 0; i < cs.length; i++) {
		if(cid==cs[i].value){
			cs[i].selected=true;
		}
	}
	
</script>
</html>