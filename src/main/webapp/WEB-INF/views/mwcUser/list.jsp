<%--
    Document   : list
    Created on : Jul 21, 2013, 12:48:32 PM
    Author     : almir
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--CSS-->
        <link href="<c:url value='/resources/css/styles.css' />" type="text/css" rel="stylesheet" >
        <!--SCRIPTS-->
        <script src="<c:url value='/resources/js/mwc/mwc.js' />" type="text/javascript" ></script>
        <script src="<c:url value='/resources/js/jquery-1.10.2.min.js' />" type="text/javascript" ></script> 
        <title>JSP Page</title>
        <%@ include file = "../complements/includes/noscript.jspf" %>
        <!--PAGE MESSAGES-->
        <spring:message code="message_confirm_change_locale" var="messageConfirmChangeLocale" />
        <!--LABELS-->
        <spring:message code="label_operations" var = "labelOperations" />
        <spring:message code="label_user_list_title" var = "labelUserListTitle" />
        <spring:message code="label_operations" var="labelOperations" />
        <spring:message code="label_operation_delete" var="labelOperationDelete" />
        <spring:message code="label_operation_show" var="labelOperationShow" />
        <spring:message code="label_operation_edit" var="labelOperationEdit" />
        <spring:message code="label_operation_series" var="labelOperationSeries" />
        <!--FIELDS-->
        <spring:message code="label_user_id" var = "labelUserId" />
        <spring:message code="label_user_first_name" var = "labelUserFirstName" />
        <spring:message code="label_user_last_name" var = "labelUserLastName" />
        <!--VARIABLES-->
        <c:set var="ctx" value="${pageContext.request.servletContext.contextPath}" />
    </head>
    <body>
        <div class="contentDiv">
            <div id="rootMenuDiv">
                <jsp:include page="../complements/includes/genericmenu.jsp" />
                <!--<script>menuBuilder("usersList", "", "", "");</script>-->
            </div>
            <div class='mainDiv'>
                <%@ include file = "../complements/includes/innerTopBar.jspf" %>
                <h1>${labelUserListTitle}</h1>
                <table class="basicTable">
                    <thead>
                        <tr>
                            <th>${labelUserId}</th>
                            <th>${labelUserFirstName}</th>
                            <th>${labelUserLastName}</th>
                            <th>${labelOperations}</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${users}" var="mwcUser">
                            <tr>
                                <td>${mwcUser.id}</td>
                                <td>${mwcUser.person.firstName}</td>
                                <td>${mwcUser.person.lastName}</td>
                                <td>
                                    <a href="${ctx}/mwcUser/delete/${mwcUser.id}">${labelOperationDelete}</a> |
                                    <a href="${ctx}/mwcUser/edit/${mwcUser.id}">${labelOperationEdit}</a> |
                                    <a href="${ctx}/mwcUser/show/${mwcUser.id}">${labelOperationShow}</a> |
                                    <a href="${ctx}/mwcUser/listseries/${mwcUser.id}">${labelOperationSeries}</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>