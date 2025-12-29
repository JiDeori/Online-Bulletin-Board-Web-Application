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
 
<% 

	String user = "root";
	String passwd = "";
	String url = "jdbc:mysql://localhost/project2";
	 
	Connection conn = null;
	Statement stmt;
	ResultSet rs;
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(url,user,passwd);
	stmt = conn.createStatement();
%>

<h2>--- List of Students ---</h2>

<% 
	// run the SQL statement to read the "new_student" table
	// display the student information with "<table>" tag in a html.
	// add a hyperlink for each nickname as follows:
	//   student_detail.jsp?nickname=apt (If nickname is apt) 

	String query = "SELECT * FROM new_student";
	rs = stmt.executeQuery(query);

	out.println("<table border='1'>");
	out.println("<tr>");
    out.println("<th>nickname</th>");
    out.println("<th>section</th>");
    out.println("<th>gender</th>");
    out.println("<th>mbti_type</th>");
    out.println("<th>direction</th>");
    out.println("<th>sauce</th>");
    out.println("<th>mint</th>");
    out.println("<th>sleep_duration</th>");
    out.println("</tr>");

	while(rs.next()) {
        out.println("<tr>");
        
        String nick = rs.getString("nickname");
        out.println("<td><a href='student_detail.jsp?nickname=" + nick + "'>" + nick + "</a></td>");
        
        out.println("<td>" + rs.getString("section") + "</td>");
        out.println("<td>" + rs.getString("gender") + "</td>");
        out.println("<td>" + rs.getString("mbti_type") + "</td>");
        out.println("<td>" + rs.getString("direction") + "</td>");
        out.println("<td>" + rs.getString("sauce") + "</td>");
        out.println("<td>" + rs.getString("mint") + "</td>");
        out.println("<td>" + rs.getString("sleep_duration") + "</td>");
        
        out.println("</tr>");
    }
	out.println("</table>");

	rs.close();
	stmt.close();
	conn.close();
%>



</body>
</html>