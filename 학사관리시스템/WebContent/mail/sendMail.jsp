<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*"  %>
<%@ page import="java.io.*"%>
<%@ page import="javax.mail.Transport"%>
<%@ page import="javax.mail.Message"%>
<%@ page import="javax.mail.Address"%>
<%@ page import="javax.mail.internet.InternetAddress"%>
<%@ page import="javax.mail.internet.MimeMessage"%>
<%@ page import="javax.mail.Session"%>
<%@ page import="javax.mail.Authenticator"%>
<%@ page import="javax.mail.PasswordAuthentication"%>
<%@ page import="java.util.Properties"%>
<%!
private static class SMTPAuthenticatior extends Authenticator{

    @Override
    protected PasswordAuthentication getPasswordAuthentication() {
        return new PasswordAuthentication("kiik2008","P4u-9Px-4cR-u8z");
    }
}

private static class FindDAO {
	Connection conn = null;
	
	public void con() {
		try {
			String jdbcUrl = "jdbc:mysql://localhost:3306/capstone";
			String jdbcId = "manager";
			String jdbcPw = "1q2w3e4r";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl, jdbcId, jdbcPw);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public boolean find(int id, String name, int birth) {
		con();
		
		boolean result = false;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		if(String.valueOf(id).length() >= 6) {
			try {
				String Query = "Select * from capstone.student where stu_code=? and stu_name=? and stu_birth=?";
				pstmt = conn.prepareStatement(Query);
				pstmt.setInt(1, id);
				pstmt.setString(2, name);
				pstmt.setInt(3, birth);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					result = true;
				}	
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				try {pstmt.close(); rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		else if(String.valueOf(id).length() == 4) {
			try {
				String Query = "Select * from capstone.professor where pro_code=? and pro_name=? and pro_birth=?";
				pstmt = conn.prepareStatement(Query);
				pstmt.setInt(1, id);
				pstmt.setString(2, name);
				pstmt.setInt(3, birth);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					result = true;
				}
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				try {pstmt.close(); rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return result;
	}
	
	public boolean mailfind(int id) {
		con();
		
		boolean findmail = false;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		if(String.valueOf(id).length() >= 6) {
			try {
				String Query = "Select * from capstone.student where stu_code=?";
				pstmt = conn.prepareStatement(Query);
				pstmt.setInt(1, id);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					if(rs.getString("stu_mail") == null || rs.getString("stu_mail").length() < 1) {
						findmail = false;
				} else {
					findmail = true;
					}
				}
			}
			catch(Exception e) {
				e.printStackTrace();
			} finally {
				try {pstmt.close(); rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
					}
			}
		}
		else if(String.valueOf(id).length() == 4) {
			try {
				String Query = "Select * from capstone.professor where pro_code=?";
				pstmt = conn.prepareStatement(Query);
				pstmt.setInt(1, id);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					if(rs.getString("pro_mail") == null || rs.getString("pro_mail").length() < 1){
						findmail = false;
				} else {
					findmail = true;
					}
				}
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				try {pstmt.close(); rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return findmail;
	}
	
	public void update(int id, String name, int birth, String pass) {
		con();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		if(String.valueOf(id).length() >= 6) {
			try {
				String Query = "Select * from capstone.student where stu_code=? and stu_name=? and stu_birth=?";
				pstmt = conn.prepareStatement(Query);
				pstmt.setInt(1, id);
				pstmt.setString(2, name);
				pstmt.setInt(3, birth);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					Query = "Update capstone.student set stu_pw=? where stu_code=?";
					pstmt = conn.prepareStatement(Query);
					pstmt.setString(1, pass);
					pstmt.setInt(2, id);
					pstmt.executeUpdate();
				}
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				try { pstmt.close(); rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		else if(String.valueOf(id).length() == 4) {
			try {
				String Query = "Select * from capstone.professor where pro_code=? and pro_name=? and pro_birth=?";
				pstmt = conn.prepareStatement(Query);
				pstmt.setInt(1, id);
				pstmt.setString(2, name);
				pstmt.setInt(3, birth);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					Query = "Update capstone.professor set pro_pw=? where pro_code=?";
					pstmt = conn.prepareStatement(Query);
					pstmt.setString(1, pass);
					pstmt.setInt(2, id);
					pstmt.executeUpdate();
				}
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				try { pstmt.close(); rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}
	
	public void transmail(int id) {
		con();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			if(String.valueOf(id).length() >= 6) {
				String Query = "Select * from capstone.student where stu_code=?";
				pstmt = conn.prepareStatement(Query);
				pstmt.setInt(1, id);
				rs = pstmt.executeQuery();
			}
			else if(String.valueOf(id).length() == 4) {
				String Query = "Select * from capstone.professor where pro_code=?";
				pstmt = conn.prepareStatement(Query);
				pstmt.setInt(1, id);
				rs = pstmt.executeQuery();
			}

			Properties props = new Properties();

			props.put("mail.smtp.host","smtp.naver.com");

			props.put("mail.smtp.port", "465");
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.debug", "true");
			props.put("mail.smtp.socketFactory.port", "465");
			props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.socketFactory.fallback", "false");
	
			Authenticator auth = new SMTPAuthenticatior();
		    Session ses = Session.getInstance(props, auth);
		    
		    ses.setDebug(true);
		    
		    MimeMessage msg = new MimeMessage(ses);
		    msg.setSubject("학사관리시스템 임시비밀번호입니다.");
		    
		    Address fromAddr = new InternetAddress("kiik2008");
		    msg.setFrom(fromAddr);
		    
			String content = null;
		    
		    if(rs.next()){
				if(String.valueOf(id).length() >= 6) {
		        	if(rs.getString("stu_mail") == null || rs.getString("stu_mail").length() < 1) {
			        	throw new Exception();
			        }
		        	
			        msg.addRecipient(Message.RecipientType.TO, new InternetAddress(rs.getString("stu_mail")));
			        content = "임시비밀번호는 " + rs.getString("stu_pw") + " 입니다.<br>비밀번호 변경 후 사용바랍니다.";
				}
		        else if(String.valueOf(id).length() == 4) {
		        	if(rs.getString("pro_mail") == null || rs.getString("pro_mail").length() < 1) {
			        	throw new Exception();
			        }
		        	
			        msg.addRecipient(Message.RecipientType.TO, new InternetAddress(rs.getString("pro_mail")));
			        content = "임시비밀번호는 " + rs.getString("pro_pw") + " 입니다.<br>비밀번호 변경 후 사용바랍니다.";
				}
				
			    msg.setContent(content, "text/html;charset=UTF-8");
			    Transport.send(msg);
		    }
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				try { pstmt.close(); rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
	}

	public String tempPw() {
		String pass = "";
		char[] set = {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'};
		
		for(int i = 1; i <= 6; i++) {
			if(i % 2 == 0) {
				pass += (int)(Math.round(Math.random()*9));
			}
			else {
				pass += set[(int)(Math.random()*set.length)];
			}
		}
		return pass;
	}
}
%>
<%
	request.setCharacterEncoding("euc-kr");
	int id = Integer.parseInt(request.getParameter("id"));
	String name = request.getParameter("name");
	int birth = Integer.parseInt(request.getParameter("birth"));
	
	FindDAO dao = new FindDAO();

	boolean result = dao.find(id, name, birth);
	boolean mailfind = dao.mailfind(id);
	
	if(result) {
		String pass = dao.tempPw();
		if(mailfind) {
			dao.update(id, name, birth, pass);
			dao.transmail(id);
			%><script>alert('등록된 메일로 임시비밀번호가 발급되었습니다.');close();</script><%
		}
		else {
			%><script>
			alert('이메일이 없습니다.');
			location.href = 'addmail.jsp';
			</script><%
		}
	}
	else {
		%><script>alert('정보가 일치하지 않습니다.');close();</script><%
	}
%>