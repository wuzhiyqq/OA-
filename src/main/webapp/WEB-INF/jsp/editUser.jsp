<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>办公自动化管理系统</title>
		<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.11.1.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.validate.min.js"></script>
		
		<script type="text/javascript">
			$(function(){
				$("#myForm").validate({
					
					rules:{
						"nickname":{required:true},
						"age":{required:true,min:0},
						"phone":{required:true,digits:true ,minlength:11,maxlength:11}
					},
					messages:{
						"nickname":{required:"昵称不能为空!"},
						"age":{required:"年龄不能为空!",min:"年龄不能小于0!"},
						"phone":{required:"手机号不能为空!",digits:"手机号必须为整数!" ,minlength:"手机号不能少于11位数字!",maxlength:"手机号不能超过11位数字!"}
					}
				});
			});
			function logout(){
				
				if(confirm("确认退出吗")){
					location.href="${pageContext.request.contextPath}/user/logout.do";
				}
			}
			function backToIndex(){
				
				if(confirm("确认返回嘛?")){
					location.href="${pageContext.request.contextPath}/user/index.do";
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
		<form id="myForm" name="myForm" action="${pageContext.request.contextPath}/user/doeditData.action" method="post">
		<input type="hidden" name="id" value="${sessionUser.id }"/>
		<input type="hidden" name="password" value="${sessionUser.password }" id="password"/>
		<input type="hidden" name="isadmin" value="${sessionUser.isadmin }" id="isadmin"/>
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
							个人信息
						</div>
						<div class="pages">
							<table width="90%" border="0" cellspacing="0" cellpadding="0">
								<tr >
									<td align="right" width="30%">用户名：</td><td  align="left"><input type="text" name="username" value="${sessionUser.username }" readonly="readonly" id="username"/></td>
								</tr>
								<tr >
									<td align="right" width="30%">昵称：</td><td  align="left"><input type="text" name="nickname" value="${sessionUser.nickname }" id="nickname"/></td>
								</tr>
								<tr >
									<td align="right" width="30%">年龄：</td><td  align="left"><input type="text" name="age" value="${sessionUser.age }"  id="age"/></td>
								</tr>
								<tr >
									<td align="right" width="30%">性别：</td><td  align="left">
										
											<input type="radio" name="sex" value="0" id="" />男
											<input type="radio" name="sex" value="1" id=""/>女
								
									</td>
								</tr>
								<tr >
									<td align="right" width="30%">手机：</td><td  align="left"><input type="text" name="phone" value="${sessionUser.phone }" id="phone"/></td>
								</tr>
								<tr >
									<td align="right" width="30%">地址：</td><td  align="left"><input type="text" name="address" value="${sessionUser.address }" id="address"/></td>
								</tr>
								<tr >
									<td align="center" colspan="2"><br/><input type="submit"  id="save" value="保存数据" />
																		<input type="button"  id="back" value="返回" onclick="backToIndex()" /></td>
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
	var ns=document.getElementsByName("sex");
	var ih="${sessionUser.sex }";
	for (var i = 0; i < ns.length; i++) {
		if(ih==ns[i].value){
			ns[i].checked = true;
		}
	}
	
</script>
</html>