package com.ruoyi.framework.security.service;

import com.ruoyi.common.exception.user.UserPasswordNotMatchException;
import com.ruoyi.common.utils.PHPpassword;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Component;

import java.util.Collection;

@Component
public class MyAuthenticationProvider implements AuthenticationProvider {

    @Qualifier("userDetailsServiceImpl")
    @Autowired
    private UserDetailsService userService;

    /**
     * 自定义验证方式
     */
    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {
        String username = authentication.getName();
        String password = (String) authentication.getCredentials();
        UserDetails user = userService.loadUserByUsername(username);
        if (!PHPpassword.PHPpasswordVerify(password, user.getPassword())) {
            throw new UserPasswordNotMatchException();
        }

        Collection<? extends GrantedAuthority> authorities = user.getAuthorities();
        return new UsernamePasswordAuthenticationToken(user, password, authorities);
    }

    @Override
    public boolean supports(Class<?> arg0) {
        return true;
    }
}
