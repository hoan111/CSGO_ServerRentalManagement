<%-- 
    Document   : ViewAccount
    Created on : Mar 17, 2022, 4:41:47 PM
    Author     : hoan
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<t:wrapper>
    <jsp:attribute name="pageTitle">Account list</jsp:attribute>
    <jsp:body>
        <div class="container-fluid px-4">
            <h1 class="mt-4">Account list</h1>
            <ol class="breadcrumb mb-4">
                <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/dashboard">Dashboard</a></li>
                <li class="breadcrumb-item active">Account list</li>
            </ol>
            <div class="card mb-4">
                <div class="card-header">
                    <i class="fas fa-table me-1"></i>
                    Account list
                </div>
                <div class="card-body">
                    <table id="datatablesSimple">
                        <thead>
                            <tr>
                                <th>AccountID</th>
                                <th>Username</th>
                                <th>API key</th>
                                <th>Role</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tfoot>
                            <tr>
                                <th>AccountID</th>
                                <th>Username</th>
                                <th>API key</th>
                                <th>Role</th>
                                <th>Action</th>
                            </tr>
                        </tfoot>
                        <tbody>
                            <c:forEach items="${requestScope.accounts}" var="a">
                                <tr id="rowid${a.id}">
                                    <td>${a.id}</td>
                                    <td>${a.username}</td>
                                    <td>
                                        <button class="btn btn-outline-secondary btn-sm" type="button" data-bs-toggle="collapse" data-bs-target="#collapseAPIKey${a.id}" aria-expanded="false" aria-controls="collapseExample">
                                            Click to view
                                        </button>
                                        <div class="collapse" id="collapseAPIKey${a.id}">
                                            <div class="card card-body" style="margin-top:10px;">
                                                ${a.apikey}
                                            </div>
                                    </td>
                                    <c:if test="${a.role == 2}">
                                        <td>
                                            Moderator
                                        </td>
                                    </c:if>
                                    <c:if test="${a.role == 1}">
                                        <td>
                                            Administrator
                                        </td>
                                    </c:if>
                                    <td>
                                        <a type="button" class="btn btn-dark btn-sm" href="${pageContext.request.contextPath}/account/edit?id=${a.id}">Edit</a>
                                        <c:if test="${a.id != 1}">
                                            <button type="button" class="btn btn-danger confirm-delete btn-sm" id="${a.id}" data-toggle="modal" data-target="#myModal">Delete</button>
                                        </c:if>
                                    </td>
                                </c:forEach>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- Modal -->
            <div id="myModal" class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Delete Account</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <p>Are you sure want to delete?</p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button id="deleteAccountbtn" type="button" class="btn btn-danger">Confirm delete</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Alert -->
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

            <div id="success-alert" class="alert alert-success d-flex align-items-center d-none" role="alert">
                <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Success:"><use xlink:href="#check-circle-fill"/></svg>
                <div id="alertSuccessInfo"></div>
            </div>
            <div id="error-alert" class="alert alert-danger d-flex align-items-center d-none" role="alert">
                <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Danger:"><use xlink:href="#exclamation-triangle-fill"/></svg>
                <div id="alertErrorInfo"></div>
            </div>
        </div>
    </jsp:body>
</t:wrapper>
