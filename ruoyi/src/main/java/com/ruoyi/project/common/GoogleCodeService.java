package com.ruoyi.project.common;
import com.ruoyi.common.exception.user.GoogleAuthCodeException;
import com.ruoyi.common.utils.GoogleAuthenticator;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.framework.security.LoginUser;
import com.ruoyi.project.system.domain.SysUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;

@Service
public class GoogleCodeService {
    @Autowired
    private HttpServletRequest request;

    public void verifyGooglecode(SysUser user,String googlecode) throws GoogleAuthCodeException {
        String value = request.getHeader("clientimestamp");
        String totpCode = null;
        if (null != value) {
            totpCode = GoogleAuthenticator.getTOTPCode(Long.parseLong(value), user.getGooglekey());
        } else {
            totpCode = GoogleAuthenticator.getTOTPCode(user.getGooglekey());
        }
        if (org.springframework.util.StringUtils.isEmpty(googlecode) || !googlecode.equals(totpCode)) {
            throw new GoogleAuthCodeException();
        }
    }

}
