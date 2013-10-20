<%@ page import="trend.libraries.*, java.util.*, trend.project.msi.*, org.json.simple.JSONObject, com.google.gson.*" %>

<%
  Students s = new Students();
  JSONObject result = new JSONObject();
  Gson gson = new Gson();
  String op = request.getParameter("intent");
  if(op.equals("u")) {
      String key = request.getParameter("field");
      String value = request.getParameter("val");
      int id = Integer.parseInt(request.getParameter("id"));
      s.update(key, value, id);
  } else if (op.equals("d")) {
      int id = Integer.parseInt(request.getParameter("id"));
      s.delete(id);
  } else if (op.equals("c")) {
      String username = request.getParameter("username");
      String password = request.getParameter("password");
      String email = request.getParameter("email");
      s.create(username, password, email);
      
  } else if (op.equals("r")) {
      
      JSONObject items = new JSONObject();
      for(int i = 0; i < s.read().size(); i++) {
          JSONObject item = new JSONObject();
          item.put("profile", s.read().get(i).get(7));
          item.put("username", s.read().get(i).get(1));
          item.put("name", s.read().get(i).get(3));
          item.put("address", s.read().get(i).get(4));
          item.put("email", s.read().get(i).get(5));
          item.put("contact", s.read().get(i).get(6));
          item.put("id", s.read().get(i).get(0));
          items.put(i, item);
      }
      
      out.print(items);
  } else if (op.equals("s")) {
      String key = request.getParameter("key");
      JSONObject items = new JSONObject();
      ArrayList<ArrayList<String>> search_result = s.search(key);
      for(int i = 0; i < search_result.size(); i++) {
          JSONObject item = new JSONObject();
          item.put("profile", search_result.get(i).get(7));
          item.put("username", search_result.get(i).get(1));
          item.put("name", search_result.get(i).get(3));
          item.put("address", search_result.get(i).get(4));
          item.put("email", search_result.get(i).get(5));
          item.put("contact", search_result.get(i).get(6));
          item.put("id", search_result.get(i).get(0));
          items.put(i, item);
      }
      
      out.print(items);
  } else {
      out.print("not a valid operation");
  }
  out.flush();
%>
