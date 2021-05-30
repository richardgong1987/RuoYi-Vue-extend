package com.ruoyi.common.utils;

import at.favre.lib.crypto.bcrypt.BCrypt;

public class PHPpassword {
    public static void main(String[] args) {
        String password = "admin123";
        String hash = PHPpasswordHash(password);
        System.out.println(hash);
        boolean b = PHPpasswordVerify(password, hash);
        boolean b2 = PHPpasswordVerify(password, "$2a$13$jIFK.m0PK3xWEqAGoHi5keRblfKO./A2AU/YTOt5Q.VrQIhTKqhde");
        System.out.println(b);
        System.out.println(b2);
    }

    /**
     * java版本的passwordHash
     *
     * @param password
     * @return
     */
    public static String PHPpasswordHash(String password) {
        return BCrypt.withDefaults().hashToString(13, password.toCharArray());
    }

    /**
     * 验证passsword
     *
     * @param password
     * @param hashphpassword
     * @return
     */
    public static boolean PHPpasswordVerify(String password, String hashphpassword) {
        BCrypt.Result res = BCrypt.verifyer().verify(password.toCharArray(), hashphpassword);
        return res.verified;
    }
}
