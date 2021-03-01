SET NAMES UTF8;
DROP DATABASE IF EXISTS xxqx;
CREATE DATABASE xxqx CHARSET=UTF8;
USE xxqx;


/**商品种类表**/
CREATE TABLE xxqx_laptop_family(
  fid INT PRIMARY KEY AUTO_INCREMENT,
  fname VARCHAR(32)
);

/**商品**/
CREATE TABLE xxqx_laptop(
  lid INT PRIMARY KEY AUTO_INCREMENT,
  family_id INT,              #所属商品类型编号
  title VARCHAR(128),         #主标题
  brand VARCHAR(10),          #商品品牌
  lnumber VARCHAR(32),        #货号
  price DECIMAL(6,2),         #价格
  vipprice DECIMAL(6,2),      #vip价格
  proprice DECIMAL(6,2),      #促销价格
  ship_address VARCHAR(16),   #发货地址
  size VARCHAR(8),            #尺码
  FOREIGN KEY(family_id) REFERENCES xxqx_laptop_family(fid),
);

/**商品图片**/
CREATE TABLE xxqx_laptop_pic(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  laptop_id INT,              #商品编号
  sm VARCHAR(128),            #小图片路径
  md VARCHAR(128),            #中图片路径
  lg VARCHAR(128),            #大图片路径
  FOREIGN KEY(laptop_id) REFERENCES xxqx_laptop(lid)
);

/**用户信息**/  
CREATE TABLE xxqx_user(
  uid INT PRIMARY KEY AUTO_INCREMENT,
  uname VARCHAR(32),          #用户名
  upwd VARCHAR(32),           #密码
  email VARCHAR(64),          #电子邮箱    
  phone VARCHAR(16),          #手机号码
  birthday DATE,              #生日
  avatar VARCHAR(128),        #头像图片路径
  gender INT                  #性别  0-女  1-男  2-保密
);

/**收货地址信息**/
CREATE TABLE xxqx_receiver_address(
  aid INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,                #用户编号
  receiver VARCHAR(16),       #接收人姓名
  province VARCHAR(16),       #省
  city VARCHAR(16),           #市
  county VARCHAR(16),         #县
  landmark_building VARCHAR(16), #标志建筑
  best_time VARCHAR(16),      #最佳送货时间
  address VARCHAR(128),       #详细地址
  cellphone VARCHAR(16),      #手机
  fixedphone VARCHAR(16),     #固定电话
  postcode CHAR(6),           #邮编
  is_default BOOLEAN,         #是否为当前用户的默认收货地址
  FOREIGN KEY(user_id) REFERENCES xxqx_user(uid)
);

/**购物车条目**/
CREATE TABLE xxqx_shoppingcart(
  cid INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,      #用户编号
  laptop_id INT,   #商品编号
  count INT,        #购买数量
  is_checked BOOLEAN, #是否已勾选，确定购买
  FOREIGN KEY(user_id) REFERENCES xxqx_user(uid),
  FOREIGN KEY(laptop_id) REFERENCES xxqx_laptop(lid)
);

/**用户订单**/
CREATE TABLE xxqx_order(
  oid INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,
  address_id INT,
  status INT,             #订单状态  1-等待付款  2-等待发货  3-运输中  4-已签收  5-已取消
  order_time BIGINT,      #下单时间
  pay_time BIGINT,        #付款时间
  deliver_time BIGINT,    #发货时间
  received_time BIGINT,   #签收时间
  FOREIGN KEY(user_id) REFERENCES xxqx_user(uid),
  FOREIGN KEY(address_id) REFERENCES xxqx_receiver_address(aid)
)

/**用户订单**/
CREATE TABLE xxqx_order_detail(
  did INT PRIMARY KEY AUTO_INCREMENT,
  payment_method  VARCHAR(32),     #支付方式
  delivery_mode   VARCHAR(32),     #配送方式
  order_id INT,                    #订单编号
  laptop_id INT,                   #产品编号
  count INT,                       #购买数量
  FOREIGN KEY(order_id) REFERENCES xxqx_order(oid),
  FOREIGN KEY(laptop_id) REFERENCES xxqx_laptop(lid)
);

/****首页轮播广告商品****/
CREATE TABLE xxqx_index_carousel(
  cid INT PRIMARY KEY AUTO_INCREMENT,
  img VARCHAR(128),
  title VARCHAR(64),
  href VARCHAR(128)
);

/****首页商品****/
CREATE TABLE xxqx_index_product(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(64),
  details VARCHAR(128),
  pic VARCHAR(128),
  price DECIMAL(10,2),
  href VARCHAR(128),
  seq_recommended TINYINT,
  seq_new_arrival TINYINT,
  seq_top_sale TINYINT
);

INSERT INTO xxqx_user VALUES(1,'hetingxuan',123456,'he@qq.com',13512345678,'2000-07-29',null,1),
(null,'liyu',123456,'liyu@qq.com',13469403598,'2000-09-09',null,1);

INSERT INTO xxqx_laptop_family VALUES(1,'男鞋');
INSERT INTO xxqx_laptop_family VALUES(2,'女鞋');
INSERT INTO xxqx_laptop_family VALUES(3,'衣服');


INSERT INTO xxqx_laptop VALUES(1,1,'Air Jordan 1 Low AJ1 黑白漆皮 低帮篮球鞋','NIKE','DD1650-001',999,949,null,'浙江台州仓库',41)

