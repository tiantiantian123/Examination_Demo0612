package demo.controller;

import demo.dao.StudentDao;
import demo.model.Student;
import demo.service.ClassPaperService;
import demo.service.StudentService;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.jasypt.util.password.StrongPasswordEncryptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletContext;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created at 221
 * 16-5-20 下午4:13.
 */

@Controller
@RequestMapping("/student")
public class StudentController extends BaseController {

    @Autowired
    private StudentDao studentDao;

    @Autowired
    private StudentService studentService;

    @Autowired
    private ClassPaperService classPaperService;

    @RequestMapping("/create")
    private void create(Student student) throws IOException {
        student.setLastIp(request.getRemoteAddr());
        StrongPasswordEncryptor encryptor = new StrongPasswordEncryptor();
        student.setPassword(encryptor.encryptPassword(student.getPassword()));
//        studentDao.create(student);
        studentService.create(student);
        response.sendRedirect("/index.jsp");
    }

    @RequestMapping("/login")
    private String login(Student student) {
        student = studentService.login(request, student);
        if (student != null) {
            session.setAttribute("student", student);
            session.setAttribute("classPapers", classPaperService.list("student_query", null));
            return "redirect:/student/index.jsp";
        } else {
            request.setAttribute("message", "invalid email or password!");
            return "/index";
        }
    }

    @RequestMapping("/update")
    private void update(Student student) {
        DiskFileItemFactory diskFileItemFactory = new DiskFileItemFactory();
        ServletContext servletContext = request.getServletContext(); // // TODO: 16-5-20 check
        File repository = (File) servletContext.getAttribute("javax.servlet.context.tempdir");
        System.out.println("repository: " + repository.getAbsolutePath());
        diskFileItemFactory.setRepository(repository);

        ServletFileUpload servletFileUpload = new ServletFileUpload(diskFileItemFactory);

        try {
            List<FileItem> fileItems = servletFileUpload.parseRequest(request);
            System.out.println("size: " + fileItems.size());
            for (FileItem fileItem : fileItems) {
                if (fileItem.isFormField()) {
                    System.out.println(fileItem.getFieldName() + " : " + fileItem.getString());
                } else {
                    // FILE
                    System.out.println(fileItem.getFieldName());
                    System.out.println(fileItem.getName());
                    System.out.println(fileItem.getContentType());
                    System.out.println(fileItem.isInMemory());
                    System.out.println(fileItem.getSize());

                    File file = new File("d:/" + fileItem.getName());
                    fileItem.write(file);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

//        if (!password.equals(rePassword)) {
//            req.setAttribute("message", "password is not equal to repeat password!");
//            req.getRequestDispatcher("/student/edit_profile.jsp").forward(req, resp);
//            return;
//        }

//        ...
    }

    @RequestMapping("search")
    private String search(String key) {
        session.setAttribute("students", studentService.list("student.search", key));
        return "redirect:/assistant/search_student.jsp";
    }
}
