<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/taglibs/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
  <!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"><![endif]-->
  <title>修改教师信息</title>
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta name="viewport" content="width=device-width">
</head>
<body>
  <c:import url="../top.jsp" />
  <input type="hidden" id="ctx" value="${ctx }"/>
  <div class="container"> 
    <div class="template-page-wrapper">
 	<c:import url="../menu.jsp" />
     <div class="templatemo-content-wrapper">
        <div class="templatemo-content">
          <ol class="breadcrumb">
            <li><span class="glyphicon glyphicon-home"></span>&nbsp;<a href="${ctx }/loginAction/main">首页</a></li>
            <li><a href="#">修改教师信息</a></li>
          </ol>
          <blockquote>
				<span class="glyphicon glyphicon-th-list"></span>&nbsp;修改教师信息&nbsp;<span class="caret"></span>
		  </blockquote>
          <div class="row-fluid">
          
          <form:form action="${ctx }/teacherAction/doUpdate" modelAttribute="teacher" method="POST">
          <input type="hidden" name="teacherId" value="${teacher.teacherId }"/>
          <input type="hidden" name="dept_id" value="${dept_id }"/>
          <input type="hidden" name="regDate" value="<fmt:formatDate value='${teacher.regDate }' type='both'/>"/>
          <input type="hidden" name="lgoinDate" value="<fmt:formatDate value='${teacher.lgoinDate }' type='both'/>"/>
          <input type="hidden" name="IPAddress" value="${IPAddress }"/>
          <input type="hidden" name="createDate" value="<fmt:formatDate value='${teacher.createDate }' type='both'/>"/>
          <div class="table-responsive">
          	<table class="table table-bordered table-condensed">
		  	<tr class="active">
		  		<td colspan="2" align="center">修改教师信息</td>
		  	</tr>
		  	<tr>
		  		<td>教师姓名</td>
		  		<td>
		  			<form:errors path="teacherName" cssClass="valid_text"></form:errors>
			    	<input type="text" name="teacherName" value="${teacher.teacherName }" class="form-control" placeholder="Enter teacherName">
		  		</td>
		  	</tr>
		  	<tr>
		  		<td>登录密码</td>
		  		<td>
		  			<form:errors path="password" cssClass="valid_text"></form:errors>
			    	<input type="text" name="password" value="${teacher.password }" class="form-control" placeholder="Enter password">
		  		</td>
		  	</tr>
		  	<tr>
		  		<td>所属机构</td>
		  		<td>
		  			<form:errors path="department.id" cssClass="valid_text"></form:errors>
		  			<select name="department.id" required>  
		  				<c:forEach items="${deptList }" var="department">
			  				<option ${teacher.department.id == department.id?"selected":"" } value="${department.id }">${department.name }</option>
		  				</c:forEach>
		  			</select>
		  		</td>
		  	</tr>
		  	<tr>
		  		<td>所属角色</td>
		  		<td>
		  			<form:errors path="role" cssClass="valid_text"></form:errors>
		  			<select name="role" required>  
	  					<option ${teacher.role == "teacher"?"selected":"" } value="teacher">教师</option>
	  					<option ${teacher.role == "manager"?"selected":"" } value="manager">系部管理员</option>
	  					<option ${teacher.role == "admin"?"selected":"" } value="admin">系统管理员</option>
	  				</select>
		  		</td>
		  	</tr>
		  	</table>
          </div>
		  	<button type="submit" class="btn btn-success btn-sm">修改</button>
	      </form:form>
          	
          </div><!-- row-fluid -->
          
	  	</div>
	 </div>
	</div>
  </div>
  <c:import url="../footer.jsp" />
</body>
</html>