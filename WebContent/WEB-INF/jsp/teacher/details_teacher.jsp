<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/taglibs/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
  <!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"><![endif]-->
  <title>个人档案</title>
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta name="viewport" content="width=device-width">
  <script type="text/javascript" src="${ctx}/js/jquery.ui.widget.js"></script>
  <script type="text/javascript" src="${ctx}/js/jquery.iframe-transport.js"></script>
  <script type="text/javascript" src="${ctx}/js/jquery.fileupload.js"></script>
</head>
<body>
  <c:import url="../top.jsp" />
  <div class="container"> 
    <div class="template-page-wrapper">
 	<c:import url="../menu.jsp" />
     <div class="templatemo-content-wrapper">
        <div class="templatemo-content">
			<ol class="breadcrumb">
			  <li><a href="index.html">主页</a></li>
			  <li class="active">个人档案</li>
			</ol>
			<blockquote>
				<h4><span class="glyphicon glyphicon-user"></span>&nbsp;${user.teacherName } 的信息&nbsp;<span class="caret"></span></h4>
			</blockquote>
          	<table class="table table-bordered table-hover">
          		<tr>
          			<th>用户名</th>
          			<td>${teacher.teacherName }</td>
          		</tr>
          		<tr>
          			<th>教师编号</th>
          			<td>${teacher.teacherId }</td>
          		</tr>
          		<tr>
          			<th>角色</th>
          			<td>
            			<c:choose>
            				<c:when test="${teacher.role == 'teacher' }">
            					教师
            				</c:when>
            				<c:when test="${teacher.role == 'manager' }">
            					系部管理员
            				</c:when>
            				<c:when test="${teacher.role == 'admin' }">
            					系统管理员
            				</c:when>
            			</c:choose>
            		</td>
          		</tr>
          		<tr>
          			<th>注册时间</th>
          			<td>${teacher.regDate }</td>
          		</tr>
          		<tr>
          			<th>最后登录时间</th>
          			<td>${teacher.lgoinDate }</td>
          		</tr>
          		<tr>
          			<th>最后登录IP</th>
          			<td>${teacher.IPAddress }</td>
          		</tr>
          		<tr>
          			<th>所属机构</th>
          			<td>${teacher.department.name }</td>
          		</tr>
          	</table>
          	
	  	</div>
	 </div>
	</div>
  </div>
  <c:import url="../footer.jsp" />
</body>
</html>