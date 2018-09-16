<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html; charset=UTF-8" language="java"	pageEncoding="UTF-8"%>

<html>
<head>

    <title>Менеджер деталей</title>

    <style type="text/css">
        .tHead {
            border-collapse: collapse;
            border-spacing: 0;
            border-color: black;
            background-color: white;
        }

        .tHead td {
            font-family: "Times New Roman", sans-serif;
            font-size: 14px;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: black;
            color: #333;
            background-color: white;
        }

        .tHead th {
            font-family: "Times New Roman", sans-serif;
            font-size: 14px;
            font-weight: normal;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: black;
            color: #333;
            background-color: #E4F6F9;
        }

        .tAddFilter {
            font-family: "Times New Roman", sans-serif;
            font-size: 14px;
            font-weight: normal;
            padding: 10px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #9AD4FF;
            color: #333;
            background-color: white;
        }

    </style>
</head>
<body bgcolor="#dcdcdc">
<table width="100%">
    <tr>
        <td width="1%"></td>
        <td width="98%" bgcolor="white">
            <table class="tAddFilter" width="100%">
                <tr>
                        <%--Страница добавления деталей--%>
                    <td width="50%">
                        <jsp:include page="add.jsp"/>
                    </td>
                        <%--Страница фильтра--%>
                    <td width="50%">
                        <jsp:include page="filter.jsp"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <h1>Список деталей</h1>
                    </td>
                </tr>
                <tr>
                        <%--Страница меню пейджинга--%>
                    <td colspan="2">
                        <jsp:include page="paging.jsp"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <table class="tHead" width="100%">
                            <tr>
                                <th width="5%">№</th>
                                <th width="50%">Наименование</th>
                                <th width="10%">Необходимость</th>
                                <th width="10%">Количество</th>
                                <th width="10%">Редактор</th>
                                <th width="10%">Удалить</th>
                            </tr>
                            <c:if test="${!empty listParts}">
                                <c:forEach items="${listParts}"
                                           var="part">
                                    <tr>
                                        <td>${part.id}</td>
                                        <td>${part.name}</td>
                                        <td>
                                            <c:if test="${true == part.need}">да</c:if>
                                            <c:if test="${false == part.need}">нет</c:if>
                                        </td>

                                        <td>${part.number}</td>
                                        <td><a href="<c:url value='/edit/${part.id}'/>">Изменить</a></td>
                                        <td><a href="<c:url value='/remove/${part.id}'/>">Удалить</a></td>
                                    </tr>
                                </c:forEach>
                            </c:if>
                        </table>
                    </td>
                </tr>
                <tr>
                        <%--Страница меню пейджинга--%>
                    <td colspan="2">
                        <jsp:include page="paging.jsp"/>
                    </td>
                </tr>
                <tr>
                    <%--Бизнес требование--%>
                    <td colspan="2">
                        <table class="tHead" width="100%">
                            <tr>
                                <td width="65%">Можно собрать</td>
                                <td width="10%">${compsCount}</td>
                                <td width="20%">компьютеров</td>
                            </tr>

                        </table>
                    </td>
                </tr>
            </table>
        </td>
        <td width="1%"></td>
    </tr>
</table>
</body>
</html>
