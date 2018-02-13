<?php
/**
 * Created by PhpStorm.
 * User: cqingt
 * Date: 2018/2/11
 * Time: 17:09
 */

namespace app\api\controller;

use app\common\model\Banner;
use app\common\model\Category;
use app\common\model\Product;

class App extends BaseController
{
    // 分页，每页数量
    protected $_rows = 12;

    // 轮播图
    public function getBanners()
    {
        $banners = (new Banner())->getAll();

        foreach ($banners as &$banner) {
            $banner['pic'] = $banner['image'];
            $banner['goods_id'] = $banner['product_id'];
            $banner['eventHandler'] = 'tapGoodsTradeHandler'; // 固定
            unset($banner['id'], $banner['image'], $banner['product_id']);
        }

        return ['code' => '200', 'msg' => 'success', 'data' => $banners];
    }

    // 商品列表
    public function getGoodsList()
    {
        $categoryId = input('category_id', 0);
        $page = input('page', 1);
        $offset = ($page - 1) * $this->_rows;
        $product = new Product();

        // 分类
        if ($categoryId) {
            $products = $product->getProducts($categoryId, $offset, $this->_rows);
            $total = $product->getProductCount($categoryId);
        } else {

            // 首页推荐
            $products = $product->getRecommend($offset, $this->_rows);
            $total = $product->getRecommendCount();
        }

        foreach ($products as &$product) {
            $product['title'] = $product['name'];
            $product['cover'] = $product['image'];
            $product['sales'] = $product['sales'] ?: $product['fade_sales']; // 销量
            $product['sale_price'] = $product['origin_price'];
            $product['category'] = [];
            $product['category_id'] = [];
            $product['is_recommend'] = $categoryId;
            $product['virtual_price'] = $product['origin_price'];
            $product['status'] = 0;
            unset($product['name'], $product['image'], $product['fade_sales']);
        }

        $totalPage = ceil($total / $this->_rows);
        $isMore = count($products) == $this->_rows ? 1 : 0;

        return [
            'code' => '200',
            'msg' => 'success',
            'data' => $products,
            'is_more' => $isMore,
            'current_page' => $page,
            'count' => $total,
            'total_page' => $totalPage
        ];
    }

