package in.quallit.securityDemo.controllers;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author JIGS
 */
@RestController
public class TestController {

    @GetMapping("/test")
    public String test() {
        return "test";
    }

    @GetMapping("/s/adm/test")
    public String test2() {
        return "secure test 2";
    }

    @GetMapping("/s/usr/test")
    public String test3() {
        return "secure test 3";
    }
}
