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
			$(function(){
				$("#myForm").validate({
					rules:{
						"username":{required:true},
						"password":{required:true ,minlength:6}
					},
					messages:{
						"username":{required:"用户名不能为空!"},
						"password":{required:"密码不能为空!",minlength:"密码不能少于6位数字"}
					}
				});
			});
			function setit()
			{
				//1.去除readonly
				
				$("input[type='text']").each(function(){
					
					$(this).removeAttr("readonly")
			
				})
				$("input[type='password']").each(function(){
					
					$(this).removeAttr("readonly")
			
				})

				//2.去除按钮
				$("#save").remove();
				
				//3.添加按钮
				$("#btn").html("<br/><input type='submit' value='保存数据'><input type='button' value='返回' onclick='goBack()'> ");
			}
			function goBack(){
				
				location.href="${pageContext.request.contextPath }/user/singleAccountData.action";
			}
			function logout(){
				
				if(confirm("确认退出吗")){
					location.href="${pageContext.request.contextPath}/user/logout.do";
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
		<form id="myForm" name="myForm" action="${pageContext.request.contextPath}/user/editAccountData.action" method="post">
		<input type="hidden" name="id" value="${sessionUser.id }"/>
		<input type="hidden" name="isadmin" value="${sessionUser.isadmin }" id="u_isadmin"/>
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
							个人账户
						</div>
						<div class="pages">
							<table width="90%" border="0" cellspacing="0" cellpadding="0">
								<tr >
									<td align="right" width="30%">用户名：</td><td  align="left"><input type="text" name="username" value="${sessionUser.username }" readonly="readonly" id="username"/></td>
								</tr>
								<tr >
									<td align="right" width="30%">密码：</td><td  align="left"><input type="password" name="password" value="${sessionUser.password }" readonly="readonly" id="password"/></td>
								</tr>
								<tr >
									<td align="center" colspan="2" id="btn"><br/><input type="button"  id="save" value="编辑数据" onclick="setit()" /></td>
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