    public function getGoods()
    {
        $data = [
            'description' => '商品详情',
            'id' => 3265413,
            'title' => '草莓味酸奶',
            'cover' => 'http://img.weiye.me/zcimgdir/thumb/t_148939466558c65be937c02.png',
            'price' => 999.00,
            'sale_price' => 0.00,
            'category' => ['速食冻品'],
            'sales' => 1,
            'is_recommend' => 0,
            'stock' => 999998,
            'virtual_price' => 0.00,
            'category_id' => [779112],
            'model_items' => [
                [
                    'id' => 1,
                    'model' => '40白色',
                    'img_url' => 'http://img.weiye.me/zcimgdir/thumb/t_148939466558c65be937c02.png',
                    'price' => 133,
                    'stock' => 23,
                    'virtual_price' => 33
                ],
                [
                    'id' => 2,
                    'model' => '41红色',
                    'img_url' => 'http://img.weiye.me/zcimgdir/thumb/t_148939466558c65be937c02.png',
                    'price' => 233,
                    'stock' => 23,
                    'virtual_price' => 25
                ],
                [
                    'id' => 3,
                    'model' => '42蓝绿',
                    'img_url' => 'http://img.weiye.me/zcimgdir/thumb/t_148939466558c65be937c02.png',
                    'price' => 333,
                    'stock' => 3,
                    'virtual_price' => 45
                ],
                [
                    'id' => 4,
                    'model' => '43韭黄',
                    'img_url' => 'http://img.weiye.me/zcimgdir/thumb/t_148939466558c65be937c02.png',
                    'price' => 433,
                    'stock' => 13,
                    'virtual_price' => 38
                ],
            ],
            'express_fee' => '包邮',
            'model' => [
                [
                    "name" => "尺寸",
                    "subModelId" => [1, 2, 3, 4],
                    "subModelName" => ["40白色", "41红色", "42蓝绿", "43韭黄"]
                ]
            ],
            'img_urls' => [
                "https://img.yzcdn.cn/upload_files/2016/11/25/FpqPXlrMRjKwJs8VdTu3ZDJCj4j5.jpeg?imageView2/2/w/200/h/200/q/90/format/jpeg",
                "http://img.weiye.me/zcimgdir/thumb/t_148939466558c65be937c02.png"
            ],
            'assess_total' => 30,
            'assess' => [
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
        ];

        return ['code' => '200', 'msg' => 'success', 'data' => $data];
    }

    // 评论列表
    public function getAssessList()
    {
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

        for ($i = 0; $i < 20; $i++) {
            $data[] = $map[$i % 2];
        }

        return ['code' => '200', 'msg' => 'success', 'data' => $data, 'num' => [count($data), 1, 2, 3, 4], 'is_more' => 1, 'current_page' => 1, 'count' => 100, 'total_page' => 5];
    }

    public function orderList()
    {
        $status = isset($_POST['status']) && !is_null($_POST['status']) ? (int)$_POST['status'] : intval(rand(0, 8));
        $map = [
            [
                'original_express_fee' => 0,
                'original_price' => 999,
                'additional_info' => '',
                'id' => 381471,
                'order_id' => '5a770b8ecc6a5831434837',
                'payment_id' => 0,
                'status' => $status,
                'total_price' => 999.00,
                'add_time' => '2018-02-04 21:33:02',
                'payment_time' => 0,
                'refund_time' => 0,
                'is_self_delivery' => 0,
                'goods_num' => 1,
                'address_info' => [
                    'address_id' => 11,
                    'name' => '张无忌',
                    'contact' => 13326250250,
                    'detailAddress' => '楼下那家收破烂的',
                    'province' => '青海省',
                    'city' => '玉树藏族自治州',
                    'district' => '囊谦县',
                ],
                'buyer_info' => [
                    'nickname' => 59620248,
                    'phone' => 15260983827,
                    'message' => ''
                ],
                'goods_info' => [
                    [
                        'goods_id' => 2,
                        'price' => 999.00,
                        'stock' => 99,
                        'goods_name' => '草莓味酸奶',
                        'module_attr' => '白色42码',
                        'cover' => 'http://img.weiye.me/zcimgdir/thumb/t_148939466558c65be937c02.png',
                        'model' => '',
                        'num' => 1,
                    ]
                ],
                'remark' => '快点吧，黄花菜都凉了',
            ],
            [
                'original_express_fee' => 0,
                'original_price' => 999,
                'additional_info' => '',
                'id' => 381471,
                'order_id' => '5a770b8ecc6a5831434837',
                'payment_id' => 0,
                'status' => $status,
                'total_price' => 999.00,
                'add_time' => '2018-02-04 21:33:02',
                'payment_time' => 0,
                'refund_time' => 0,
                'is_self_delivery' => 0,
                'goods_num' => 1,
                'address_info' => [
                    'address_id' => 11,
                    'name' => '张无忌',
                    'contact' => 13326250250,
                    'detailAddress' => '楼下那家收破烂的',
                    'province' => '青海省',
                    'city' => '玉树藏族自治州',
                    'district' => '囊谦县',
                ],
                'buyer_info' => [
                    'nickname' => 59620248,
                    'phone' => 15260983827,
                    'message' => ''
                ],
                'goods_info' => [
                    [
                        'goods_id' => 2,
                        'price' => 999.00,
                        'stock' => 99,
                        'goods_name' => '草莓味酸奶',
                        'module_attr' => '白色42码',
                        'cover' => 'http://img.weiye.me/zcimgdir/thumb/t_148939466558c65be937c02.png',
                        'model' => '',
                        'num' => 1,
                    ]
                ],
                'remark' => '快点吧，黄花菜都凉了',
            ],
        ];
        for ($i = 0; $i < 20; $i++) {
            $data[] = $map[$i % 2];
        }

        return ['code' => '200', 'msg' => 'success', 'data' => $data, 'is_more' => 1, 'current_page' => 1, 'count' => 100, 'total_page' => 5];
    }

    public function getOrder()
    {
        $data = [
            'goods_info' => [
                [
                    'goods_id' => 2,
                    'price' => 999.00,
                    'stock' => 99,
                    'goods_name' => '草莓味酸奶',
                    'cover' => 'http://img.weiye.me/zcimgdir/thumb/t_148939466558c65be937c02.png',
                    'model' => '',
                    'num' => 1,
                ],
                [
                    'goods_id' => 3,
                    'price' => 699.00,
                    'stock' => 99,
                    'goods_name' => '草莓味酸奶',
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
                'province' => '青海省',
                'city' => '玉树藏族自治州',
                'district' => '囊谦县',
                'address_id' => 11
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
            'id' => 31,
            'order_id' => '5a770b8ecc6a5831434837',
            'payment_id' => 0,
            'status' => 0,
            'total_price' => 999.00,
            'add_time' => '2018-02-04 21:33:02',
            'payment_time' => 0,
            'refund_time' => 0,
            'is_self_delivery' => 0,
            'goods_num' => 1,
            'order_total_price' => 999.00
        ];

        return ['code' => '200', 'msg' => 'success', 'data' => $data];
    }

    // 购物车
    public function cartList()
    {
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
                'status' => 0,
                'model_value' => ['白色', '42码']
            ]
        ];

        return ['code' => '200', 'msg' => 'success', 'data' => $data];
    }

    // 消息
    public function getMessage()
    {
        $type = ['1' => '站内消息', '2' => '支付消息', 3 => '表单消息', 4 => '评论消息', 8 => '管理员通知'];
        $data = [
            'messageList' => [
                [
                    'type' => 1,
                    'content' => json_encode([
                        'title' => '订单状态变更',
                        'description' => '您的订单已经发货',
                        'pic' => 'http://img.weiye.me/zcimgdir/thumb/t_148939466558c65be937c02.png',
                    ]),
                    'add_time' => date('Y-m-d H:i'),
                    'page_url' => '',
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
            'unread_count' => 3
        ];

        return ['code' => '200', 'msg' => 'success', 'data' => $data, 'is_more' => 1, 'current_page' => 1, 'count' => 100, 'total_page' => 5];
    }

    public function addCart()
    {
        return ['code' => '200', 'msg' => 'success', 'data' => []];
    }

    // 购物车与检查
    public function precheckShoppingCart()
    {
        return ['code' => '200', 'msg' => 'success', 'data' => []];
    }

    // 搜索
    public function search()
    {
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
                    'category_id' => ['0' => 779110],
                    'server_time' => 1517751753,
                    'is_group_buy' => 0,
                ]
            ]
        ];

        return ['code' => '200', 'msg' => 'success', 'data' => $data, 'is_more' => 1, 'current_page' => 1, 'count' => 100, 'total_page' => 5];
    }

