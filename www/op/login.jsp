<%@ page import="trend.libraries.*, java.util.*, trend.project.msi.*, org.json.simple.JSONObject" %>
<%
  String username = request.getParameter("username");
  String password = request.getParameter("password");
  Students s = new Students();
  JSONObject result = new JSONObject();
  if(s.login(username, password) == true) {
      session.setAttribute("user", username);
      session.setAttribute("loggedIn", true);
      result.put("result", new Boolean(true));
      result.put("user", session.getAttribute("user"));
  } else {
      session.setAttribute("loggedIn", false);
      result.put("result", new Boolean(false));
  }
  
  out.print(result);
  out.flush();
%>