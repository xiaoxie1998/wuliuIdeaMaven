package com.wuliu.util;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

/**
 * 权限管理Aop
 */

@Aspect
@Component
public class QuanXianAOP {

    //权限访问(前置通知)

    public void QuanXian(JoinPoint joinPoint){
        System.out.println("前置通知======"+joinPoint);
        System.out.println(joinPoint.toString());
        System.out.println(joinPoint.getSignature());
        System.out.println(joinPoint.getSourceLocation());
        System.out.println(joinPoint.getStaticPart());
        System.out.println(joinPoint.getTarget());
    }
}
