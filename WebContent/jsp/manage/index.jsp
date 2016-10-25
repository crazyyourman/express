<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
 <head>
  <title>后台管理系统-全球快线</title>
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
   <link href="jsp/manage/assets/css/dpl-min.css" rel="stylesheet" type="text/css" />
  <link href="jsp/manage/assets/css/bui-min.css" rel="stylesheet" type="text/css" />
   <link href="jsp/manage/assets/css/main-min.css" rel="stylesheet" type="text/css" />
 </head>
 <body>

  <div class="header">
    
      <div class="dl-title">
       <img src="jsp/front/images/logo.png">
      </div>

    <div class="dl-log">欢迎您，<span class="dl-log-user">${user.user }</span><a href="manage" title="退出系统" class="dl-log-quit">[退出]</a>
    </div>
  </div>
   <div class="content">
    <div class="dl-main-nav">
      <ul id="J_Nav"  class="nav-list ks-clear">
        		<li class="nav-item dl-selected"><div class="nav-item-inner nav-home">订单管理</div></li>
        		<li class="nav-item dl-selected"><div class="nav-item-inner nav-order">用户管理</div></li> 
        		<li class="nav-item dl-selected"><div class="nav-item-inner nav-order">新闻管理</div></li>       
      </ul>
    </div>
    <ul id="J_NavContent" class="dl-tab-conten">

    </ul>
   </div>
  <script type="text/javascript" src="jsp/manage/assets/js/jquery-1.8.1.min.js"></script>
  <script type="text/javascript" src="jsp/manage/assets/js/bui-min.js"></script>
  <script type="text/javascript" src="jsp/manage/assets/js/common/main-min.js"></script>
  <script type="text/javascript" src="jsp/manage/assets/js/config-min.js"></script>
  <script>
    BUI.use('common/main',function(){
      var config = [
                    {id:'1',menu:[
                            {text:'订单管理',items:[
                            {id:'2',text:'订单列表',href:'order?orderList'},{id:'3',text:'绑定国内订单',href:'order?toBinding'}]}]
                    },
                    {id:'4', menu:[
                            {text:'用户管理',items:[
                          	{id:'5',text:'管理员列表',href:'manage?userList'},{id:'6',text:'修改密码',href:'manage?toEditManagePassword'}]
                            }]},
                    {id:'7',menu:[
                            {text:'询问管理',items:[
                            {id:'8',text:'添加公告',href:'news'}]
                            }]}
                    ];
      new PageUtil.MainPage({
        modulesConfig : config
      });
    });
  </script>
 </body>
</html>