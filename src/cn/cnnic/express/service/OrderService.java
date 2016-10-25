package cn.cnnic.express.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.cnnic.express.dao.EntityDao;
import cn.cnnic.express.entity.OrderInfo;
import cn.cnnic.express.entity.OrderStatus;

@Service
public class OrderService {
	@Autowired
	private EntityDao entityDao;

	@Transactional
	public List<Object> getOrderStatusList(int type) {
		StringBuffer sff = new StringBuffer();
		sff.append("select a from ").append(OrderStatus.class.getSimpleName())
				.append(" a where a.type="+type +" order by nu");
		List<Object> list = entityDao.createQuery(sff.toString());
		return list;
	}
	
	
	@Transactional
	public List<Object> getOrderList() {
		StringBuffer sff = new StringBuffer();
		sff.append("select a from ").append(OrderInfo.class.getSimpleName())
				.append(" a order by a.orderId,a.type,a.time");
		List<Object> list = entityDao.createQuery(sff.toString());
		return list;
	}
	@Transactional
	public List<Object> getOrderListbyOrderId(String orderId) {
		StringBuffer sff = new StringBuffer();
		sff.append("select a from ").append(OrderInfo.class.getSimpleName())
				.append(" a where orderId='"+orderId+"' order by a.orderId,a.type,a.time");
		List<Object> list = entityDao.createQuery(sff.toString());
		return list;
	}
	public void save(OrderInfo st) {
		entityDao.save(st);
	}

	public void delete(OrderInfo obj) {
		entityDao.delete(obj);
	}
	
	public Object getById(OrderInfo order) {
		StringBuffer sff = new StringBuffer();
		sff.append("select a from ").append(OrderInfo.class.getSimpleName())
				.append(" a where a.id=");
		sff.append(order.getId());
		List<Object> list = entityDao.createQuery(sff.toString());
		if(list!=null&&list.size()==1){
			return list.get(0);
		}
		return list;
	}
	
	public List<Object> getByNu(OrderInfo order) {
		StringBuffer sff = new StringBuffer();
		sff.append("select a from ").append(OrderInfo.class.getSimpleName()).append(" a where a.nu='");
		sff.append(order.getNu());
		sff.append("' order by a.time ");
		List<Object> list = entityDao.createQuery(sff.toString());
		return list;
	}
}