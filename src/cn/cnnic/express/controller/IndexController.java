package cn.cnnic.express.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cn.cnnic.express.service.OrderService;

/**
 *
 */
@Controller  
@RequestMapping("/index.do")   
public class IndexController { 
	private Logger log=Logger.getLogger(IndexController.class);
//    @Autowired  
//    private StudentService studentService;   
    public IndexController(){   
           
    }   
    @Autowired  
    private OrderService orderService;  
    
    @RequestMapping  
    public String load(ModelMap modelMap){   
    	log.debug("index-load");
        return "front/index";   
    }   
  
    /**
     * 订单列表
     * @param modelMap
     * @return
     */
    @RequestMapping(params = "orderListByOrderId")  
    public String userListByOrderId(@RequestParam("orderId") String orderId,ModelMap modelMap){  
    	List<Object> orderList=null;
    	if(orderId!=null&&!"".equalsIgnoreCase(orderId.trim())){
    		orderList =orderService.getOrderListbyOrderId(orderId);
    	}
    	 modelMap.put("list", orderList); 
    	 modelMap.put("orderId", orderId);  
    	return "front/index"; 
    }
    
}  
