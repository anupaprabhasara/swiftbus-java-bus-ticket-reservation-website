<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en" class="dark">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>SwiftBus | Users</title>
  <link rel="shortcut icon" href="https://ui-avatars.com/api/?name=${sessionScope.username}&background=22c55e&color=fff&rounded=true" type="image/x-icon">

  <!-- Tailwind CSS -->
  <script src="https://cdn.tailwindcss.com"></script>
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>

<body class="bg-gray-900 text-gray-100 min-h-screen flex">

  <!-- Sidebar (fixed) -->
  <%@ include file="../partials/sidebar.jsp" %>

  <!-- Main Content -->
  <div class="flex-1 flex flex-col md:ml-60">

    <!-- Topbar -->
    <%@ include file="../partials/header.jsp" %>

    <!-- Main Area -->
    <main class="flex-1 p-6 space-y-6">

      <!-- Search Bar -->
      <div class="flex flex-col md:flex-row md:justify-end md:items-center space-y-4 md:space-y-0">
        <div class="relative w-full md:w-1/3">
          <input id="search" type="text" placeholder="Search users..."
            class="w-full pl-10 pr-4 py-2 rounded-lg bg-gray-700 border border-gray-600 focus:ring-2 focus:ring-green-500 focus:outline-none text-white">
          <i class="fas fa-search absolute left-3 top-3 text-gray-400"></i>
        </div>
      </div>

      <!-- Users Table -->
      <div class="overflow-x-auto bg-gray-800 shadow-lg rounded-lg">
        <table class="w-full text-sm text-left">
          <thead class="text-xs uppercase bg-gray-700 text-gray-300">
            <tr>
              <th class="px-6 py-4">ID</th>
              <th class="px-6 py-4">Name</th>
              <th class="px-6 py-4">Email</th>
              <th class="px-6 py-4">Phone</th>
              <th class="px-6 py-4">Created At</th>
              <th class="px-6 py-4 text-center">Actions</th>
            </tr>
          </thead>
          <tbody id="table" class="text-gray-300">
            <c:choose>
              <c:when test="${not empty users}">
                <c:forEach var="u" items="${users}">
                  <tr class="border-b border-gray-700 hover:bg-gray-700/50">
                    <td class="px-6 py-4">${u.userId}</td>
                    <td class="px-6 py-4">${u.name}</td>
                    <td class="px-6 py-4">${u.email}</td>
                    <td class="px-6 py-4">${u.phone}</td>
                    <td class="px-6 py-4">${u.createdAt}</td>
                    <td class="px-6 py-4 text-center">
                      <a href="${pageContext.request.contextPath}/admin/user?action=delete&id=${u.userId}"
                         onclick="return confirm('Are you sure you want to delete this user?');"
                         class="text-red-400 hover:text-red-500">
                        <i class="fas fa-trash-alt"></i>
                      </a>
                    </td>
                  </tr>
                </c:forEach>
              </c:when>
              <c:otherwise>
                <tr>
                  <td colspan="6" class="px-6 py-4 text-center text-gray-400">
                    No users found.
                  </td>
                </tr>
              </c:otherwise>
            </c:choose>
          </tbody>
        </table>
      </div>

    </main>
  </div>

  <!-- JavaScript -->
  <%@ include file="../partials/script.jsp" %>

</body>
</html>