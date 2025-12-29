<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head> 
<title> COMP322: Databases </title>
</head>
<body>
 
<p>
<i> ------ For Debugging ------ <br>
<%

String nickName = request.getParameter("nickname");
 
out.println("Nickname parameter: <b>"+nickName+"</b>");
out.println("<br>");
%> 
</p>
<hr>

<%!
   
	String getStudentInfo(String selectedNickName, String tabName, Statement stmt, boolean isFriendInfo ) {

		String result = "<h3> # " +tabName+"</h3>";

		try {
			result = result + "<table border=\"1\">\n";
			String query;
			ResultSet rs;
			ResultSetMetaData rsm;
		 
            query = "SELECT * FROM " + tabName + " WHERE nickname = '" + selectedNickName + "'";
            rs = stmt.executeQuery(query);
            rsm = rs.getMetaData();
            int colCount = rsm.getColumnCount();

            result += "<tr>";
            for(int i = 1; i <= colCount; i++) {
                result += "<th>" + rsm.getColumnName(i) + "</th>";
            }
            result += "</tr>";

            while(rs.next()) {
                result += "<tr>";
                for(int i = 1; i <= colCount; i++) {
                    String colName = rsm.getColumnName(i);
                    String val = rs.getString(i);
                    
                    if(val == null) val = ""; // null 처리

                    result += "<td>";
                    

                    if(isFriendInfo && colName.equalsIgnoreCase("friend_nickname")) {
                        result += "<a href='student_detail.jsp?nickname=" + val + "'>" + val + "</a>";
                    } else {
                        result += val;
                    }
                    
                    result += "</td>";
                }
                result += "</tr>";
            }

			result = result + "</table>\n";
		} catch (Exception SQLException) {
			return "# getStudentInfo Error";
		}
		return result;
	}
 
%>

 

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


<% 

		
    out.println("<h2> All Information about <u>" + nickName + "</u></h2> \n");


	// generate HTML tables using getStudentInfo()	
	
	out.println(getStudentInfo(nickName, "NEW_STUDENT", stmt, false));
    out.println(getStudentInfo(nickName, "FRIEND_INFO", stmt, true)); // 친구 정보만 true
    out.println(getStudentInfo(nickName, "FAVORITE_COURSE", stmt, false));
    out.println(getStudentInfo(nickName, "FAVORITE_FOOD", stmt, false));
    out.println(getStudentInfo(nickName, "PREFERRED_PL", stmt, false));
     
	
	stmt.close();
	conn.close();
%>



</body>
</html>