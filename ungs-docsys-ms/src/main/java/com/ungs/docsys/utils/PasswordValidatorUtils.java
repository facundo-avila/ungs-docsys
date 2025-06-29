package com.ungs.docsys.utils;

import java.util.regex.Pattern;

public class PasswordValidatorUtils {
    private static final String PASSWORD_PATTERN =
            "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[!@#$%^&*()_+\\-=\\[\\]{};':\"\\\\|,.<>/?]).{8,}$";

    public static boolean isValid(String password) {
        Pattern pattern = Pattern.compile(PASSWORD_PATTERN);
        return password != null && pattern.matcher(password).matches();
    }
}
