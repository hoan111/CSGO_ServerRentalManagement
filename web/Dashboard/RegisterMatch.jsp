<%-- 
    Document   : AddServer
    Created on : Mar 3, 2022, 5:28:11 PM
    Author     : hoan
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<t:wrapper>
    <jsp:attribute name="pageTitle">Register a match</jsp:attribute>
    <jsp:body>
        <div class="container-fluid px-4">
            <h1 class="mt-4">Register a match</h1>
            <ol class="breadcrumb mb-4">
                <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/dashboard">Dashboard</a></li>
                <li class="breadcrumb-item active">Register a match</li>
            </ol>
            <form method="POST" action="${pageContext.request.contextPath}/match/register" id="registerMatchForm" class= "needs-validation" novalidate>
                <div class="row">
                    <div class ="col-md-6">
                        <label class="form-label">Select a server you want to assign to</label>
                        <select name="selectServer" class="form-select">
                            <option value="-1">Please select a server</option>
                            <c:forEach items="${requestScope.activeServers}" var="s">
                                <option value="${s.id}">${s.serverName}</option>
                            </c:forEach>
                        </select>
                        <div class="errordiv"></div>
                    </div>
                    <div class ="col-md-6">
                        <label class="form-label">Customer Facebook</label>
                        <input name="facebookLink" type="url" class="form-control" id="facebookLinkInput" placeholder="Enter a url">
                        <div class="errordiv"></div>
                    </div>
                </div>
                <div class="row">
                    <div class ="col-md-6">
                        <label class="form-label">Match type</label>
                        <select name="selectMatchType" class="form-select">
                            <option value="-1">Please select match type</option>
                                <option value="1">BO1</option>
                                <option value="2">BO2</option>
                                <option value="3">BO3</option>
                                <option value="5">BO5</option>
                        </select>
                        <div class="errordiv"></div>
                    </div>
                    <div class ="col-md-6">
                        <label class="form-label">Price</label>
                        <input name="price" type="text" class="form-control" id="priceInput" placeholder="Enter price">
                        <div class="errordiv"></div>
                    </div>
                </div>

                <input class="btn btn-primary" type="submit" value="Register" style="margin-top: 20px;">
            </form>
            <svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
            <symbol id="check-circle-fill" fill="currentColor" viewBox="0 0 16 16">
                <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
            </symbol>
            <symbol id="info-fill" fill="currentColor" viewBox="0 0 16 16">
                <path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm.93-9.412-1 4.705c-.07.34.029.533.304.533.194 0 .487-.07.686-.246l-.088.416c-.287.346-.92.598-1.465.598-.703 0-1.002-.422-.808-1.319l.738-3.468c.064-.293.006-.399-.287-.47l-.451-.081.082-.381 2.29-.287zM8 5.5a1 1 0 1 1 0-2 1 1 0 0 1 0 2z"/>
            </symbol>
            <symbol id="exclamation-triangle-fill" fill="currentColor" viewBox="0 0 16 16">
                <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
            </symbol>
            </svg>
            <c:if test="${requestScope.isSuccess == false}">
                <div class="alert alert-danger d-flex align-items-center" role="alert" style="margin-top: 20px">
                    <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Danger:"><use xlink:href="#exclamation-triangle-fill"/></svg>
                    <div>
                        ${requestScope.msg}
                    </div>
                </div>
            </c:if>
            <c:if test="${requestScope.isSuccess == true}">
                <div class="alert alert-success d-flex align-items-center" role="alert" style="margin-top: 20px">
                    <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Success:"><use xlink:href="#check-circle-fill"/></svg>
                    <div>
                        ${requestScope.msg}
                    </div>
                </c:if>
            </jsp:body>
        </t:wrapper>


