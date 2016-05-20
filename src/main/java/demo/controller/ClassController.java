package demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Administrator on 16-5-20.
 */

@Controller
@RequestMapping("/classController")
public class ClassController extends BaseController {

    @RequestMapping("/remove/{id}")
    private void remove(@PathVariable int id) {
        System.out.println("id: " + id);
    }
}
