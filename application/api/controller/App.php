<?php
/**
 * Created by PhpStorm.
 * User: cqingt
 * Date: 2018/2/11
 * Time: 17:09
 */

namespace app\api\controller;

use app\common\model\Banner;
use app\common\model\Cart;
use app\common\model\Category;
use app\common\model\Config;
use app\common\model\Product;
use app\common\model\ProductComment;
use app\common\model\ProductSku;

class App extends BaseController
{
    // 分页，每页数量
    protected $_rows = 12;

    public function _empty()
    {
        return [
            'code' => '404',
            'msg' => '接口不存在'
        ];
    }

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
        $sortKey = input('sort_key', '');
        $sortDirection = input('sort_direction', 0); // 0 从大到小，1从小到大
        $searchValue = input('search_value', ''); // 搜索内容
        $searchCategoryId = input('category_id'); // 搜索分类过滤

        $query = input('query_key', ''); // 分类
        $categoryId = input('query_value', 0);
        $page = input('page', 1);
        $offset = ($page - 1) * $this->_rows;
        $product = new Product();
        $products = [];

        // 来自搜索
        if (! empty($searchValue)) {
            $sortBy = 'hots';
            $sort = 'DESC';
            $condition = [];

            // 选择分类
            if (!empty($searchCategoryId)) {
                $condition = ['category_id' => $searchCategoryId];
            }

            // 搜索词
            $condition = array_push($condition, ['name' => ['LIKE', '%' . $searchValue . '%']]);

            if (!empty($sortKey) && in_array($sortKey, ['sales', 'price'])) {
                $sortBy = $sortKey;
                $sort = $sortDirection == 1 ? 'ASC' : 'DESC';
            }

            $products = $product->getProducts($condition, $offset, $this->_rows, $sortBy, $sort);
            $total = $product->getProductCount($condition);
        } else {
            // 分类页面加载，默认取第一个分类
            if ($query == 'category_id' && $categoryId == 0) {
                $category = (new Category())->getCategory();
                $categoryId = count($category) ? $category[0]['id'] : 0;
            }

            // 选择分类时
            if ($categoryId) {
                $condition = ['category_id' => $categoryId];
                $products = $product->getProducts($condition, $offset, $this->_rows);
                $total = $product->getProductCount($condition);
            } else {

                // 首页推荐
                $products = $product->getRecommend($offset, $this->_rows);
                $total = $product->getRecommendCount();
            }
        }

