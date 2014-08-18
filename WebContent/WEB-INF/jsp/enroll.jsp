<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
<title><fmt:message key="enroll" /></title>
</head>
<body background="images/wood.jpg">
<div style="width: 80%;padding-left: 20%;">
  	<h3><fmt:message key="enroll.title" /></h3>
  	<hr>
	<table class="display" id="example">
	<thead>
		<tr>
			<th><fmt:message key="enroll.coursename" /></th>
			<th><fmt:message key="enroll.ectspoints" /></th>
			<th><fmt:message key="enroll.coursetype" /></th>
		</tr>
	</thead>
	<tbody>
	<c:forEach items="${ requestScope['listaKolegijaUpisani'] }" var="data">
		<tr>
			<td><c:out value="${ data.nazivKolegija }"/></td>
			<td><c:out value="${ data.ects }"/></td>
			<c:choose>
				<c:when test="${data.vrstaKolegija == 'OBVEZNI'}">
					<td><fmt:message key="enroll.coursetype.core" /></td>
				</c:when>
				<c:otherwise>
					<td><fmt:message key="enroll.coursetype.elective" /></td>
				</c:otherwise>
			</c:choose>
		</tr>
	</c:forEach>
	</tbody>
	</table>
</div>
<br>
<div style="margin: 0 auto;text-align: center;">
		<form method="POST" action="j_spring_security_logout" >
			<button type="submit" class="btn btn-primary">
				<span class="glyphicon glyphicon-log-out"></span>
			</button>
		</form>
</div>
<div style="margin: 0 auto;text-align: center;">
      	<jsp:include page="/WEB-INF/partial/langSelect.jsp" />
</div>

</body>
</html>