package com.jsp.ojpms.util;

import java.util.Base64;

public class PasswordUtil {

	public static String encode(String password) {

		return Base64.getEncoder().encodeToString(password.getBytes());
	}

	public static String decode(String ecodePass) {
		return new String(Base64.getDecoder().decode(ecodePass));
	}
}
