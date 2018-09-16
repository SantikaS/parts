<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page contentType="text/html; charset=UTF-8" language="java"	pageEncoding="UTF-8"%>

<html>
<head>
</head>
<body>
<h1>Сортировка</h1>
<c:url var="filterUsers" value="/parts"/>
<c:set var="numSize" value="20"/>
<c:set var="stringSize" value="50"/>

<form:form action="${filterUsers}" commandName="filter">
    <table>
        <tr>
            <td>
                <form:label path="need">
                    <spring:message text="Все детали"/>
                </form:label>
            </td>
            <td>
                <form:radiobutton path="need" value="all"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="need">
                    <spring:message text="Необходимые детали"/>
                </form:label>
            </td>
            <td>
                <form:radiobutton path="need" value="true"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="need">
                    <spring:message text="Опциональные детали"/>
                </form:label>
            </td>
            <td>
                <form:radiobutton path="need" value="false"/>
            </td>
        </tr>

        <tr>
            <td>
                <form:label path="name">
                    <spring:message text="Наименование"/>
                </form:label>
            </td>
            <td colspan="3">
                <form:input path="name"
                            size="${stringSize}"/>
            </td>
        </tr>

        <tr>
                <%--Установка первой страницы после фильтрации--%>
            <td>
                <input type="hidden"
                       name="page"
                       value="${1}"/>
                <input type="submit"
                       value="<spring:message text="Поиск"/>"/>
            </td>
        </tr>
    </table>
</form:form>
</body>
</html>