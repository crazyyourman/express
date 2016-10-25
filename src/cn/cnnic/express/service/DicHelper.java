package cn.cnnic.express.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.context.ApplicationContext;

import cn.cnnic.express.entity.OrderStatus;

public class DicHelper {
	
	private final static Logger logger = Logger.getLogger(DicHelper.class);
	
	public static Map<Integer,String> innerStatus=null;
	public static Map<Integer,String> outterStatus=null;
	
	private static ApplicationContext ac ;
	public static ApplicationContext getAc() {
		return ac;
	}
	public static void setAc(ApplicationContext ac) {
		DicHelper.ac = ac;
	}
	private static  OrderService orderService;  
	
	public static void init(){
		if(ac==null){
			logger.error("初始化字典数据失败！"); 
			return ;
		}
		//获取字典Service	
		orderService = (OrderService)ac.getBean("orderService",OrderService.class);
		initStatusList();
	}
	
	public static Map<Integer,String> getInnerStatus(){
		if(innerStatus==null)
			initStatusList();
			return innerStatus;
	}
	
	public static void initStatusList() {
		try {
			List<Object> inner = orderService.getOrderStatusList(1);
			innerStatus=new HashMap<Integer,String>();
			for(Object obj:inner){
				OrderStatus status=(OrderStatus)obj;
				innerStatus.put(status.getNu(), status.getName());
			}
			List<Object> outter = orderService.getOrderStatusList(2);
			outterStatus=new HashMap<Integer,String>();
			for(Object obj:outter){
				OrderStatus status=(OrderStatus)obj;
				outterStatus.put(status.getNu(), status.getName());
			}
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("初始化性别数据失败！",e); 
		}
	}
	
}
