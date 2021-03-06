<?php
$route = $_GET['r'];
$data = [];

if (empty($route)) {
    return json_encode(['code'=>200, 'msg'=>'success', 'data' => []]);
}

// 商品列表
if ($route == 'AppShop/GetGoodsList') {

    $map = [
        [
            'form_data' => [
                'description' => '模版',
                'type' => 0,
                'delivery_id' => 0,
                'id' => 3265413,
                'title' => '草莓味酸奶',
                'cover' => 'http://img.weiye.me/zcimgdir/thumb/t_148939466558c65be937c02.png',
                'price' => 999.00,
                'sale_price' => 0.00,
                'category' => [ '0' => '速食冻品'],
                'sales' => 1,
                'is_recommend' => 0,
                'stock' => 999998,
                'weight' => 0,
                'goods_type' => 0,
                'max_can_use_integral' => 0,
                'integral' => -1,
                'mass' => 0.000,
                'volume' => 0.000,
                'express_rule_id' => 0,
                'is_seckill' => 2,
                'seckill_status' => 2,
                'virtual_price' => 0.00,
                'add_time' => 1517474453,
                'update_time' => '2018.02.01',
                'viewed_count' => 0,
                'status' => 0,
                'category_id' => ['0' => 779112],
                'server_time' => 1517751680,
                'is_group_buy' => 0,
            ]
        ],
        [
            'form_data' => [
                'description' => '模版',
                'type' => 0,
                'delivery_id' => 0,
                'id' => 3265412,
                'title' => '鸡脆骨,',
                'cover' => 'http://img.weiye.me/zcimgdir/thumb/t_148939487658c65cbc7b22b.png',
                'price' => 999.00,
                'sale_price' => 0.00,
                'category' => [ '0' => '家禽蛋类'],
                'sales' => 0,
                'is_recommend' => 0,
                'stock' => 999999,
                'weight' => 0,
                'goods_type' => 0,
                'max_can_use_integral' => 0,
                'integral' => -1,
                'mass' => 0.000,
                'volume' => 0.000,
                'express_rule_id' => 0,
                'is_seckill' => 2,
                'seckill_status' => 2,
                'virtual_price' => 0.00,
                'add_time' => 1517474453,
                'update_time' => '2018.02.01',
                'viewed_count' => 0,
                'status' => 0,
                'category_id' => ['0' => 779110],
                'server_time' => 1517751680,
                'is_group_buy' => 0,
            ]
        ],
    ];
    for($i = 0; $i < 20; $i++ ) {
        $data[] = $map[$i%2];
    }
}

// 分类
if ($route == '') {

}

// 详情
if ($route == 'AppShop/getGoods') {
    $data = [
        [
            'form_data' => [
                'description' => '模版',
                'type' => 0,
                'delivery_id' => 0,
                'id' => 3265413,
                'title' => '草莓味酸奶',
                'cover' => 'http://img.weiye.me/zcimgdir/thumb/t_148939466558c65be937c02.png',
                'price' => 999.00,
                'sale_price' => 0.00,
                'category' => [ '0' => '速食冻品'],
                'sales' => 1,
                'is_recommend' => 0,
                'stock' => 999998,
                'weight' => 0,
                'goods_type' => 0,
                'max_can_use_integral' => 0,
                'integral' => -1,
                'mass' => 0.000,
                'volume' => 0.000,
                'express_rule_id' => 0,
                'is_seckill' => 2,
                'seckill_status' => 2,
                'virtual_price' => 0.00,
                'add_time' => 1517474453,
                'update_time' => 1517474453,
                'viewed_count' => 0,
                'category_id' => [ '0' => 779112],
                'model_items' => [
                    [
                        'id' => 2,
                        'img_url' => 'http://img.weiye.me/zcimgdir/thumb/t_148939466558c65be937c02.png',
                        'price' => 33,
                        'stock' => 23,
                        'virtual_price' => 35
                    ],
                    [
                        'id' => 3,
                        'img_url' => 'http://img.weiye.me/zcimgdir/thumb/t_148939466558c65be937c02.png',
                        'price' => 33,
                        'stock' => 23,
                        'virtual_price' => 35
                    ],

                ],
                'express_fee' => '包邮',
                'server_time' => 1517751630,
                'is_group_buy_goods' => 0,
                'model' => [
                    [
                        "name" => "尺寸",
                        "subModelId" => [1,2,3,4],
                        "subModelName" => ["40白色", "41红色", "42蓝绿", "43韭黄"]
                    ]
                ],
                'img_urls' => [
                    "https://img.yzcdn.cn/upload_files/2016/11/25/FpqPXlrMRjKwJs8VdTu3ZDJCj4j5.jpeg?imageView2/2/w/200/h/200/q/90/format/jpeg",
                    "http://img.weiye.me/zcimgdir/thumb/t_148939466558c65be937c02.png"
                ]
            ]
        ]
    ];
}

