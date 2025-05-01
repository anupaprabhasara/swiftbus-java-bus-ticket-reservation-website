<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Navigation Bar (Non-Logged-In User) -->
<nav class="bg-green-600 text-white sticky top-0 z-50 shadow-lg">
  <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
    <div class="flex justify-between items-center h-16">

      <!-- Brand -->
      <a href="${pageContext.request.contextPath}/" class="flex items-center space-x-2 text-2xl font-bold">
        <i class="fas fa-bus-alt"></i> <span>SwiftBus</span>
      </a>

      <!-- Navigation Links -->
      <div class="hidden md:flex space-x-6">
        <a href="${pageContext.request.contextPath}/" class="hover:text-green-200 transition">Home</a>
        <a href="${pageContext.request.contextPath}/routes" class="hover:text-green-200 transition">Routes</a>
        <a href="${pageContext.request.contextPath}/schedules" class="hover:text-green-200 transition">Schedules</a>
        <a href="${pageContext.request.contextPath}/contact" class="hover:text-green-200 transition">Contact</a>
      </div>

      <!-- Right Section for Non-Logged-In Users -->
      <div class="flex items-center space-x-4">
        <!-- Auth Buttons -->
        <div class="flex space-x-2">
          <a href="${pageContext.request.contextPath}/login"
            class="px-4 py-2 text-sm font-medium text-white hover:text-green-200 transition">Login</a>
          <a href="${pageContext.request.contextPath}/signup"
            class="px-4 py-2 bg-white text-green-600 rounded-md text-sm font-semibold hover:bg-green-100 transition">
            Sign Up
          </a>
        </div>
      </div>

    </div>
  </div>
</nav>