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
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * Created at 221
 * 16-5-25 上午10:07.
 */
public class ComponentsGenerator {

    public static void main(String[] args) throws IOException, TemplateException {
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
        FreeMarkerConfig freeMarkerConfig = (FreeMarkerConfig) applicationContext.getBean("freemarkerConfig");

        Template template = freeMarkerConfig.getConfiguration().getTemplate("type/model.ftl"); // 1. template
        Map<String, Object> map = new HashMap<>(); // 2. Java Object
        map.put("model", "Admin"); // Admin
        Map<String, String> properties = new LinkedHashMap<>();
        properties.put("username", "String"); // String username, String password, int age
        properties.put("password", "String");
        properties.put("age", "int");
        map.put("properties", properties);
        Writer writer = new FileWriter("d:/Admin.java"); // 3. Output

        template.process(map, writer); // Freemarker Processing...
    }
}