// 评论
if ($route == 'AppShop/GetAssessList') {
    $map = [
        [
            'buyer_headimgurl' => 'http://cdn.jisuapp.cn/zhichi_frontend/static/webapp/images/default_photo.png',
            'buyer_nickname' => 'default',
            'add_time' => date('Y-m-d H:i'),
            'assess_info' => [
                'content' => '评论内容',
                'has_img' => 1,
                'img_arr' => [
                    "https://img.yzcdn.cn/upload_files/2016/11/25/FpqPXlrMRjKwJs8VdTu3ZDJCj4j5.jpeg?imageView2/2/w/200/h/200/q/90/format/jpeg",
                    "http://img.weiye.me/zcimgdir/thumb/t_148939466558c65be937c02.png"
                ]
            ]
        ],
        [
            'buyer_headimgurl' => 'http://cdn.jisuapp.cn/zhichi_frontend/static/webapp/images/default_photo.png',
            'buyer_nickname' => 'default',
            'add_time' => date('Y-m-d H:i'),
            'assess_info' => [
                'content' => '我是一只小小小鸟，怎么飞也飞不高啊',
                'has_img' => 1,
                'img_arr' => [
                    "https://img.yzcdn.cn/upload_files/2016/11/25/FpqPXlrMRjKwJs8VdTu3ZDJCj4j5.jpeg?imageView2/2/w/200/h/200/q/90/format/jpeg"
                ]
            ]
        ]

    ];

    for($i = 0; $i < 20; $i++ ) {
        $data[] = $map[$i%2];
    }
}

// 订单列表
if ($route == 'AppShop/orderList') {
    $status = isset($_POST['status']) && !is_null($_POST['status'])  ? (int)$_POST['status'] : intval(rand(0, 8));
    $map = [
        [
            'form_data' => [
                'goods_info' => [
                    [
                        'goods_id' => 2,
                        'price' => 999.00,
                        'stock' => 99,
                        'goods_name' => '草莓味酸奶',
                        'module_attr' => '白色42码',
                        'integral' => 99,
                        'cover' => 'http://img.weiye.me/zcimgdir/thumb/t_148939466558c65be937c02.png',
                        'model' => '',
                        'num' => 1,
                    ]
                ],
                'remark' => '快点吧，黄花菜都凉了',
                'original_express_fee' => 0,
                'address_info' => [
                    'name' => '张无忌',
                    'contact' => 13326250250,
                    'detailAddress' => '楼下那家收破烂的',
                    'province' => [
                        'text' => '青海省',
                        'id' => 29
                    ],
                    'city' => [
                        'text' => '玉树藏族自治州',
                        'id' => 352
                    ],
                    'district' => [
                        'text' => '囊谦县',
                        'id' => 3119
                    ],
                    'address_id' => 114603
                ],
                'buyer_info' => [
                    'nickname' => 59620248,
                    'phone' => 15260983827,
                    'message' => ''
                ],
                'original_price' => 999,
                'additional_info' => '',
                'id' => 381471,
                'order_id' => '5a770b8ecc6a5831434837',
                'buyer_id' => '12b25577c5003dd03f793f47646e2923',
                'payment_id' => 0,
                'status' => $status,
                'total_price' => 999.00,
                'add_time' => '2018-02-04 21:33:02',
                'payment_time' => 0,
                'refund_time' => 0,
                'goods_type' => 0,
                'parent_shop_app_id' => 0,
                'is_self_delivery' => 0,
                'is_group_buy_order' => 0,
                'appointment_time' => 0,
                'goods_num' => 1,
            ]
        ],
        [
            'form_data' => [
                'goods_info' => [
                    [
                        'goods_id' => 2,
                        'price' => 999.00,
                        'stock' => 99,
                        'goods_name' => '草莓味酸奶',
                        'module_attr' => '白色43码',
                        'integral' => 99,
                        'cover' => 'http://img.weiye.me/zcimgdir/thumb/t_148939466558c65be937c02.png',
                        'model' => '',
                        'num' => 1,
                    ],
                    [
                        'goods_id' => 3,
                        'price' => 299.00,
                        'stock' => 99,
                        'goods_name' => '草莓味酸奶2',
                        'module_attr' => '红色42码',
                        'integral' => 99,
                        'cover' => 'http://img.weiye.me/zcimgdir/thumb/t_148939466558c65be937c02.png',
                        'model' => '',
                        'num' => 2,
                    ]
                ],
                'remark' => '快点吧，黄花菜都凉了',
                'original_express_fee' => 0,
                'address_info' => [
                    'name' => '张无忌',
                    'contact' => 13326250250,
                    'detailAddress' => '楼下那家收破烂的',
                    'province' => [
                        'text' => '青海省',
                        'id' => 29
                    ],
                    'city' => [
                        'text' => '玉树藏族自治州',
                        'id' => 352
                    ],
                    'district' => [
                        'text' => '囊谦县',
                        'id' => 3119
                    ],
                    'address_id' => 114603
                ],
                'buyer_info' => [
                    'nickname' => 59620248,
                    'phone' => 15260983827,
                    'message' => ''
                ],
                'original_price' => 999,
                'additional_info' => '',
                'id' => 381471,
                'order_id' => '5a770b8ecc6a5831434837',
                'buyer_id' => '12b25577c5003dd03f793f47646e2923',
                'payment_id' => 0,
                'status' => $status,
                'total_price' => 1999.00,
                'add_time' => '2018-02-04 21:33:02',
                'payment_time' => 0,
                'refund_time' => 0,
                'goods_type' => 0,
                'parent_shop_app_id' => 0,
                'is_self_delivery' => 0,
                'is_group_buy_order' => 0,
                'appointment_time' => 0,
                'goods_num' => 1,
            ]
        ]
    ];
    for($i = 0; $i < 20; $i++ ) {
        $data[] = $map[$i%2];
    }
}