    // 地址列表
    public function addressList()
    {
        $data = [
            [
                'id' => 114603,
                'address_info' => [
                    'name' => '张无忌',
                    'contact' => 13326250250,
                    'detailAddress' => '楼下那家收破烂的',
                    'province' => '青海省',
                    'city' => '玉树藏族自治州',
                    'district' => '囊谦县',
                ],
                'is_default' => 1,
                'telphone' => 13326250250,
                'latitude' => '32.20295',
                'longitude' => '96.48063',
            ],
            [
                'id' => 114603,
                'address_info' => [
                    'name' => '张无忌',
                    'contact' => 13326250250,
                    'detailAddress' => '楼下那家收破烂的',
                    'province' => '青海省',
                    'city' => '玉树藏族自治州',
                    'district' => '囊谦县',
                ],
                'is_default' => 0,
                'telphone' => 13326250250,
                'latitude' => '32.20295',
                'longitude' => '96.48063',
            ]
        ];
        return ['code' => '200', 'msg' => 'success', 'data' => $data];
    }

    // 分类
    public function category()
    {
        $category = (new Category())->getCategory();
        return ['code' => '200', 'msg' => 'success', 'data' => $category];
    }

    // 用户首页
    public function countStatusOrder()
    {
        ['待付款', '待发货', '待收货', '待评价'];
        $data = [2, 0, 1, 0];

        return ['code' => '200', 'msg' => 'success', 'data' => $data];
    }

    // 物流信息
    public function expressFlow()
    {
        //state  2在途中，3已签收，4问题件
        $data = [
            'state' => (int)rand(2, 4),
            'express_name' => '东风快递',
            'express_code' => date('YmdHis'),
            'traces' => [
                [
                    'accept_station' => '派件中',
                    'accept_time' => date('Y-m-d H:i:s')
                ],
                [
                    'accept_station' => '快递已抵达福州台江',
                    'accept_time' => date('Y-m-d H:i:s')
                ],
                [
                    'accept_station' => '快递由广州发出，下一站福州',
                    'accept_time' => date('Y-m-d H:i:s')
                ],
                [
                    'accept_station' => '快递抵达广州市',
                    'accept_time' => date('Y-m-d H:i:s')
                ],
                [
                    'accept_station' => '卖家已发货，快递员揽货',
                    'accept_time' => date('Y-m-d H:i:s')
                ]
            ]
        ];

        return ['code' => '200', 'msg' => 'success', 'data' => $data];
    }

    // 积分规则
    public function getIntegralInfo()
    {
        $data = [
            'can_use_integral' => 30,
            'total_integral' => 100,
            'convert_num' => 100,
            'consume_num' => 1,
            'login_num' => 0,
            'post_comment_num' => 0,
            'share_num' => 0,
        ];
        return ['code' => '200', 'msg' => 'success', 'data' => $data];
    }

    // 积分列表
    public function getIntegralList()
    {
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
            ];
        } else {
            $data = [
                $data[1], $data[3]
            ];
        }
        return ['code' => '200', 'msg' => 'success', 'data' => $data, 'is_more' => 1, 'current_page' => 1, 'count' => 100, 'total_page' => 5];
    }

    // 预支付
    public function prePay()
    {
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
        return ['code' => '200', 'msg' => 'success', 'data' => $data];
    }

    // 编辑地址
    public function getAddressById()
    {
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
        return ['code' => '200', 'msg' => 'success', 'data' => $data];
    }

    // 店铺信息
    public function getAppShopLocationInfo()
    {
        $data = [
            'is_self_delivery' => 1,
            'shop_location' => '福建省福州市台江区宝龙城市广场38号楼',
            'shop_contact' => '15323243242',
            'open_time' => '08:00',
            'close_time' => '22:00'
        ];

        return ['code' => '200', 'msg' => 'success', 'data' => $data];
    }
}