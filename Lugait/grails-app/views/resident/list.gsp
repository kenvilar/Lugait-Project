<%@ page import="lugait.Resident" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'resident.label', default: 'Resident')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
	<br><br>

		<div class="container-fluid">
		<div class="row-fluid">
		<div class="span2">
		</div>

		<div class="span8">

		<div align="right">	
		<ul class="nav nav-pills" style="border: solid 0px #d3d3d3;">

		<!--FOR SEARCH-->

		<li>
		<a class="btn btn-small btn-info" href="http://localhost:8080/Lugait/resident/create">
		<i class="icon-info-sign"></i> Add Resident</a>
		</li>

		<fieldset class="buttons">
					<g:form action="searchResident" controller="resident" class="">
					<g:textField name="residentNumber" value="${params.input}" size="20" placeholder="Search Resident ID No."/>
					<g:submitButton name="search" class="buttons" value="Search" />
					</g:form>
			</fieldset>

		<!-- SEARCH ENDS HERE--->

		</div>
		<div id="list-resident" class="content scaffold-list" role="main">
			<center><h1><g:message code="default.list.label" args="[entityName]" /></h1></center>

			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
				<table class="table table-bordered">
					<tr>

						<g:sortableColumn property="residentNumber" title="${message(code: 'resident.residentNumber.label', default: 'Resident Number')}" />

						<g:sortableColumn property="householdRole" title="${message(code: 'resident.householdRole.label', default: 'Household Role')}" />

						<g:sortableColumn property="residentLastName" title="${message(code: 'resident.residentLastName.label', default: 'Resident Name')}" />

						<g:sortableColumn property="birthDate" title="${message(code: 'resident.birthDate.label', default: 'Birth Date')}" />

						<g:sortableColumn property="address" title="${message(code: 'resident.address.label', default: 'Address')}" />

						<g:sortableColumn property="religion" title="${message(code: 'resident.religion.label', default: 'Religion')}" />

					</tr>
				</thead>

				<tbody>
				<g:each in="${residentInstanceList}" status="i" var="residentInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

						<td><g:link action="show" id="${residentInstance.id}">${fieldValue(bean: residentInstance, field: "residentNumber")}</g:link></td>

						<td>${fieldValue(bean: residentInstance, field: "householdRole")}</td>

						<td>${fieldValue(bean: residentInstance, field: "residentLastName")}</td>

						<td><g:formatDate format="MM-dd-yyyy" date="${residentInstance.birthDate}" /></td>

						<td>${fieldValue(bean: residentInstance, field: "address")}</td>

						<td>${fieldValue(bean: residentInstance, field: "religion")}</td>

					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${residentInstanceTotal}" />
			</div>
		</div>
	</body>
</html>