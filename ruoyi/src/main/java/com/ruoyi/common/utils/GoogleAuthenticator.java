package com.ruoyi.common.utils;

import de.taimos.totp.TOTP;
import org.apache.commons.codec.binary.Base32;
import org.apache.commons.codec.binary.Hex;

import java.security.SecureRandom;

public class GoogleAuthenticator {
    /**
     * 必须:创建谷歌秘钥
     *
     * @return
     */
    public static String generateSecretKey() {
        SecureRandom random = new SecureRandom();
        byte[] bytes = new byte[20];
        random.nextBytes(bytes);
        Base32 base32 = new Base32();
        return base32.encodeToString(bytes);
    }
    /**
     * 生成6位数密码跟前端匹配
     *
     * @param secretKey
     * @return
     */
    public static String getTOTPCode(String secretKey) {
        Base32 base32 = new Base32();
        byte[] bytes = base32.decode(secretKey);
        String hexKey = Hex.encodeHexString(bytes);
        return TOTP.getOTP(hexKey);
    }
}
