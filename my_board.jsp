
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head> 
<meta charset="UTF-8">
<title>COMP322: Databases</title>
</head>
<body>

<p>
<i> ------ For Debugging ------ <br>
<%

request.setCharacterEncoding("UTF-8");
String myName = request.getParameter("my_nickname");
String myText = request.getParameter("my_text");
String rowID = request.getParameter("rid_select");

out.println("Nickname parameter: <b>"+myName+"</b>");
out.println("<br>");
out.println("My text parameter: <b>"+myText+"</b>");
out.println("<br>");
out.println("Row ID: <b>"+rowID+"</b>");
out.println("<br>");

%> 
</i>
</p>
<hr>

<% 
    String user = "root";
    String passwd = "";
    String url = "jdbc:mysql://localhost/project2";
    
    Connection conn = null;
    Statement stmt;
    ResultSet rs;
    String sql = null;
    
    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection(url,user,passwd);
    stmt = conn.createStatement();


    if(myName != null) {

        sql = "INSERT INTO my_board (nickname, mytext) VALUES ('" + myName + "', '" + myText + "')";
        stmt.executeUpdate(sql);
     
    }

    // Delete Operation
    if(rowID != null) {

        sql = "DELETE FROM my_board WHERE id = " + rowID;
        stmt.executeUpdate(sql);

    }

 %>

<h2> (Local) My Board </h2>

<% 
    String query = "select * from my_board";
    rs = stmt.executeQuery(query);
 
    out.println("<table border='1'>");
    out.println("<tr><th>id</th><th>nickname</th><th>mytext</th></tr>");

    while(rs.next()) {
        out.println("<tr>");
        out.println("<td>" + rs.getString("id") + "</td>");
        out.println("<td>" + rs.getString("nickname") + "</td>");
        out.println("<td>" + rs.getString("mytext") + "</td>");
        out.println("</tr>");
    }
    out.println("</table>");

    rs.close();
%>



<hr>

<h2> INSERT </h2>

<form action="my_board.jsp" method="POST">
  Name: <input type="text" name="my_nickname" value="Your Name">
  Text: <input type="text" name="my_text" value="Your Text"> <br>
  <input type="submit" value="Add a new text"> 
</form>

<br>

<hr>

<form action="my_board.jsp" method="POST">
    <h2> DELETE </h2>
    <Label> ID to be deleted: </Label>

    <select name="rid_select">
        <% 

        query = "select id from my_board";
        rs = stmt.executeQuery(query);
        
        while(rs.next()){
            out.println("<option value=");
            out.println("\""+rs.getString(1)+"\"");
            out.println(">"+rs.getString(1)+"</option>");		
        }

        rs.close();
        stmt.close();
        conn.close();
        %>
    </select> 

    <br>
    <input type="submit" value="Delete">  
</form>
 
</body>
</html>