        foreach ($products as &$product) {
            $product['title'] = $product['name'];
            $product['cover'] = $product['image'];
            $product['sales'] = $product['sales'] ?: $product['fade_sales']; // 销量
            $product['sale_price'] = $product['origin_price'];
            $product['category'] = [];
            $product['category_id'] = [];
            $product['is_recommend'] = $product['recommend'] == 'Y' ? 1 : 0;
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
        $goodsId = input('data_id', 0, 'int');
        $goodsInfo = (new Product)->getInfo($goodsId);
        $comment = new ProductComment();
        $skus = (new ProductSku())->getAll($goodsId);
        $goodsInfo['express_fee'] = (new Config())->getExpressFee();

        $modelItems = [];
        // sku 选择
        $model = [
            [
                'name' => $goodsInfo['attr'],
                'subModelId' => [],
                'subModelName' => []
            ]
        ];

        if (!empty($skus)) {
            foreach ($skus as $sku) {
                $modelItems[] = [
                    'id' => $sku['id'],
                    'model' => $sku['attr'],
                    'img_url' => '',
                    'price' => $sku['price'],
                    'stock' => $sku['stock'],
                    'virtual_price' => $sku['price'],
                ];

                array_push($model[0]['subModelId'], $sku['id']);
                array_push($model[0]['subModelName'], $sku['attr']);
            }
        }
        $goodsInfo['model_items'] = $modelItems;
        $goodsInfo['model'] = $model;

        $goodsInfo['is_recommend'] = $goodsInfo['recommend'] == 'Y' ? 1 : 0;
        $goodsInfo['sale_price'] = $goodsInfo['price'];
        $goodsInfo['virtual_price'] = $goodsInfo['price'];
        $goodsInfo['img_urls'] = [$goodsInfo['cover']];

        $data = [
            'id' => 3265413,
            'title' => '草莓味酸奶',
            'cover' => 'http://img.weiye.me/zcimgdir/thumb/t_148939466558c65be937c02.png',
            'price' => 999.00,
            'description' => '商品详情',
            'sale_price' => 0.00,//
            'sales' => 1,
            'is_recommend' => 0,
            'stock' => 999998,
            'virtual_price' => 0.00,
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
                'buyer_headimgurl' => '',
                'buyer_nickname' => '',
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

        // 评论
        $lastComment = $comment->getLastComment($goodsId);
        $goodsInfo['assess_total'] = $comment->getTotal($goodsId);

        if ($lastComment) {
            $goodsInfo['assess']['buyer_headimgurl'] = $lastComment['avatar'];
            $goodsInfo['assess']['buyer_nickname'] = $lastComment['username'];
            $goodsInfo['assess']['add_time'] = date('Y-m-d H:i', $lastComment['create_time']);
            $goodsInfo['assess']['assess_info'] = [
                'content' => $lastComment['content'],
                'has_img' => $lastComment['images'] ? 1 : 0,
                'img_arr' => $lastComment['images'] ? json_decode($lastComment['images'], true) : []
            ];
        }

        return ['code' => '200', 'msg' => 'success', 'data' => $goodsInfo];
    }

    // 评论列表
    public function getAssessList()
    {
        $type = input('level', '0');
        $goodsId = input('goods_id');
        $page = input('page', 1);
        $offset = ($page - 1) * $this->_rows;

        $comment = new ProductComment();
        $commentList = $comment->getComments($goodsId, $type, $offset, $this->_rows);
        $commentTotal = $comment->getTotal($goodsId, $type);
        $pageTotal = ceil($commentTotal / $this->_rows);

        $result = [];
        foreach ($commentList as $item) {
            $result[] = [
                'buyer_headimgurl' => $item['avatar'],
                'buyer_nickname' =>$item['username'],
                'add_time' => date('Y-m-d H:i', $item['create_time']),
                'assess_info' => [
                    'content' => $item['content'],
                    'has_img' => $item['images'] ? 1 : 0,
                    'img_arr' => $item['images'] ? json_decode($item['images'], true) : []
                ]
            ];
        }

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

        return [
            'code' => '200',
            'msg' => 'success',
            'data' => $result,
            'num' => [$commentTotal, $comment->getTotal($goodsId, 1), $comment->getTotal($goodsId, 2), $comment->getTotal($goodsId, 3), $comment->getTotal($goodsId, 4)],
            'is_more' => count($result) == $this->_rows ? 1 : 0,
            'current_page' => $page,
            'count' => $commentTotal,
            'total_page' => $pageTotal
        ];
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
        $userId = $this->getUserId();
        $cartList = (new Cart())->getCartList($userId);

        foreach ($cartList as &$item) {
            $item['goods_id'] = $item['id'];
            $item = [
                'cart_id' => $item['id'],
                'goods_id' => $item['product_id'],
                'editSelected' => 0,
                'selected' => $item['selected'] == 'Y' ? 1 : 0,
                'num' => $item['num'],
                'title' => $item['name'],
                'cover' => $item['image'],
                'price' => $item['price'],
                'original_price' => $item['original_price'],
                'stock' => $item['stock'],
                'sales' => 0,
                'status' => 0,
                'model_value' => [$item['sku']]
            ];
        }
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

        return ['code' => '200', 'msg' => 'success', 'data' => $cartList];
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

        foreach ($category as $key => &$item) {
            $item['text'] = $item['name'];
            $item['eventHandler'] = 'tapRefreshListHandler';
            $item['eventParams'] = json_encode(
                [
                    "refresh_object" => "list-902893529679",
                    "query_key"      => "category_id",
                    "query_value"    => $item['id'],
                    "parent_type"    => 'classify',
                    "parent_comp_id" => 'classify2',
                    "item_index"     => $key // 切换 选中时使用
                ]
            );
        }

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

    protected function getUserId()
    {
        return 1;
    }

    protected function getUserInfo()
    {
        return [
            'nickname' => 'wechat',
            'mobile'   => '15260983827',
            'avatar'   => ''
        ];
    }
}