// 订单详情
if ($route == 'AppShop/getOrder') {
    $data = [
        'form_data' => [
            'goods_info' => [
                [
                    'goods_id' => 2,
                    'price' => 999.00,
                    'stock' => 99,
                    'goods_name' => '草莓味酸奶',
                    'integral' => 99,
                    'cover' => 'http://img.weiye.me/zcimgdir/thumb/t_148939466558c65be937c02.png',
                    'model' => '',
                    'num' => 1,
                ],
                [
                    'goods_id' => 3,
                    'price' => 699.00,
                    'stock' => 99,
                    'goods_name' => '草莓味酸奶',
                    'integral' => 99,
                    'cover' => 'http://img.weiye.me/zcimgdir/thumb/t_148939466558c65be937c02.png',
                    'model' => '',
                    'num' => 2,
                ]
            ],
            'remark' => '快点吧，黄花菜都凉了',
            'original_express_fee' => 0,
            'express_fee' => 20,
            'address_info' => [
                'name' => '张无忌',
                'contact' => 13326250250,
                'detailAddress' => '楼下那家收破烂的',
                'province' => [
                    'text' => '青海省',
                    'id' => 29
                ],
                'city' => [
                    'text' => '玉树藏族自治州',
                    'id' => 352
                ],
                'district' => [
                    'text' => '囊谦县',
                    'id' => 3119
                ],
                'address_id' => 114603
            ],
            'buyer_info' => [
                'nickname' => 59620248,
                'phone' => 15260983827,
                'message' => ''
            ],
            'discount_cut_price' => 0,
            'integral_used' => 20,
            'original_price' => 999,
            'additional_info' => '',
            'id' => 381471,
            'order_id' => '5a770b8ecc6a5831434837',
            'buyer_id' => '12b25577c5003dd03f793f47646e2923',
            'payment_id' => 0,
            'status' => 0,
            'total_price' => 999.00,
            'add_time' => '2018-02-04 21:33:02',
            'payment_time' => 0,
            'refund_time' => 0,
            'goods_type' => 0,
            'parent_shop_app_id' => 0,
            'is_self_delivery' => 0,
            'is_group_buy_order' => 0,
            'appointment_time' => 0,
            'goods_num' => 1,
            'order_total_price' => 999.00
        ],
    ];
}

