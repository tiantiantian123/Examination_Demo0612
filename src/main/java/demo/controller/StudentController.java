package demo.controller;

import demo.model.Student;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.jasypt.util.password.StrongPasswordEncryptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
@RequestMapping("/studentController")
public class StudentController extends BaseController {

    @Autowired // 自动装配
    private SqlSessionFactory sqlSessionFactory;

    @RequestMapping("/create")
    private void create(Student student) throws IOException {
        student.setLastIp(request.getRemoteAddr());
        StrongPasswordEncryptor encryptor = new StrongPasswordEncryptor();
        student.setPassword(encryptor.encryptPassword(student.getPassword()));
        SqlSession sqlSession = sqlSessionFactory.openSession(true);
        sqlSession.insert("student.create", student);
        response.sendRedirect("/index.jsp");
    }

    @RequestMapping("/login")
    private void login(Student student) throws IOException, ServletException {
        String password = student.getPassword();
        try (SqlSession sqlSession = sqlSessionFactory.openSession(false)) {
            List<Student> students = sqlSession.selectList("student.login", student.getEmail());
            if (students.size() == 1) {
                student = students.get(0);
                String encryptedPassword = student.getPassword();
                StrongPasswordEncryptor encryptor = new StrongPasswordEncryptor();
                if (encryptor.checkPassword(password, encryptedPassword)) {

                    String lastIp = request.getRemoteAddr();
                    SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                    String lastLogin = simpleDateFormat.format(new Date());

                    // update student last_ip, last_login time
                    student.setLastIp(lastIp);
                    student.setLastLogin(lastLogin);
                    sqlSession.update("student.last", student);
                    sqlSession.commit();

                    student.setPassword(null);
                    request.getSession().setAttribute("student", student);
                    response.sendRedirect("/student/index.jsp");
                    return;
                }
            }
        }
        request.setAttribute("message", "invalid email or password!");
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }

    @RequestMapping("/update")
    private void update(Student student) {
        DiskFileItemFactory diskFileItemFactory = new DiskFileItemFactory();
        ServletContext servletContext  = request.getServletContext(); // // TODO: 16-5-20 check
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
}
