package cn.cnnic.express.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cn.cnnic.express.entity.User;
import cn.cnnic.express.service.UserService;

/**
 * 用户管理
 * 后台的登录
 * 包括管理员的CURD
 * 
 */
@Controller  
@RequestMapping("/manage")   
public class ManageController { 

  private Logger log=Logger.getLogger(ManageController.class);
  
  @Autowired  
  private UserService userService;   
    
    public ManageController(){   
           
    }   
    /**
     *  to Login
     * @param modelMap
     * @return
     */
    @RequestMapping  
    public String login(ModelMap modelMap){   
        return "manage/Public/login";   
    }   
    /**
     * 登录验证
     * @param request
     * @param modelMap
     * @return
     */
    @RequestMapping(params = "login")  
    public String checkUser(HttpSession session,HttpServletRequest request,ModelMap modelMap){   
    	 String username = request.getParameter("username");   
         String psw = request.getParameter("password");   
         User user = new User();   
         user.setUser(username);   
         user.setPsw(psw);   
         List<Object> userList=userService.checkUser(user); 
        if(userList!=null&&userList.size()!=1){
        	modelMap.put("error", "用户名和密码不对");
        	return "manage/Public/login";
        }
        modelMap.put("user", userList.get(0));
        session.setAttribute("loginUser", userList.get(0));
        return "manage/index";   
    }  
   
    /**
     * 管理员列表
     * @param modelMap
     * @return
     */
    @RequestMapping(params = "userList")  
    public String userList(ModelMap modelMap){  
    	 List<Object> userList =userService.getUserList();
    	 modelMap.put("list", userList);   
    	return "manage/User/index"; 
    }
    
    /**
     * 管理员列表
     * @param modelMap
     * @return
     */
    @RequestMapping(params = "userListByName")  
    public String userListByName(@RequestParam("name") String name,ModelMap modelMap){  
    	List<Object> userList=null;
    	if(name!=null&&!"".equalsIgnoreCase(name.trim())){
    		userList =userService.getUserListByName(name);
    	}else{
    		userList =userService.getUserList();
    	}
    	 modelMap.put("list", userList);  
    	 modelMap.put("name", name);
    	return "manage/User/index"; 
    }
    
    @RequestMapping(params = "toaddManage")  
    public String toAddPage(){
    	return "manage/User/add";
    }
    /**
     * 增加管理员
     * @param request
     * @param modelMap
     * @return
     */
    @RequestMapping(params = "addManage")  
    public String addManage(HttpServletRequest request,ModelMap modelMap){
    	String username = request.getParameter("username");
    	String password=request.getParameter("password");
    	User user=new User();
    	user.setUser(username);
    	user.setPsw(password);
    	userService.save(user);
    	return "redirect:manage?userList";    
    }   
    
    /**
     * 删除管理员
     * @param request
     * @param modelMap
     * @return
     */
    @RequestMapping(params = "deleteManage")  
    public void deleteManage(@RequestParam("id") String id, HttpServletResponse response){   
        try{   
        	User user=new User();
        	user.setId(Integer.valueOf(id));   
        	userService.delete(user);   
            response.getWriter().print("{\"del\":\"true\"}");   
        }   
        catch(Exception e){   
            log.error(e.getMessage());   
            e.printStackTrace();   
        }   
//        return "redirect:manage?userList";    
    }   
    
    /**
     * 跳转修改管理员
     * @param request
     * @param modelMap
     * @return
     */
    @RequestMapping(params = "toEditManage")  
    public String toEditManagePage(@RequestParam("id") String id,ModelMap modelMap){   
        	User user=new User();
        	user.setId(Integer.valueOf(id));   
        	Object model_user=userService.getById(user);
        	modelMap.put("model_user", model_user);
        return "manage/User/edit";    
    }   
    
    /**
     * 修改管理员
     * @param request
     * @param modelMap
     * @return
     */
    @RequestMapping(params = "editManage")  
    public String editManage(@RequestParam("id") String id,@RequestParam("username") String username,ModelMap modelMap){   
        	User user=new User();
        	user.setId(Integer.valueOf(id)); 
        	User modelUser=(User)userService.getById(user);
        	modelUser.setUser(username);
        	modelMap.put("model_user", modelUser);
        	userService.save(modelUser);
        return "redirect:manage?userList";    
    }
    
    /**
     * 跳转修改密码
     * @param request
     * @param modelMap
     * @return
     */
    @RequestMapping(params = "toEditManagePassword")  
    public String toEditManagePasswordPage(HttpSession session,ModelMap modelMap){   
        	User user = (User)session.getAttribute("loginUser");
        	if(user!=null){
        		Object model_user=userService.getById(user);
        		modelMap.put("model_user", model_user);
        	}
        return "manage/User/changePassword";    
    }
    
    /**
     * 修改管理员密码
     * @param request
     * @param modelMap
     * @return
     */
    @RequestMapping(params = "editManagePassword")  
    public String editManagePassword(@RequestParam("id") String id,@RequestParam("passwordOld") String passwordOld,
    		@RequestParam("passwordNew1") String passwordNew1,@RequestParam("passwordNew2") String passwordNew2,ModelMap modelMap){   
        	User user=new User();
        	user.setId(Integer.valueOf(id)); 
        	User modelUser=(User)userService.getById(user);
        	if(!passwordOld.equalsIgnoreCase(modelUser.getPsw())){
        		modelMap.put("model_user", modelUser);
        		modelMap.put("errorMessage", "原始密码不一致!");
        		return "manage/User/changePassword";   
        	}
        	if(!passwordNew1.equalsIgnoreCase(passwordNew2)){
        		modelMap.put("model_user", modelUser);
        		modelMap.put("errorMessage", "两次密码不一致!");
        		return "manage/User/changePassword"; 
        	}
        	modelUser.setPsw(passwordNew1);
        	modelMap.put("model_user", modelUser);
        	userService.save(modelUser);
        return "redirect:manage?userList";    
    }
}  
