Spring Boot AOP 自定义注解实现日志的：

在实际开发中，我们经常需要对某些方法进行分类，例如，有些方法需要记录日志，有些则不需要记录日志。使用 AOP ，我们可以通过自定义注解，来标注需要记录日志的方法，以达到只记录需要监控的方法的效果。这种方法可以避免对整个应用程序的日志方式进行改变，做到减少误操作，提高代码复用率。

以下是使用自定义注解实现接口调用日志打印的步骤：

步骤一：定义注解
首先，我们需要定义一个注解 @Log，我们可以在需要监控的方法上添加这个注解，来标记这个方法需要对其进行记录日志操作。
```java
@Target({ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
public @interface Log {
/**
* 日志描述信息
*/
String value() default "";
}
```

步骤二：定义切面
在 @Log 所在的目录下，我们定义一个切面类 LogAspect，当在方法上添加了 @Log 注解时，切面就会自动织入。切面中的逻辑依然是在方法之前和方法之后打印一行文本信息。
```
@Aspect
@Component
@Slf4j
public class LogAspect {

    @Pointcut("@annotation(com.example.demo.annotation.Log)")
    private void logPointCut() {
    }

    @Around("logPointCut()")
    public Object around(ProceedingJoinPoint joinPoint) throws Throwable {
        MethodSignature signature = (MethodSignature) joinPoint.getSignature();
        Method method = signature.getMethod();

        Log logAnnotation = method.getAnnotation(Log.class);

        String className = joinPoint.getTarget().getClass().getName();
        String methodName = signature.getName();
        String logDesc = StrUtil.isBlank(logAnnotation.value()) ? "未知方法" : logAnnotation.value();

        log.info("【日志注解】开始执行 -- {}:{} {}", className, methodName, logDesc);
        Object result = joinPoint.proceed();
        log.info("【日志注解】执行结束 -- {}:{} {}", className, methodName, logDesc);

        return result;
    }
}
```

在上面的代码中，我们通过 @Pointcut 与 @Around 注解指定了织入的切点和通知类型，使其织入被注解的方法中。

步骤三：定义Controller类和测试接口
在 Controller 类中，我们在方法上添加了 @Log 注解，将这个方法打上需要记录日志的标签。
```
@RestController
public class DemoController {

    @GetMapping("/demo1")
    @Log("测试一")
    public String demo1() {
        return "demo1";
    }

    @GetMapping("/demo2")
    public String demo2() {
        return "demo2";
    }

}
```

结语
到这里，我们就实现了使用自定义注解 @Log 搭配 AOP 实现记录方法调用日志的功能。在实际项目中，我们可以根据需求自定义不同的注解，比如在身份认证、接口访问控制、定时任务监控等方面，提高日志处理的灵活性和效率