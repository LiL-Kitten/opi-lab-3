<fmt:setBundle basename="messages" var="msg" />

<c:set var="title" value="<fmt:message key='error.404.title' bundle='${msg}' />" />
<c:set var="message" value="<fmt:message key='error.404.message' bundle='${msg}' />" />

<jsp:include page="error.jsp">
    <jsp:param name="title" value="${title}" />
    <jsp:param name="message" value="${message}" />
</jsp:include>