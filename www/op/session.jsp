<%@ page import="trend.libraries.*, java.util.*, trend.project.msi.*, org.json.simple.JSONObject" %>
<%
  JSONObject result = new JSONObject();
  result.put("loggedin", session.getAttribute("loggedIn"));
  result.put("user", session.getAttribute("user"));
  out.print(result);
  out.flush();
%>