<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <style type="text/css" title="currentStyle">
    	@import "<%=response.encodeURL(request.getContextPath() +"/css/bootstrap.min.css") %>";
	</style>
<title><fmt:message key="admin" /></title>
</head>
<div style="margin: 0 auto;text-align: center;">
<h3><fmt:message key="admin.title" /></h3>
<br>
<form:form action="noviKolegij.html" modelAttribute="kolegij" class="form-horizontal">
	<div class="form-group">
		<label for="nazivKolegija" class="col-sm-4 control-label"><fmt:message key="admin.name" />:</label>
		<div class="col-sm-4">
			<form:input path="nazivKolegija" SIZE="30" maxlength="50" class="form-control"/><br/>
			<form:errors path="nazivKolegija" style="color:red" />
		</div>
	</div>
	<div class="form-group">
		<label for="ects" class="col-sm-4 control-label"><fmt:message key="admin.ects" />:</label>
		<div class="col-sm-2">
			<form:input path="ects" SIZE="10" maxlength="10" class="form-control"/><br/>
			<form:errors path="ects" style="color:red" />
		</div>
	</div>
	<div class="form-group">
		<label for="vrstaKolegija" class="col-sm-4 control-label"><fmt:message key="admin.type" />:</label>
		<div class="col-sm-2">
			<form:select path="vrstaKolegija" class="form-control">
				<form:option value="OBVEZNI"><fmt:message key="enroll.coursetype.core" /></form:option>
				<form:option value="IZBORNI"><fmt:message key="enroll.coursetype.elective" /></form:option>
			</form:select>
		</div>
	</div>
	<br/>
	<div class="form-group">
	    <div class="col-sm-offset-1 col-sm-10">
	      <INPUT TYPE="SUBMIT" VALUE="<fmt:message key="admin.add" />" class="btn btn-success">
	    </div>
  	</div>
</form:form>
<c:if test="${ requestScope['uneseno'] != null }">
	<div class="alert alert-success">
		<c:out value="${ uneseno }"/>
	</div>
</c:if>
<a href="kolegij.html?locale=${param.locale}"><span class="glyphicon glyphicon-circle-arrow-left"></span></a>
<div style="margin: 0 auto;text-align: center;">
      	<jsp:include page="/WEB-INF/partial/langSelect.jsp" />
</div>
</div>