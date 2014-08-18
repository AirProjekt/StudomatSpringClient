<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<style type="text/css">
		#example td
		{
			text-align: center;
		}
		#example th
		{
			text-align: center;
		}
	</style>
    <style type="text/css" title="currentStyle">
    	@import "<%=response.encodeURL(request.getContextPath() +"/css/demo_table_jui.css") %>";
    	@import "<%=response.encodeURL(request.getContextPath() +"/css/jquery-ui-1.10.4.custom.css") %>";
    	@import "<%=response.encodeURL(request.getContextPath() +"/css/bootstrap.min.css") %>";
	</style>
    <script type="text/javascript" charset="UTF-8" src="<%=response.encodeURL(request.getContextPath() +"/js/jquery.js") %>" ></script>
    <script type="text/javascript" charset="UTF-8" src="<%=response.encodeURL(request.getContextPath() +"/js/jquery.dataTables.js") %>" ></script>
    <script type="text/javascript" charset="UTF-8">
	    $(document).ready(function() {
	    	var lang = "<c:out value="${param.locale}"/>";
	    	if(lang == 'en'){
	    		$('#example').dataTable( {
		        	"bJQueryUI": true,
		            "sPaginationType": "full_numbers",
		        } );
	    	}
	    	else {
	    		$('#example').dataTable( {
		        	"bJQueryUI": true,
		            "sPaginationType": "full_numbers",
		            "oLanguage": {
		                "sUrl": "<%=response.encodeURL(request.getContextPath() +"/translation/croatian.jsp") %>"
		            }
		        } );
			}
	    } );
	</script>
<title><fmt:message key="enrollment" /></title>
</head>
<body background="images/wood.jpg">
<div  style="width: 80%;padding-left: 20%">
	<h3><fmt:message key="enrollment.title" /></h3>
	<hr>
	<table class="display" id="example">
	<thead>
		<tr>
			<th><fmt:message key="enrollment.coursename" /></th>
			<th><fmt:message key="enrollment.ectspoints" /></th>
			<th><fmt:message key="enrollment.coursetype" /></th>
			<th><fmt:message key="enrollment.chosen" /></th>
			<th></th>
			<th></th>
		</tr>
	</thead>
	<tbody>
	<c:forEach items="${ sessionScope['listaKolegija'] }" var="data">
	<tr>
	<td><c:out value="${ data.nazivKolegija }"/></td>
	<td><c:out value="${ data.ects }"/></td>
	<c:choose>
		<c:when test="${data.vrstaKolegija == 'OBVEZNI'}">
			<td><fmt:message key="enrollment.coursetype.core" /></td>
		</c:when>
		<c:otherwise>
			<td><fmt:message key="enrollment.coursetype.elective" /></td>
		</c:otherwise>
	</c:choose>
	<c:choose>
		<c:when test="${data.odabran == true}">
			<td><fmt:message key="enrollment.chosen.chosenyes" /></td>
		</c:when>
		<c:otherwise>
			<td><fmt:message key="enrollment.chosen.chosenno" /></td>
		</c:otherwise>
	</c:choose>
	<td>
	<sec:authorize access="hasRole('ROLE_STUDENT')">
		<form method="POST" action="kolegij.html" >
			<input type="hidden" name="idOdabrKolegija" value="<c:out value="${data.id}"/>" />
			<input type="submit" value="<fmt:message key="enrollment.choosebutton" />" class="btn btn-success">
		</form>
	</sec:authorize>
	</td>
	<td>
	<sec:authorize access="hasRole('ROLE_ADMIN')">
		<form method="POST" action="delete.html" >
			<input type="hidden" name="idOdabrKolegija" value="<c:out value="${data.id}"/>" />
			<input type="submit" value="<fmt:message key="enrollment.deletebutton" />" class="btn btn-danger">
		</form>
	</sec:authorize>
	</td>
	</tr>
	</c:forEach>
	</tbody>
	</table>	
  </div>
  <br>
<sec:authorize access="hasRole('ROLE_STUDENT')">
  <div style="margin: 0 auto;text-align: center">
<%-- 		<a href="upis.html?locale=${param.locale}" class="btn btn-info"><fmt:message key="enrollment.signbutton" /></a> --%>
		<form method="POST" action="upis.html?locale=${param.locale}" >
			<input type="submit" value="<fmt:message key="enrollment.signbutton" />" class="btn btn-info">
		</form>
		<br>
	</div>
</sec:authorize>
<sec:authorize access="hasRole('ROLE_ADMIN')">
  <div style="margin: 0 auto;text-align: center">
		<a href="noviKolegij.html?locale=${param.locale}" class="btn btn-default"><fmt:message key="enrollment.addcourse" /></a>
		<br>
		<br>
		<form method="POST" action="j_spring_security_logout" >
			<button type="submit" class="btn btn-primary">
				<span class="glyphicon glyphicon-log-out"></span>
			</button>
		</form>
		<br>
	</div>
</sec:authorize>
  <div style="margin: 0 auto;text-align: center;">
      	<jsp:include page="/WEB-INF/partial/langSelect.jsp" />
  </div>
</body>
</html>