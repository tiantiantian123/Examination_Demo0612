package demo.util;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created at 221
 * 16-6-3 上午9:11.
 */
@WebFilter(urlPatterns = "/*")
public class RoleFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest httpServletRequest = (HttpServletRequest) request;
        HttpServletResponse httpServletResponse = (HttpServletResponse) response;

        String uri = httpServletRequest.getRequestURI();
//        System.out.println(uri);
        if (uri.substring(1,2).equals("admin")) {
            httpServletResponse.sendRedirect("");
        }


        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {

    }
}
