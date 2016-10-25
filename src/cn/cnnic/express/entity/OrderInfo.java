package cn.cnnic.express.entity;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import cn.cnnic.express.service.DicHelper;


@Entity
@Table(name = "orders")

public class OrderInfo implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@Basic(optional = false)
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", nullable = false)
	private Integer id;
//	国外的订单编号
	@Column(name = "orderId")
	private String orderId;
//	 国内 公司名称
	@Column(name = "com")
	private String com;
//	国内单号
	@Column(name="nu")
	private String nu;
//	 国外的录入时间 国内的 录入时间
	@Column(name = "time")
	private Timestamp time;
//	仓库位置 
	@Column(name = "context")
	private String context;
//	订单状态
	@Column(name = "state")
	private int state;
	@Transient
	private String stateString;
		
//	国内 还是国外的区分标志 1 为国内  2为国外
	@Column(name = "type")
	private int type;
	
//	状态创建时间
	@Column(name = "create_date")
	private Timestamp createDate;
//	接口状态
	@Transient
	private String Status;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public String getCom() {
		return com;
	}
	public void setCom(String com) {
		this.com = com;
	}
	public String getNu() {
		return nu;
	}
	public void setNu(String nu) {
		this.nu = nu;
	}
	public Timestamp getTime() {
		return time;
	}
	public void setTime(Timestamp time) {
		this.time = time;
	}
	public String getContext() {
		return context;
	}
	public void setContext(String context) {
		this.context = context;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public String getStateString() {
		String stateString="";
		if(this.type==1){
			stateString=DicHelper.innerStatus.get(this.state);
		}else{
			stateString=DicHelper.outterStatus.get(this.state);
		}
		return stateString;
	}

	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	
	public Timestamp getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Timestamp createDate) {
		this.createDate = createDate;
	}
	public String getStatus() {
		return Status;
	}
	public void setStatus(String status) {
		Status = status;
	}
}
