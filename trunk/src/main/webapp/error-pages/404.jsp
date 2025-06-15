<%@ taglib prefix="c" uri="https://jakarta.ee/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="https://jakarta.ee/jsp/jstl/fmt" %>

<fmt:setLocale value="${pageContext.request.locale}" />
<fmt:setBundle basename="messages" var="msg" />

<fmt:message key="error404title" bundle="${msg}" var="title" />
<fmt:message key="error404message" bundle="${msg}" var="message" />

<jsp:include page="error.jsp">
    <jsp:param name="title" value="${title}" />
    <jsp:param name="message" value="${message}" />
</jsp:include>