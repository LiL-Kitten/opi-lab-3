<%--<%@ page contentType="text/html;charset=UTF-8" %>--%>
<%--<%--%>
<%--    String title = request.getParameter("title");--%>
<%--    String message = request.getParameter("message");--%>

<%--    if (title == null || title.isEmpty()) {--%>
<%--        title = "error.title";--%>
<%--    }--%>
<%--    if (message == null || message.isEmpty()) {--%>
<%--        message = "error.message";--%>
<%--    }--%>
<%--%>--%>

<%--<!DOCTYPE html>--%>
<%--<html lang="ru">--%>
<%--<head>--%>
<%--    <meta charset="UTF-8">--%>
<%--    <meta name="viewport" content="width=device-width, initial-scale=1.0">--%>
<%--    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/error.css">--%>
<%--    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">--%>
<%--    <title><%= title %></title>--%>
<%--</head>--%>
<%--<body>--%>
<%--<header>--%>
<%--    <h1><%= title %></h1>--%>
<%--</header>--%>
<%--<main>--%>
<%--    <p><%= message %></p>--%>
<%--    <p>--%>
<%--        <a href="${pageContext.request.contextPath}">нажми на меня и я верну тебя домой =)</a>--%>
<%--    </p>--%>
<%--</main>--%>
<%--</body>--%>
<%--</html>--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="${pageContext.request.locale.language}">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/error.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
    <title><fmt:message bundle="${msg}" key="${titleKey}"/></title>
</head>
<body>
<header>
    <h1><fmt:message bundle="${msg}" key="${titleKey}"/></h1>
</header>
<main>
    <p><fmt:message bundle="${msg}" key="${messageKey}"/></p>
    <p>
        <a href="${pageContext.request.contextPath}">нажми на меня и я верну тебя домой =)</a>
    </p>
</main>
</body>
</html>