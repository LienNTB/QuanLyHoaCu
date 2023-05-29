package servlets;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class CSPFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Khởi tạo Filter.
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
    	
    	HttpServletResponse httpResponse = (HttpServletResponse) response;
        httpResponse.setHeader("Content-Security-Policy", "default-src 'none'"
        		+ " style-src 'self' https://cdnjs.cloudflare.com;"
        		+ " style-src-elem 'self' https://cdnjs.cloudflare.com;"
        		+ " img-src 'self' https://bucket.nhanh.vn/store/15668/ps/;"
        		+ " blob:;"
        		+ " connect-src 'self' "
        		+ " form-action 'self';"
        		+ " base-uri 'self';"
        		+ " frame-ancestors 'none';"
        		+ " script-src 'self';"
        		+ " frame-src 'none';"
        		+ " font-src 'self' https://fonts.googleapis.com https://cdnjs.cloudflare.com "
        		+ " media-src 'none'; object-src 'none';"
        		+ " manifest-src 'self';"
        		+ " worker-src 'self';"
        		+ " prefetch-src 'self'");
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
        // Hủy bỏ Filter.
    }
}