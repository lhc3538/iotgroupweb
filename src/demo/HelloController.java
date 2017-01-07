package demo; /**
 * Created by lhc35 on 2016/10/19.
 */
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
@Controller
@RequestMapping("/")
public class HelloController {
    @RequestMapping(value = "", method = RequestMethod.GET)
    public String welcom() {
        return "view/index";
    }
    //addduck.jsp页面的表单将将数据提交给result,那么就这这个方法来接收了
    //method = RequestMethod.POST对应的是addduck.jsp页面表单的提交方式
    //@RequestParam String name, @RequestParam String color是接收form表单传递过来的参数
    @RequestMapping(value = "/result", method = RequestMethod.POST)
    public String result(ModelMap model, @RequestParam String name, @RequestParam String color){
        //同样放进model中,用于在result.jsp页面获取并显示
        model.addAttribute("name", name);
        model.addAttribute("color", color);
        //返回到result.jsp页面
        return "view/result";
    }

    //下面的注解参数:
    //value = "/addduck",是说浏览器的访问地址这里就是http://localhost:8080/addduck
    //method = RequestMethod.GET是说接收jsp页面访问的方式,通过浏览器直接访问那就是get方式了
    @RequestMapping(value = "/addduck", method = RequestMethod.GET)
    public String addDuck(ModelMap model){
        //实例化一个Duck，这里没有使用spring依赖注入
        Duck duck = new Duck();
        //设置值
        duck.setName("经典小黄鸭");
        duck.setColor("黄色");
        //将duck放进model中用于在jsp页面获取用
        model.addAttribute("duck", duck);
        //返回addduck.jsp页面
        return "view/addduck";
    }
}