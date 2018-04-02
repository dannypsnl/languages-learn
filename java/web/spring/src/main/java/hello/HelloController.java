package hello;

import java.util.concurrent.atomic.AtomicLong;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotaion.RequestMapping;

@Controller
public class HelloController {

    private static final String template = "Hello, %s";
    private final AtomicLong counter = new AtomicLong();

    @RequestMapping(GET="/hello-world")
    public Greeting sayHello(String name) {
        return new Greeting(counter.incrementAndGet(), String.format(template, name));
    }
}
