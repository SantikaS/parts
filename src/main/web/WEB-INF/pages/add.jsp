<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html; charset=UTF-8" language="java"	pageEncoding="UTF-8"%>

<html>
<head>
</head>
<body>
<h1>Управление деталями</h1>
<c:url var="addAction" value="/parts/add"/>
<c:set var="stringSize" value="50"/>

<form:form action="${addAction}" commandName="part">
    <table width="100%">
        <c:if test="${!empty part.id}">
            <%--Затемнение поля ID--%>
            <tr>
                <td>
                    <form:label path="id">
                        <spring:message text="№"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="id"
                                size="${stringSize}"
                                readonly="true"
                                disabled="true"/>
                    <form:hidden path="id"/>
                </td>
            </tr>
        </c:if>
        <tr>
            <td>
                <form:label path="name">
                    <spring:message text="Наименование"/>
                </form:label>
            </td>
            <td>
                <form:input path="name"
                            size="${stringSize}"
                            required="true"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="need">
                    <spring:message text="Необходимость"/>
                </form:label>
            </td>
            <td>
                <form:checkbox path="need"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="number">
                    <spring:message text="Количество"/>
                </form:label>
            </td>
                <%--проверка что введены цифры с 0-9 --%>
            <td>
                <form:input path="number"
                            size="${stringSize}"
                            pattern="[0-9]+\d*"
                            required="true"
                            title="Введите число"/>
            </td>
        </tr>


        <tr>
            <td colspan="2">
                <c:if test="${!empty part.name}">
                    <input type="submit"
                           value="<spring:message text="Редактировать деталь"/>"/>
                </c:if>
                <c:if test="${empty part.name}">
                    <input type="submit"
                           value="<spring:message text="Добавить деталь"/>"/>
                </c:if>
            </td>
        </tr>
    </table>
</form:form>
</body>
</html>