// 购物车
if ($route == 'AppShop/cartList') {
    $data = [
        [
            'goods_id' => 3265412,
            'selected' => 1,
            'editSelected' => 0,
            'num' => 1,
            'title' => '鸡脆骨',
            'cover' => 'http://img.weiye.me/zcimgdir/thumb/t_148939487658c65cbc7b22b.png',
            'price' => 999.00,
            'original_price' => 1299.00,
            'sale_price' => 0.00,
            'stock' => 999999,
            'sales' => 0,
            'max_can_use_integral' => 0,
            'goods_type' => 0,
            'mass' => 0.000,
            'volume' => 0.000,
            'express_rule_id' => 0,
            'status' => 0,
            'model_value' => ['白色', '42码'],
            'is_seckill' => 0,
        ]
    ];
}

// 消息
if ($route == 'AppShop/getNotifyMsg') {
    $type = ['1' => '站内消息', '2' => '支付消息', 3=> '表单消息', 4 => '评论消息', 8 => '管理员通知'];
    $data = [
        5 => [
            'data' => [
                [
                    'type' => 1,
                    'content' => json_encode([
                        'title' => '订单状态变更',
                        'description' => '您的订单已经发货',
                        'pic' => 'http://img.weiye.me/zcimgdir/thumb/t_148939466558c65be937c02.png',
                    ]),
                    'add_time' => date('Y-m-d H:i'),
                    'page_url' => ''
                ],
                [
                    'type' => 2,
                    'content' => json_encode([
                        'order_id' => date('YmdHis'),
                        'total_price' => '22.50',
                    ]),
                    'add_time' => date('Y-m-d H:i'),
                    'page_url' => ''
                ],
                [
                    'type' => 3,
                    'sub_id' => 3,
                    'content' => json_encode([
                        'form_name' => 'order',
                        'form_id' => '22',
                        'form' => ''
                    ]),
                    'add_time' => date('Y-m-d H:i'),
                    'page_url' => ''
                ],
                [
                    'type' => 4,
                    'content' => '店长',
                    'add_time' => date('Y-m-d H:i'),
                ],
                [
                    'type' => 8,
                    'content' => '请确认收货',
                    'add_time' => date('Y-m-d H:i'),
                ]
            ],
            'is_more' => 0,
            'current_page' => 1,
            'unread_count' => 3,
        ],
        6 => [
            'data' => [
                [
                    'type' => 4,
                    'content' => '店长说话了',
                    'add_time' => date('Y-m-d H:i'),
                ]
            ],
            'is_more' => 0,
            'current_page' => 1,
            'unread_count' => 3,
        ]
    ];
}

// 搜索列表
if ($route == 'appData/search') {
    $data = [
        [
            'form_data' => [
                'description' => '模版',
                'type' => 0,
                'delivery_id' => 0,
                'id' => 3265412,
                'title' => '鸡脆骨',
                'cover' => 'http://img.weiye.me/zcimgdir/thumb/t_148939487658c65cbc7b22b.png',
                'price' => 999.00,
                'sale_price' => 0.00,
                'category' => ['0' => '家禽蛋类'],
                'sales' => 0,
                'is_recommend' => 0,
                'stock' => 999999,
                'weight' => 0,
                'goods_type' => 0,
                'max_can_use_integral' => 0,
                'integral' => -1,
                'mass' => 0.000,
                'volume' => 0.000,
                'express_rule_id' => 0,
                'is_seckill' => 2,
                'seckill_status' => 2,
                'virtual_price' => 0.00,
                'add_time' => 1517474453,
                'update_time' => '2018.02.01',
                'viewed_count' => 0,
                'category_id' => [ '0' => 779110],
                'server_time' => 1517751753,
                'is_group_buy' => 0,
            ]
        ]
    ];
}

// 地址列表
if ($route == 'AppShop/addressList') {
    $data = [
        [
            'id' => 114603,
            'buyer_id' => '12b25577c5003dd03f793f47646e2923',
            'address_info' => [
                'name' => '张无忌',
                'contact' => 13326250250,
                'detailAddress' => '楼下那家收破烂的',
                'province' => [
                    'text' => '青海省',
                    'id' => 29
                ],
                'city' => [
                    'text' => '玉树藏族自治州',
                    'id' => 352
                ],
                'district' => [
                    'text' => '囊谦县',
                    'id' => 3119
                ]
            ],
            'add_time' => 1517751160,
            'is_default' => 1,
            'telphone' => 13326250250,
            'detail_address' => '',
            'latitude' => '32.20295',
            'longitude' => '96.48063',
        ],
        [
            'id' => 114603,
            'buyer_id' => '12b25577c5003dd03f793f47646e2923',
            'address_info' => [
                'name' => '张无忌',
                'contact' => 13326250250,
                'detailAddress' => '楼下那家收破烂的',
                'province' => [
                    'text' => '青海省',
                    'id' => 29
                ],
                'city' => [
                    'text' => '玉树藏族自治州',
                    'id' => 352
                ],
                'district' => [
                    'text' => '囊谦县',
                    'id' => 3119
                ]
            ],
            'add_time' => 1517751160,
            'is_default' => 0,
            'telphone' => 13326250250,
            'detail_address' => '',
            'latitude' => '32.20295',
            'longitude' => '96.48063',
        ]
    ];
}

