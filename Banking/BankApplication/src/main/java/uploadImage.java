

//import java.io.FileOutputStream;
import java.io.IOException;
//import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.Part;
import com.oreilly.servlet.MultipartRequest;

@MultipartConfig
@WebServlet("/uploadImage")
public class uploadImage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public uploadImage() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		 response.setContentType("text/html");
	       PrintWriter out=response.getWriter();
	       
	       MultipartRequest m = new MultipartRequest(request,"d:/new");
	               out.println("succesfully uploaded");
		
	}

}
