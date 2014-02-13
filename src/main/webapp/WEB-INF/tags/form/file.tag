<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="util" tagdir="/WEB-INF/tags/util"%>
<%@attribute name="object" required="true"%>
<%@attribute name="fieldName" required="true"%>
<%@attribute name="acceptedFiles" required="true"%>
<%@attribute name="helpMessage" required="true"%>
<%@attribute name="required" required="false"%>

<c:set var="opaqueDivCssClass" value="form-group"/>
<c:set var="newScoreErrors"><form:errors path="${fieldName}"/></c:set>
<c:if test="${not empty newScoreErrors}">
    <c:set var="opaqueDivCssClass" value="form-group has-error"/>
</c:if>
<spring:message var="label" code="${object}.${fieldName}.label" htmlEscape="false"/>

<div class="${opaqueDivCssClass}">
    <form:label path="${fieldName}" cssClass="control-label">
        <c:out value="${label}"/>
        <util:requiredField required="${required}"/>
    </form:label>
    <form:input object="${object}" path="${fieldName}" type="file" name="some" accept="${acceptedFiles}"/>
    <p class="help-block">
        <spring:message code="${helpMessage}"/>
    </p>
    <form:errors path="${fieldName}" cssClass="alert alert-danger" element="div"/>
</div>

