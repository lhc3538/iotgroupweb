package demo; /**
 * Created by lhc35 on 2016/10/19.
 */
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * Created by caohongchen on 2016/3/16.
 * 处理请求的控制器，@Controller注入控制器的注解，spring还有好多注解，大家可以网上搜一下
 */
@Controller("demoController")
public class DemoController {
    //url绑定，DispatcherServlet就是根据这个匹配控制器方法的
    @RequestMapping(value = "/sayHello", method = {RequestMethod.GET})
    public String sayHello(@RequestParam String name, Model model) { //可以将参数直接绑定到这里  @RequestParam
        model.addAttribute("name", name);//加入要返回的数据
        return "hello";//我配置的视图解析器会去匹配hello.jsp
    }
}