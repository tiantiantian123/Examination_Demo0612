package demo.util;

import freemarker.template.Template;
import freemarker.template.TemplateException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfig;

import java.io.FileWriter;
import java.io.IOException;
import java.io.Writer;
import java.util.HashMap;
import java.util.Map;

/**
 * Created at 221
 * 16-5-25 上午10:07.
 */
public class ComponentsGenerator {

    public static void main(String[] args) throws IOException, TemplateException {
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
        FreeMarkerConfig freeMarkerConfig = (FreeMarkerConfig) applicationContext.getBean("freemarkerConfig");

        Template template = freeMarkerConfig.getConfiguration().getTemplate("hello.ftl"); // 1. template
        Map<String, String> map = new HashMap<>(); // 2. Java Object
        map.put("name", "张三");
        Writer writer = new FileWriter("d:/hello.html"); // 3. Output

        template.process(map, writer); // Freemarker Processing...
    }
}
