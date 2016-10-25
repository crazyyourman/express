package cn.cnnic.express.controller;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cn.cnnic.express.entity.OrderInfo;
import cn.cnnic.express.service.DicHelper;
import cn.cnnic.express.service.Kuaidi100Api;
import cn.cnnic.express.service.OrderService;
import cn.cnnic.express.service.UserService;

/**
 * 订单管理
 * 国外订单信息填写
 * 国内订单信息抽取
 * 
 */
@Controller  
@RequestMapping("/order")   
public class OrderController { 

  private Logger log=Logger.getLogger(OrderController.class);
  
  @Autowired  
  private OrderService orderService;   
    
  @Autowired  
  private UserService userService;   
  
    public OrderController(){   
           
    }   
   
    /**
     * 订单列表
     * @param modelMap
     * @return
     */
    @RequestMapping(params = "orderList")  
    public String userList(ModelMap modelMap){  
    	 List<Object> orderList =orderService.getOrderList();
    	 modelMap.put("list", orderList);   
    	return "manage/Order/index"; 
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
    	}else{
    		orderList =orderService.getOrderList();
    	}
    	 modelMap.put("list", orderList); 
    	 modelMap.put("orderId", orderId);  
    	return "manage/Order/index"; 
    }
    
    @RequestMapping(params = "toaddOrder")  
    public String toAddPage(ModelMap modelMap){
    	modelMap.put("statuss", DicHelper.outterStatus);
    	return "manage/Order/add";
    }
    /**
     * 增加国外订单
     * @param request
     * @param modelMap
     * @return
     */
    @RequestMapping(params = "addOrder")  
    public String addOrder(HttpServletRequest request,ModelMap modelMap,@RequestParam("orderId") String orderId,@RequestParam("time") String time
    		,@RequestParam("state") String state,@RequestParam("context") String context,@RequestParam("nu") String nu){
    	OrderInfo order =new OrderInfo();
    	order.setOrderId(orderId);
    	order.setContext(context);
    	order.setNu(nu);
    	order.setState(Integer.parseInt(state));
    	SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
    	try {
			order.setTime(new Timestamp(format.parse(time).getTime()));
		} catch (ParseException e) {
			e.printStackTrace();
		}
    	order.setCreateDate(new Timestamp(System.currentTimeMillis()));
//    	国外
    	order.setType(2);
    	
    	orderService.save(order);
    	return "redirect:order?orderList";    
    }   
    
    /**
     * 删除订单
     * @param request
     * @param modelMap
     * @return
     */
    @RequestMapping(params = "deleteOrder")  
    public void deleteOrder(@RequestParam("id") String id, HttpServletResponse response){   
        try{   
        	OrderInfo order=new OrderInfo();
        	order.setId(Integer.valueOf(id));   
        	orderService.delete(order);   
            response.getWriter().print("{\"del\":\"true\"}");   
        }   
        catch(Exception e){   
            log.error(e.getMessage());   
            e.printStackTrace();   
        }   
//        return "redirect:manage?userList";    
    }   
    
    /**
     * 跳转修改订单
     * @param request
     * @param modelMap
     * @return
     */
    @RequestMapping(params = "toEditOrder")  
    public String toEditOrderPage(@RequestParam("id") String id,ModelMap modelMap){   
        	OrderInfo order=new OrderInfo();
        	order.setId(Integer.valueOf(id));   
        	Object modelOrder=orderService.getById(order);
        	modelMap.put("modelOrder", modelOrder);
        	modelMap.put("statuss", DicHelper.outterStatus);
        return "manage/Order/edit";    
    }   
    
    /**
     * 修改订单
     * @param request
     * @param modelMap
     * @return
     */
    @RequestMapping(params = "editOrder")  
    public String editOrder(HttpServletRequest request,ModelMap modelMap,@RequestParam("id") String id,@RequestParam("orderId") String orderId,@RequestParam("time") String time
    		,@RequestParam("state") String state,@RequestParam("context") String context,@RequestParam("nu") String nu){
	    	OrderInfo order=new OrderInfo();
	    	order.setId(Integer.valueOf(id));   
	    	OrderInfo modelOrder=(OrderInfo)orderService.getById(order);
	    	
	    	modelOrder.setContext(context);
	    	modelOrder.setNu(nu);
	    	modelOrder.setState(Integer.parseInt(state));
	    	SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
	    	try {
	    		modelOrder.setTime(new Timestamp(format.parse(time).getTime()));
			} catch (ParseException e) {
				e.printStackTrace();
			}
	    	
        	modelMap.put("modelOrder", modelOrder);
        	orderService.save(modelOrder);
        return "redirect:order?orderList";    
    }
    
    /**
     * 查询国内订单状态
     * @param request
     * @param modelMap
     * @return
     */
    @RequestMapping(params = "toInnerOrder")  
    public String toEditInnerOrderPage(@RequestParam("nu") String nu,ModelMap modelMap){   
    	OrderInfo order=new OrderInfo();
    	order.setNu(nu);
        List<Object> list=orderService.getByNu(order);
        modelMap.put("orderList", list);
        return "manage/Order/indexInner";    
    }
    
    @RequestMapping(params = "toBinding")  
    public String toBinding(ModelMap modelMap){   
        return "manage/Order/binding";    
    }
    
    @RequestMapping(params = "binding")  
    public String binding(@RequestParam("OrderId") String OrderId,
    		@RequestParam("com") String com,@RequestParam("nu") String nu,ModelMap modelMap){   
    	 List<OrderInfo> orders=Kuaidi100Api.getInnerInfos(com, nu);
    	 String message="绑定成功";
    	if(orders!=null&&orders.size()>0){
    		if("0".equalsIgnoreCase(orders.get(0).getStatus())||"2".equalsIgnoreCase(orders.get(0).getStatus())){
    			message="物流单暂无结果";
    		}
    		for(OrderInfo order:orders){
    			orderService.save(order);
    		}
    	}else{
    		message="绑定失败";
    	}
    	
        modelMap.put("OrderId", OrderId);
        modelMap.put("com", com);
        modelMap.put("nu", nu);
        modelMap.put("message", message);
        
        return "manage/Order/binding";    
    }
}  
