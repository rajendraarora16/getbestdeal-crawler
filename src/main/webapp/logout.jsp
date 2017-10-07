<%
session.setAttribute("userEmail", null);
session.invalidate();
response.sendRedirect("login.jsp");
%>