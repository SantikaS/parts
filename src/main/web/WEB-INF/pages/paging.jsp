<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page contentType="text/html; charset=UTF-8" language="java"	pageEncoding="UTF-8"%>

<html>
<head>

    <style type="text/css">
        .otherPage {
            font-family: "Times New Roman", sans-serif;
            width: 30px;
            background-color: white;
            border: #000000;
            border-style: solid;
            border-width: 1px;
        }

        .thisPage {
            font-family: "Times New Roman", sans-serif;
            width: 30px;
            background-color: #E4F6F9;
            border-style: solid;
            border-width: 1px;
        }

        .longPage {
            font-family: "Times New Roman", sans-serif;
            width: 100px;
            background-color: white;
            border: #000000;
            border-style: solid;
            border-width: 1px;
        }
    </style>
</head>
<body>
<table>
    <tr>
        <c:url var="pages" value="/parts"/>

        <%--Меню пейджинга--%>
        <%--Ссылка на первую страницу--%>
        <form:form action="${pages}" commandName="filter">
            <td>
                <input type="hidden"
                       name="page"
                       value="${1}"/>
                <input class="longPage" type="submit"
                       name="first"
                       value="<spring:message text="первая"/>"/>
            </td>
        </form:form>

        <%--Ссылка на предидущую страницу--%>
        <form:form action="${pages}" commandName="filter">
            <td>
                <c:if test="${filter.page < 1}">
                    <input type="hidden"
                           name="page"
                           value="${1}"/>
                </c:if>
                <c:if test="${filter.page > 1}">
                    <input type="hidden"
                           name="page"
                           value="${filter.page - 1}"/>
                </c:if>
                <input class="longPage" type="submit"
                       name="prev"
                       value="<spring:message text="предыдущая"/>"/>
            </td>
        </form:form>

        <%--Ссылка на страницу с короткими запросами--%>
        <form:form action="${pages}" commandName="filter">
            <c:if test="${pagesCount < 12}">
                <c:forEach begin="1"
                           end="${pagesCount}"
                           step="1"
                           varStatus="i">
                    <td>
                        <c:if test="${i.index == filter.page}">
                            <input class="thisPage" type="submit"
                                   name="page"
                                   value="${i.index}"/>
                        </c:if>
                        <c:if test="${i.index != filter.page}">
                            <input class="otherPage" type="submit"
                                   name="page"
                                   value="${i.index}"/>
                        </c:if>
                    </td>
                </c:forEach>
            </c:if>

            <%--Ссылка на страницу с короткими запросами ( +-5 строк)--%>
            <c:if test="${pagesCount > 11}">

                <%--Левый бордюр--%>
                <c:if test="${filter.page < 6}">
                    <c:forEach begin="${1}"
                               end="${11}"
                               step="1"
                               varStatus="i">
                        <td>
                            <c:if test="${i.index == filter.page}">
                                <input class="thisPage" type="submit"
                                       name="page"
                                       value="${i.index}"/>
                            </c:if>
                            <c:if test="${i.index != filter.page}">
                                <input class="otherPage" type="submit"
                                       name="page"
                                       value="${i.index}"/>
                            </c:if>
                        </td>
                    </c:forEach>
                </c:if>

                <c:if test="${filter.page > 5 && filter.page < pagesCount-4}">
                    <c:forEach begin="${filter.page-5}"
                               end="${filter.page+5}"
                               step="1"
                               varStatus="i">
                        <td>
                            <c:if test="${i.index == filter.page}">
                                <input class="thisPage" type="submit"
                                       name="page"
                                       value="${i.index}"/>
                            </c:if>
                            <c:if test="${i.index != filter.page}">
                                <input class="otherPage" type="submit"
                                       name="page"
                                       value="${i.index}"/>
                            </c:if>
                        </td>
                    </c:forEach>
                </c:if>

                <%--Правый бордюр--%>
                <c:if test="${filter.page > pagesCount-5}">
                    <c:forEach begin="${pagesCount-10}"
                               end="${pagesCount}"
                               step="1"
                               varStatus="i">
                        <td>
                            <c:if test="${i.index == filter.page}">
                                <input class="thisPage" type="submit"
                                       name="page"
                                       value="${i.index}"/>
                            </c:if>
                            <c:if test="${i.index != filter.page}">
                                <input class="otherPage"
                                       type="submit"
                                       name="page"
                                       value="${i.index}"/>
                            </c:if>
                        </td>
                    </c:forEach>
                </c:if>
            </c:if>
        </form:form>
        </td>

        <%--Ссылка на следующую страницу--%>
        <form:form action="${pages}" commandName="filter">
            <td>
                <c:if test="${filter.page >= pagesCount}">
                    <input type="hidden"
                           name="page"
                           value="${pagesCount}"/>
                </c:if>
                <c:if test="${filter.page < pagesCount}">
                    <input type="hidden"
                           name="page"
                           value="${filter.page + 1}"/>
                </c:if>
                <input class="longPage"
                       type="submit"
                       name="next"
                       value="<spring:message text="следующая"/>"/>
            </td>
        </form:form>

        <%--Ссылка на последнюю страницу--%>
        <form:form action="${pages}" commandName="filter">
            <td>
                <input type="hidden"
                       name="page"
                       value="${pagesCount}"/>
                <input class="longPage"
                       type="submit"
                       name="last"
                       value="<spring:message text="последняя"/>"/>
            </td>
        </form:form>
    </tr>
</table>
</body>
</html>