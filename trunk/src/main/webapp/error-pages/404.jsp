<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:setBundle basename="messages" var="msg"/>

<c:set var="titleKey" value="error404title"/>
<c:set var="messageKey" value="error404message"/>

<jsp:include page="error.jsp"/>