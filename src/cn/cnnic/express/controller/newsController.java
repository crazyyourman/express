package cn.cnnic.express.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import com.baidu.ueditor.upload.Uploader;

/**
 * api 参考位置：
 *http://ueditor.baidu.com/doc/
 *
 */
@Controller  
@RequestMapping("/news")   
public class newsController { 
	private Logger log=Logger.getLogger(newsController.class);
//    @Autowired  
//    private StudentService studentService;   
    public newsController(){   
           
    }   
//    @Autowired  
//    private OrderService orderService;  
    
    @RequestMapping  
    public String load(ModelMap modelMap){   
    	log.debug("new-laod");
        return "ueditor/index";   
    }   

    @RequestMapping(params = "toAddNews") 
    public String toAddNews(ModelMap modelMap){   
    	log.debug("new-laod");
        return "ueditor/addNews";   
    }   
}  
