package com.banhauniversity.sidalih.controller;


import com.banhauniversity.sidalih.entity.User;
import com.banhauniversity.sidalih.exception.CustomException;
import com.banhauniversity.sidalih.exception.ExceptionMessage;
import com.banhauniversity.sidalih.security.JwtService;
import jakarta.validation.Valid;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(path = "/auth")
public class Auth {

    private final AuthenticationManager authenticationManager;
    private final JwtService jwtTokenUtil;

    public Auth(AuthenticationManager authenticationManager,
                JwtService jwtTokenUtil
                   ) {
        this.authenticationManager = authenticationManager;
        this.jwtTokenUtil = jwtTokenUtil;

    }

    @PostMapping("/login")
    public String login(@RequestBody User user) {
        Authentication authenticate = authenticationManager.authenticate(
                            new UsernamePasswordAuthenticationToken(
                                    user.getUsername(), user.getPassword()
                            )
        );
        if (authenticate.isAuthenticated())
            return jwtTokenUtil.generateToken(user.getUsername());
        throw new CustomException(ExceptionMessage.Invalid_Credential);
    }

}
