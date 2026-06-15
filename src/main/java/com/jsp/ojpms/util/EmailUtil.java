package com.jsp.ojpms.util;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EmailUtil {

	private static final String FROM="atharva.rananaware@gmail.com";
	private static final String PASSWORD="ttnhzzdyldgemzba";
	
	public static void sendEmail(String to , String subject , String textMessage) {
		
		Properties properties = new Properties();
		properties.put("mail.smtp.host", "smtp.gmail.com");
		properties.put("mail.smtp.port", "587");
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.starttls.enable", "true");
		
		Session session = Session.getInstance(properties , new Authenticator() {
			
			 protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
				return new javax.mail.PasswordAuthentication(FROM , PASSWORD);
			}
		});
		
		try {
			Message message =new MimeMessage(session);
			message.setSubject(subject);
			message.setText(textMessage);
			message.setFrom(new InternetAddress(FROM));
			
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
			
			Transport.send(message);
			System.out.println("Email Sent ...... ");
		} catch (Exception e) {

			e.printStackTrace();
		}
		
	}
}
