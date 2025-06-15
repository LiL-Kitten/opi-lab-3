<%@ page contentType="text/html;charset=UTF-8" %>
<%--<%--%>
<%--    String title = request.getParameter("title");--%>
<%--    String message = request.getParameter("message");--%>

<%--    if (title == null || title.isEmpty()) {--%>
<%--        title = "Ошибка";--%>
<%--    }--%>
<%--    if (message == null || message.isEmpty()) {--%>
<%--        message = "Произошла ошибка. Пожалуйста, попробуйте позже.";--%>
<%--    }--%>
<%--%>--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

<fmt:setLocale value="${pageContext.request.locale}" />
<fmt:setBundle basename="messages" />

<c:set var="titleKey" value="${param.title}" />
<c:set var="messageKey" value="${param.message}" />


<!DOCTYPE html>
<html lang="${pageContext.request.locale.language}">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/error.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
    <title><fmt:message key="${titleKey}" /></title>
</head>
<body>
<header>
    <h1><fmt:message key="${titleKey}" /></h1>
</header>
<main>
    <p><fmt:message key="${messageKey}"/></p>
    <p>
        <a href="${pageContext.request.contextPath}">нажми на меня и я верну тебя домой =)</a>
    </p>
</main>
</body>
</html>
