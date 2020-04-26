package com.ruoyi.common.exception.user;

public class PaswordExpiredException extends UserException {
    public PaswordExpiredException() {
        super("user.password.expired", null);
    }
}