// 分类
if ($route == 'AppShop/Category') {
    $data = [
        ['id' => 1, 'name' => '水果'],
        ['id' => 2, 'name' => '肉类'],
        ['id' => 3, 'name' => '保健'],
        ['id' => 4, 'name' => '器械']
    ];
}

// 用户中心 订单状态统计数字
if ($route == 'AppShop/countStatusOrder') {
    ['待付款', '待发货', '待收货', '待评价'];
    $data = [2,0,1,0];
}

// 物流信息
if ($route == 'AppShop/expressFlow') {
    //state  2在途中，3已签收，4问题件
    $data = [
        'state' => (int)rand(2,4),
        'express_name' => '东风快递',
        'express_code' => date('YmdHis'),
        'traces' => [
            [
                'accept_station' => '派件中',
                'accept_time'    => date('Y-m-d H:i:s')
            ],
            [
                'accept_station' => '快递已抵达福州台江',
                'accept_time'    => date('Y-m-d H:i:s')
            ],
            [
                'accept_station' => '快递由广州发出，下一站福州',
                'accept_time'    => date('Y-m-d H:i:s')
            ],
            [
                'accept_station' => '快递抵达广州市',
                'accept_time'    => date('Y-m-d H:i:s')
            ],
            [
                'accept_station' => '卖家已发货，快递员揽货',
                'accept_time'    => date('Y-m-d H:i:s')
            ]
        ]

    ];
}

// 积分
if ($route == 'AppShop/GetIntegralInfo') {
    $data = [
        'can_use_integral' => 30,
        'total_integral' => 100,
        'convert_num' => 100,
        'consume_num' => 1,
        'login_num' => 0,
        'post_comment_num' => 0,
        'share_num'   => 0,
    ];
}
// 积分规则
if ($route == 'AppShop/UserIntegralAction') {
    $action = isset($_GET['action']) ? $_GET['action'] : 'income';

    $data = [
        [
            'content' => '消费180元，获得80积分',
            'time' => date('Y-m-d H:i'),
            'num' => 80
        ],
        [
            'content' => '订单20183823232运费8元，积分抵扣5元',
            'time' => date('Y-m-d H:i'),
            'num' => -50
        ],
        [
            'content' => '消费180元，获得80积分',
            'time' => date('Y-m-d H:i'),
            'num' => 80
        ],
        [
            'content' => '订单20183823232运费8元，积分抵扣5元',
            'time' => date('Y-m-d H:i'),
            'num' => -50
        ]
    ];

    if ($action == 'income') {
        $data = [
            $data[0], $data[2]
        ] ;
    } else {
        $data = [
            $data[1], $data[3]
        ] ;
    }
}

// 预支付
if ($route == 'AppShop/calculationPrice') {
    $data = [
        'goods_info' => [],
        'express_fee' => 30,
        'original_price' => 999,
        'price' => 999,
        'address' => [
            'id' => 114603,
            'address_info' => [
                'name' => '张无忌',
                'contact' => 13832432432,
                'province' => '福建省',
                'city' => '福州市',
                'area' => '台江区',
                'address' => '宝龙城市广场',
            ]
        ]
    ];
}

if ($route == 'AppShop/GetAddressById') {
    $data = [
        'address_info' => [
            'name' => '张三丰',
            'contact' => '15260983827',
            'province' => '福建省',
            'city' => '泉州市',
            'district' => '丰泽区',
            'detailAddress' => '需大道88号',
            'sex' => 1
        ]
    ];
}

// 店铺信息
if ($route == 'AppShop/getAppShopLocationInfo') {
    $data = [
        'is_self_delivery' => 1,
        'shop_location' => '福建省福州市台江区宝龙城市广场38号楼',
        'shop_contact' => '15323243242',
        'open_time' => '08:00',
        'close_time' => '22:00'
    ];
}

echo json_encode(['status'=> 0, 'msg'=>'success', 'data' => $data, 'num' => [count($data), 1, 2, 3, 4],  'is_more' => 1, 'current_page' => 1, 'count' => 100, 'total_page' => 5]);
