create table banners(
    id int not null primary key auto_increment,
    image varchar(512) not null default '' comment '图片地址',
    product_id int not null default '0' comment '关联产品',
    position tinyint not null default '1' comment '排序',
    enabled enum('Y','N') not null default 'Y' comment '是否可用，默认是',
    create_time int not null default '0' comment '创建时间',
    update_time int not null default '0' comment '修改时间'
)engine=innodb default charset='utf8' comment='轮播图';



create table category(
    id int not null primary key auto_increment,
    image varchar(512) not null default '' comment '图片地址',
    name varchar(16) not null default '0' comment '分类名称',
    position tinyint not null default '1' comment '排序',
    enabled enum('Y','N') not null default 'Y' comment '是否可用，默认是',
    create_time int not null default '0' comment '创建时间',
    update_time int not null default '0' comment '修改时间'
)engine=innodb default charset='utf8' comment='分类表';


create table product(
    id int not null primary key auto_increment,
    image varchar(512) not null default '' comment '图片地址',
    category_id int not null default '0' comment '关联产品ID',
    title varchar(255) not null default '' comment '产品标题',
    description varchar(512) not null default '' comment '产品简单介绍',
    price decimal(10,2) not null default '0.00' comment '产品价格',
    origin_price decimal(10,2) not null default '0.00' comment '产品原件格',
    attr varchar(2048) not null default '' comment '产品属性',
    content text not null comment '产品内容',
    enabled enum('Y','N') not null default 'Y' comment '是否可用，默认是',
    create_time int not null default '0' comment '创建时间',
    update_time int not null default '0' comment '修改时间'
)engine=innodb default charset='utf8' comment='产品表';

[
    "attr": {"attr_1":"颜色" , "attr_2" : "尺寸"},
    "attr_1":{"value_1": "白色", "value_2": "红色"},
    "attr_2":{"value_1": "41", "value_2": "42"},
    "group":[
        {
            "attr_1": "白色",
            "attr_2": "42",
            "price": "88.80",
            "stock": 20
        }
    ]
]

create table product_comment(
    id int not null primary key auto_increment,
    product_id int not null default '0' comment '关联产品',
    order_id int not null default '0' comment '关联订单',
    user_id int not null default '0' comment '用户uid',
    content text not null comment '评论内容', // 注意表情
    enabled enum('Y','N') not null default 'Y' comment '是否可用，默认是',
    create_time int not null default '0' comment '创建时间',
    update_time int not null default '0' comment '修改时间'
)engine=innodb default charset='utf8' comment='产品评论表';

create table order(
    id int not null primary key auto_increment,
    user_id int not null default '0' comment '用户uid',
    order_sn varchar(20) not null default '' comment '订单号',
    amount decimal(10,2) not null default '0.00' comment '订单金额',
    trade_no varchar(32) not null default '' comment '交易单号',
    pay_amount decimal(10,2) not null default '0.00' comment '支付金额',
    pay_time int not null default '0' comment '支付时间',
    status tinyint not null default '0' comment '订单状态：0待支付，10已支付，20支付失败，30已发货，40已收货，50完成，60申请退款，70退款中，80已退款，90已关闭',
    enabled enum('Y','N') not null default 'Y' comment '是否可用，默认是',
    create_time int not null default '0' comment '创建时间',
    update_time int not null default '0' comment '修改时间'
)engine=innodb default charset='utf8' comment='轮播图';

create table order_detail(
    id int not null primary key auto_increment,
    image varchar(512) not null default '' comment '图片地址',
    product_id int not null default '0' comment '关联产品',
    position tinyint not null default '1' comment '排序',
    enabled enum('Y','N') not null default 'Y' comment '是否可用，默认是',
    create_time int not null default '0' comment '创建时间',
    update_time int not null default '0' comment '修改时间'
)engine=innodb default charset='utf8' comment='订单详情';

create table order_refund(
    id int not null primary key auto_increment,
    image varchar(512) not null default '' comment '图片地址',
    product_id int not null default '0' comment '关联产品',
    position tinyint not null default '1' comment '排序',
    enabled enum('Y','N') not null default 'Y' comment '是否可用，默认是',
    create_time int not null default '0' comment '创建时间',
    update_time int not null default '0' comment '修改时间'
)engine=innodb default charset='utf8' comment='订单退款';

create table user_address(
    id int not null primary key auto_increment,
    image varchar(512) not null default '' comment '图片地址',
    product_id int not null default '0' comment '关联产品',
    position tinyint not null default '1' comment '排序',
    enabled enum('Y','N') not null default 'Y' comment '是否可用，默认是',
    create_time int not null default '0' comment '创建时间',
    update_time int not null default '0' comment '修改时间'
)engine=innodb default charset='utf8' comment='用户地址';

create table cart(
    id int not null primary key auto_increment,
    image varchar(512) not null default '' comment '图片地址',
    product_id int not null default '0' comment '关联产品',
    position tinyint not null default '1' comment '排序',
    enabled enum('Y','N') not null default 'Y' comment '是否可用，默认是',
    create_time int not null default '0' comment '创建时间',
    update_time int not null default '0' comment '修改时间'
)engine=innodb default charset='utf8' comment='购物车';

create table user(
    id int not null primary key auto_increment,
    image varchar(512) not null default '' comment '图片地址',
    product_id int not null default '0' comment '关联产品',
    position tinyint not null default '1' comment '排序',
    enabled enum('Y','N') not null default 'Y' comment '是否可用，默认是',
    create_time int not null default '0' comment '创建时间',
    update_time int not null default '0' comment '修改时间'
)engine=innodb default charset='utf8' comment='用户表';


create table config(
    id int not null primary key auto_increment,
    image varchar(512) not null default '' comment '图片地址',
    product_id int not null default '0' comment '关联产品',
    position tinyint not null default '1' comment '排序',
    enabled enum('Y','N') not null default 'Y' comment '是否可用，默认是',
    create_time int not null default '0' comment '创建时间',
    update_time int not null default '0' comment '修改时间'
)engine=innodb default charset='utf8' comment='配置表';