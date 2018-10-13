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
		<script>
			function setit()
			{
				document.forms[0].submit();
			}
			
			function logout(){
				
				if(confirm("确认退出吗?")){
					location.href="${pageContext.request.contextPath}/user/logout.do";
				}
			}
			function agreeaudit(id){
				
				if(confirm("确认审核通过吗?")){
					location.href="${pageContext.request.contextPath }/leave/doaudit.action?id="+id;
				}
			}
			function refuseaudit(id){
				
				if(confirm("确认拒绝申请嘛?")){
					location.href="${pageContext.request.contextPath}/leave/dorefuse.action?id="+id;
				}
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
		<form id="myForm" name="myForm"  method="post">
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
							休假审核
						</div>
						<div class="pages">
							<table width="90%" border="0" cellspacing="0" cellpadding="0">
								<tr >
									<td align="right" width="30%">姓名：</td><td  align="left"><input type="text" name="apply" value="${showleave.apply }" readonly="readonly" id="apply"/></td>
								</tr>
								<tr >
									<td align="right" width="30%">开始时间：</td><td  align="left"><input type="text" name="startTime" value="${showleave.start }" readonly="readonly" id="startTime"/></td>
								</tr>
								<tr >
									<td align="right" width="30%">结束时间：</td><td  align="left"><input type="text" name="endTime" value="${showleave.end }" readonly="readonly" id="endTime"/></td>
								</tr>
								<tr >
									<td align="right" width="30%">请假天数：</td><td  align="left"><input type="text" name="days" value="${showleave.days }" readonly="readonly" id="days"/></td>
								</tr>
								<tr >
									<td align="right" width="30%">请假原因：</td><td  align="left"><textarea name="content" cols="80" rows="5" readonly="readonly">${showleave.reason }</textarea>
									</td>
								</tr>
								<tr >
									<td align="right" width="30%">申请人：</td><td  align="left"><input type="text" name="reapply" value="${showleave.apply }" readonly="readonly" /></td>
								</tr>
								<tr >
									<td align="center" colspan="2"><br/><input type="button"  id="agree" value="审核通过" onclick="agreeaudit('${showleave.id }')" />
																		<input type="button"  id="refuse" value="审核不通过" onclick="refuseaudit('${showleave.id }')" />
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
</html>