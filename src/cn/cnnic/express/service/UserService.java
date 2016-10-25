package cn.cnnic.express.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.cnnic.express.dao.EntityDao;
import cn.cnnic.express.entity.User;

@Service
public class UserService {
	@Autowired
	private EntityDao entityDao;

	@Transactional
	public List<Object> getUserList() {
		StringBuffer sff = new StringBuffer();
		sff.append("select a from ").append(User.class.getSimpleName())
				.append(" a ");
		List<Object> list = entityDao.createQuery(sff.toString());
		return list;
	}
	
	@Transactional
	public List<Object> getUserListByName(String name) {
		StringBuffer sff = new StringBuffer();
		sff.append("select a from ").append(User.class.getSimpleName())
				.append(" a where a.user='");
		sff.append(name);
		sff.append("'");
		List<Object> list = entityDao.createQuery(sff.toString());
		return list;
	}
	
	public void save(User st) {
		entityDao.save(st);
	}

	public void delete(Object obj) {
		entityDao.delete(obj);
	}
	
	public List<Object> checkUser(User user) {
		StringBuffer sff = new StringBuffer();
		sff.append("select a from ").append(User.class.getSimpleName())
				.append(" a where a.user='");
		sff.append(user.getUser());
		sff.append("' and a.psw='");
		sff.append(user.getPsw());
		sff.append("'");
		List<Object> list = entityDao.createQuery(sff.toString());
		return list;
	}
	
	public Object getById(User user) {
		StringBuffer sff = new StringBuffer();
		sff.append("select a from ").append(User.class.getSimpleName())
				.append(" a where a.id=");
		sff.append(user.getId());
		List<Object> list = entityDao.createQuery(sff.toString());
		if(list!=null&&list.size()==1){
			return list.get(0);
		}
		return list;
	}
}