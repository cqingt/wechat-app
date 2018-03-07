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
use app\common\model\CompanyAddress;
use app\common\model\CompanyConfig;
use app\common\model\Config;
use app\common\model\MessageLog;
use app\common\model\Order;
use app\common\model\OrderAddress;
use app\common\model\OrderComment;
use app\common\model\OrderDetail;
use app\common\model\Product;
use app\common\model\ProductComment;
use app\common\model\ProductSku;
use app\common\model\User;
use app\common\model\UserAddress;
use app\common\model\UserIntegral;
use library\Code;
use think\Db;
use think\Exception;
use think\Log;
use think\Session;
use think\Validate;

class App extends BaseController
{
    // 分页，每页数量
    protected $_rows = 12;

    protected $orderStatus = [
        0 => 0,  // 待付款
        1 => 10, // 待发货
        2 => 30, // 待收货
        3 => 40, // 待评价
        4 => 60, // 退款审核中
        5 => 70, // 正在退款
        6 => 50, // 已完成
        7 => 90, // 已关闭
    ]; // 0待支付，10已支付，20支付失败，30已发货，40已收货，50完成，60申请退款，70退款中，80已退款，90已关闭

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

        return $this->_successful($banners);
    }

    // 商品列表-搜索
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
            $condition = array_merge($condition, ['name' => ['LIKE', '%' . $searchValue . '%']]);

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

        return $this->_success($products, $isMore, $total, $page, $totalPage);
    }

    // 商品详情
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

        return $this->_successful($goodsInfo); //['code' => '200', 'msg' => 'success', 'data' => $goodsInfo];
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
        $isMore =  count($result) == $this->_rows ? 1 : 0;
        $options = [ 'num' => [$commentTotal, $comment->getTotal($goodsId, 1), $comment->getTotal($goodsId, 2), $comment->getTotal($goodsId, 3), $comment->getTotal($goodsId, 4)]];
        return $this->_success($result, $isMore, $commentTotal, $page, $pageTotal, $options);
    }

    // 新增评论
    public function addAssessList()
    {
        $userId = $this->getUserId();
        $submitData = $_POST['submitData'];

        if (! empty($submitData)) {
            //$orderId = $submitData['order_id'];
            $goods = $submitData['goods'];
            $commentModel = new OrderComment();

            Db::startTrans();

            try {
                if (!empty($goods)) {
                    foreach ($goods as $good) {
                        $comment = [
                            'user_id' => $userId,
                            'product_id' => $good['goods_id'],
                            'order_id' => $submitData['order_id'],
                            'content' =>  $good['info']['content'],
                            'type' => $good['info']['level'],
                            'images' => !empty($good['info']['img_arr']) ? json_encode($good['info']['img_arr']) : ''
                        ];

                        if (! $commentModel->addComment($comment)) {
                            Db::rollback();
                            return $this->_error();
                        }
                    }
                    Db::commit();
                    return $this->_successful();
                }
            } catch (Exception $e) {
                Db::rollback();
            }
        }

        return $this->_error();
    }

    // 订单列表
    public function orderList()
    {
        $status = input('status', null);
        if ($status) {
            $status = isset($this->orderStatus[$status]) ? $this->orderStatus[$status] : null;
        }

        $page = input('page', 1);
        $offset = ($page - 1) * $this->_rows;
        $userId = $this->getUserId();
        $order = new Order();
        $orderDetail = new OrderDetail();
        $total = $order->getTotal($userId, $status);
        $orderList = $order->getOrderList($userId, $status, $offset, $this->_rows);
        $totalPage = ceil($total / $this->_rows);
        $isMore = count($orderList) == $this->_rows ? 1 : 0;
        $statusFlip = array_flip($this->orderStatus);

        foreach ($orderList as &$item) {
            $item = [
                'original_express_fee' => 0,
                'original_price' => $item['price'],
                'additional_info' => '',
                'order_id' => $item['id'],
                'order_sn' => $item['order_sn'],
                'payment_id' => 0,
                'status' => isset($statusFlip[$item['status']]) ? $statusFlip[$item['status']] : 9,
                'total_price' => $item['price'],
                'add_time' => date('Y-m-d H:i:s', $item['create_time']),
                'payment_time' => date('Y-m-d H:i:s', $item['pay_time']),
                'refund_time' => 0,
                'is_self_delivery' => 0,
                'goods_num' => 0,
                'remark' => $item['remark'],
                'address_info' => [
                    'address_id' => 0,
                    'name' => '',
                    'contact' => '',
                    'detailAddress' => '',
                    'province' => '',
                    'city' => '',
                    'district' => '',
                ],
                'buyer_info' => [
                    'nickname' => '',
                    'phone' => '',
                    'message' => ''
                ]
            ];

            $orderGoods = $orderDetail->getDetail($item['order_id']);

            foreach ($orderGoods as $orderGood) {
                $item['goods_info'][] = [
                    'goods_id' => 0,
                    'price' => $orderGood['product_price'],
                    'stock' => 99,
                    'goods_name' => $orderGood['product_name'],
                    'module_attr' => $orderGood['product_sku'],
                    'cover' => $orderGood['product_image'],
                    'model' => $orderGood['product_sku'],
                    'num' => $orderGood['product_num'],
                ];
                $item['goods_num'] += $orderGood['product_num']; // 商品数量统计
            }
        }

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

        return $this->_success($orderList, $isMore, $total, $page, $totalPage);
        //return ['code' => '200', 'msg' => 'success', 'data' => $data, 'is_more' => 1, 'current_page' => 1, 'count' => 100, 'total_page' => 5];
    }

    public function getOrder()
    {
        $orderId = input('order_id', 0, 'int');
        $userId = $this->getUserId();
        $orderInfo = (new Order())->getOrderInfo($userId, $orderId);
        $address = (new OrderAddress())->getAddress($orderId);
        $orderGoods = (new OrderDetail())->getDetail($orderId);
        $statusFlip = array_flip($this->orderStatus);
        $result = [
            'remark' => $orderInfo['remark'],
            'original_express_fee' => 0,
            'express_fee' => 0,
            'buyer_info' => [
                'nickname' => '',
                'phone' => '',
                'message' => ''
            ],
            'discount_cut_price' => 0,
            'integral_used' => 0,
            'original_price' => $orderInfo['price'],
            'additional_info' => '',
            'order_id' => $orderInfo['id'],
            'order_sn' => $orderInfo['order_sn'],
            'payment_id' => 0,
            'status' => isset($statusFlip[$orderInfo['status']]) ? $statusFlip[$orderInfo['status']] : 9,
            'total_price' => $orderInfo['price'],
            'add_time' => date('Y-m-d H:i:s', $orderInfo['create_time']),
            'payment_time' => date('Y-m-d H:i:s', $orderInfo['pay_time']),
            'refund_time' => 0,
            'is_self_delivery' => 0,
            'goods_num' => 0,
            'order_total_price' => $orderInfo['price']
        ];

        $result['address_info'] = [
            'address_id' => $address['id'],
            'name' => $address['username'],
            'contact' => $address['telephone'],
            'province' => $address['province'],
            'city' => $address['city'],
            'district' => $address['area'],
            'detailAddress' => $address['address'],
        ];

        foreach ($orderGoods as $orderGood) {
            $result['goods_info'][] = [
                'goods_id' => 0,
                'price' => $orderGood['product_price'],
                'stock' => 99,
                'goods_name' => $orderGood['product_name'],
                'module_attr' => $orderGood['product_sku'],
                'cover' => $orderGood['product_image'],
                'model' => $orderGood['product_sku'],
                'num' => $orderGood['product_num'],
            ];
            $result['goods_num'] += $orderGood['product_num']; // 商品数量统计
        }

        return $this->_successful($result);
    }

    // 取消订单
    public function cancelOrder()
    {
        $orderId = input('order_id', 0, 'int');
        $userId = $this->getUserId();
        $orderInfo = (new Order())->getOrderInfo($userId, $orderId);

        // 未支付前 可以取消
        if ($orderInfo && $orderInfo['status'] == 0) {
            // 关闭订单
            Db::startTrans();

            try {
                if ((new Order())->updateOrder($orderId, ['status' => 90, 'update_time' => time()])) {
                    if ((new Order())->resetStock($orderId)) {
                        Db::commit();
                        return $this->_successful();
                    }
                }
                Db::rollback();
            } catch (Exception $e) {
                Db::rollback();
            }
        }

        return $this->_error();
    }
    
    // 申请退款
    public function applyRefund()
    {
        // 待发货，待收货可以申请退款
        $orderId = input('order_id', 0, 'int');
        $userId = $this->getUserId();
        $orderInfo = (new Order())->getOrderInfo($userId, $orderId);

        if ($orderInfo && in_array($orderInfo['status'], ['10', '30'])) {

            // 申请退款
            if ((new Order())->updateOrder($orderId, ['status' => 60, 'update_time' => time()])) {
                return $this->_successful();
            }
        }

        return $this->_error();
    }

    // 确认收货
    public function comfirmOrder()
    {
        $orderId = input('order_id', 0, 'int');
        $userId = $this->getUserId();
        $orderInfo = (new Order())->getOrderInfo($userId, $orderId);

        // 待收货
        if ($orderInfo && $orderInfo['status'] == 30) {

            // 确认收货
            if ((new Order())->updateOrder($orderId, ['status' => 40, 'update_time' => time()])) {
                return $this->_successful();
            }
        }

        return $this->_error();
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
                'sku_id' => $item['sku_id'],
                'editSelected' => 1,
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

        return $this->_successful($cartList);
    }

    // 添加购物车
    public function addCart()
    {
        $productId = input('goods_id', 0, 'int');
        $skuId = input('sku_id', 0, 'int');
        $num = input('num', 1, 'int');

        $stock = (new ProductSku())->getStock($productId, $skuId);
        if ($stock && $num >= 1 && $num <= $stock) {
            if ((new Cart())->updateNum($this->getUserId(), $productId, $skuId, $num)) {
                return ['code' => '200', 'msg' => 'success', 'data' => []];
            }
        }

        if ($num > $stock) {
            return $this->_error('OVERFLOW_STOCK');
        }

        return $this->_error();
    }

    // 删除购物车商品
    public function deleteCart()
    {
        $cartList = $_POST['cart_id_arr'];

        if (empty($cartList)) {
            return $this->_error('UNKNOWN_ERROR');
        }

        Db::startTrans();

        try{
            if (!empty($cartList)) {
                for ($i = 0, $count = count($cartList); $i < $count; $i ++) {
                    (new Cart())->deleteById($this->getUserId(), $cartList[$i]);
                }
            }
            // 提交事务
            Db::commit();
        } catch (\Exception $e) {
            // 回滚事务
            Db::rollback();
            return $this->_error();
        }
        return $this->_successful();
    }

    // 消息
    public function getMessage()
    {
        $page = input('page', 1);
        $offset = ($page - 1) * $this->_rows;
        $message = new MessageLog();
        $userId = $this->getUserId();
        $total = $message->messageCount($userId);
        $messageList = [];

        if ($total) {
            $messageList = $message->messageList($userId, $offset, $this->_rows);
        }

        $totalPage = ceil($total / $this->_rows);
        $isMore = count($messageList) == $this->_rows ? 1 : 0;
        // 消息类型：1已支付，2订单状态变更，3退款，4系统通知
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

        return $this->_success($messageList, $isMore, $total, $page, $totalPage);
    }

    // 购物车与检查
    public function precheckShoppingCart()
    {
        // 检测库存是否合法
        $userId = $this->getUserId();
        $goods = (new Cart())->getCartSelected($userId);
        $data = [];

        foreach ($goods as $item) {
            if ($item['num'] > $item['stock']) {
                $data['expired_goods_arr'][] = ['goods_id' => $item['product_id']];
            }
            $data['goodsList'][] = [
                'cart_id' => $item['id'],
                'goods_id' => $item['product_id'],
                'sku_id' => $item['sku_id'],
                'editSelected' => 1,
                'selected' => $item['selected'] == 'Y' ? 1 : 0,
                'num' => $item['num'],
                'title' => $item['title'],
                'cover' => $item['cover'],
                'price' => $item['price'],
                'original_price' => $item['price'],
                'stock' => $item['stock'],
                'sales' => 0,
                'status' => 0,
                'model_value' => [$item['model_value_str']]
            ];
        }

        if (isset($data['expired_goods_arr'])) {
            return $this->_successful($data, 201);
        } else {
            return $this->_successful($data);
        }
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
        $addressList = (new UserAddress())->addressList($this->getUserId());

        foreach ($addressList as &$item) {
            $item = [
                'id' => $item['id'],
                'address_info' => [
                    'name' => $item['username'],
                    'contact' => $item['telephone'],
                    'detailAddress' => $item['address'],
                    'province' => $item['province'],
                    'city' => $item['city'],
                    'district' => $item['area']
                ],
                'is_default' => $item['is_default'] == 'Y' ? 1 : 0,
                'telphone' => $item['telephone'],
                'latitude' => '',
                'longitude' => '',
            ];
        }
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

        return $this->_successful($addressList);
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
        $order = new Order();
        $userId = $this->getUserId();
        $toPay = $order->getTotal($userId, 0);
        $toSend = $order->getTotal($userId, 10);
        $toReceive = $order->getTotal($userId, 30);
        $toComment = $order->getTotal($userId, 40);
        ['待付款', '待发货', '待收货', '待评价'];
        $data = [$toPay, $toSend, $toReceive, $toComment];

        return $this->_successful($data);
        //return ['code' => '200', 'msg' => 'success', 'data' => $data];
    }

    // 物流信息
    public function expressFlow()
    {
        $orderId = input('order_id');
        $orderInfo = (new Order())->getOrderExpress($this->getUserId(), $orderId);
        $express = [];

        if (!empty($orderInfo)) {
            $express = [
                'state' => $orderInfo['express_status'],
                'express_name' => $orderInfo['express'],
                'express_code' => $orderInfo['express_no'],
                'traces' => ! empty($orderInfo['express_json']) ? json_decode($orderInfo['express_json'], true) : []
            ];
        }
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

        return $this->_successful($express);
        //return ['code' => '200', 'msg' => 'success', 'data' => $data];
    }

    // 积分规则
    public function getIntegralInfo()
    {
        $userId = $this->getUserId();
        //$canUse = (new User())->getUserField($userId, 'integral');
        $data = [
            'can_use_integral' => (new User())->getUserField($userId, 'integral'),
            'total_integral' => (new UserIntegral())->getTotal($userId, 'GET'),
            'convert_num' => (new CompanyConfig())->getFieldValue('integral_yuan'),
            'consume_num' => 1,
            'login_num' => 0,
            'post_comment_num' => 0,
            'share_num' => 0,
        ];

        return $this->_successful($data);
    }

    // 积分列表
    public function getIntegralList()
    {
        $page = input('page', 1);
        $offset = ($page - 1) * $this->_rows;
        $action = isset($_GET['action']) ? $_GET['action'] : 'income';

        $integral = new UserIntegral();
        $userId = $this->getUserId();

        $total = $integral->getCount($userId, $action);
        $result = [];

        if ($total) {
            $list = $integral->getList($userId, $action, $offset, $this->_rows);

            foreach ($list as $item) {
                $result[] = [
                    'content' => $item['remark'],
                    'time' => date('Y-m-d H:i', $item['create_time']),
                    'num' => ($action === 'outcome' ? '-' : '') . $item['amount']
                ];
            }
        }

        $totalPage = ceil($total / $this->_rows);
        $isMore = count($result) == $this->_rows ? 1 : 0;

        return $this->_success($result, $isMore, $total, $page, $totalPage);
    }

    // 预支付
    public function prePay()
    {
        $addressId = input('address_id');
        $selfDelivery = input('is_self_delivery');
        $userId = $this->getUserId();
        $expressFee = 0;
        $addressInfo = [];

        if ($selfDelivery == 1) {
            // 到店自提
        } else {
            // 快递
            $config = (new CompanyConfig())->getValues();
            if (stripos($config['delivery'], 'EXPRESS') !== false && $config['express'] == 'FEE') {
                $expressFee = $config['express_fee'];
            }
        }

        if ($addressId) {
            $address = (new UserAddress())->addressInfo($userId, $addressId);
            if ($address) {
                $addressInfo = [
                    'name' => $address['username'],
                    'contact' => $address['telephone'],
                    'province' => $address['province'],
                    'city' => $address['city'],
                    'area' => $address['area'],
                    'address' => $address['address'],
                ];
            }
        }

        $userId = $this->getUserId();
        $goods = (new Cart())->getCartSelected($userId);
        $price = 0;
        foreach ($goods as $good) {
            $price += $good['num'] * $good['price'];
        }

        $data = [
            'goods_info' => $goods,
            'express_fee' => $expressFee,
            'original_price' => $price,
            'price' => $price,
            'address' => [
                'id' => $addressId,
                'address_info' => $addressInfo
            ]
        ];

        return $this->_successful($data);
        //return ['code' => '200', 'msg' => 'success', 'data' => $data];
    }

    // 编辑地址
    public function getAddressById()
    {
        $userId = $this->getUserId();
        $addressId = input('address_id', 0, 'int');
        $address = (new UserAddress())->addressInfo($userId, $addressId);

        $addressInfo = [
            'address_info' => [
                'name' => $address['username'],
                'contact' => $address['telephone'],
                'province' => $address['province'],
                'city' => $address['city'],
                'district' => $address['area'],
                'detailAddress' => $address['address'],
                'sex' => $address['sex'],
            ]
        ];

        return $this->_successful($addressInfo);

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
        //return ['code' => '200', 'msg' => 'success', 'data' => $data];
    }

    // 添加地址
    public function addAddress()
    {
        $userId = $this->getUserId();
        $addressInfo = $_POST['address_info'];
        $addressId = input('address_id', 0, 'int');
        $isDefault = 0;

        if (! empty($addressInfo)) {
            $address = [
                'user_id' => $userId,
                'username' => $addressInfo['name'],
                'telephone' => $addressInfo['contact'],
                'province' => $addressInfo['province'],
                'city' => $addressInfo['city'],
                'area' => $addressInfo['district'],
                'address' => $addressInfo['detailAddress'],
                'sex' => $addressInfo['sex'],
                'is_default' => $isDefault
            ];

            $addressModel = new UserAddress();

            if ($addressId) {
                $address = array_merge($address, ['update_time' => time() ]);

                if ($addressModel->addAddress($address, $addressId)) {
                    return $this->_successful();
                }
            } else {
                $address = array_merge($address, ['create_time' => time()]);

                if ($addressModel->addAddress($address)) {
                    return $this->_successful();
                }
            }
        }

        return $this->_error();
    }

    // 店铺信息
    public function getAppShopLocationInfo()
    {
        $shopInfo = (new CompanyConfig())->getValues();

        if ($shopInfo) {
            $data = [
                'is_self_delivery' => stripos($shopInfo['delivery'], 'O2O') !== false ? 1 : 0, // 到店自提
                'shop_location' => $shopInfo['address'],
                'shop_contact' => $shopInfo['telephone'],
                'open_time' => $shopInfo['open_time'],
                'close_time' => $shopInfo['close_time'],
            ];
        } else {
            return $this->_error();
        }

        return $this->_successful($data);
    }

    public function loginUser()
    {
        $nickname = input('nickname');
        $gender = input('gender');
        $province = input('province');
        $city = input('city');
        $country = input('country');
        $avatarUrl = input('avatarUrl');
        $session = input('session_key');

        if (empty($nickname)) {
            return $this->_error('PARAM_NOT_EMPTY');
        }

        $sessionValue = session($session);
        //Log::record('session1:' . var_export($session, true));
        //Log::record('session1 value:' . var_export(Session::get($session), true));
        if (! empty($sessionValue) && stripos($sessionValue, '|')) {
            $openId = explode($sessionValue, '|')[1];
            $user = new User();
            $userId = $this->getUserId();
            $userInfo = [
                'username' => $nickname,
                'province' => $province,
                'city'     => $city,
                'avatar'   => $avatarUrl,
                'gender'   => $gender,
                'country'  => $country
            ];

            if (! $user->existUsername($openId)) {
                $user->saveUserInfo($userId, $userInfo);
            }

            $data = [
                'user_info' => [
                    'nickname'    => $nickname,
                    'cover_thumb' => $avatarUrl,
                    'gender'      => $gender,
                    'phone'       => ''
                ]
            ];

            return $this->_successful($data);
        } else {
            return $this->_error('USER_NOT_LOGIN');
        }
    }

    public function onLogin()
    {
        $appId = \think\Config::get('weixin.appId');
        $secret = \think\Config::get('weixin.appSecret');
        $code = input('code');
        $url = 'https://api.weixin.qq.com/sns/jscode2session?appid='.$appId.'&secret='.$secret.'&js_code='.$code.'&grant_type=authorization_code';
        $result = $this->http_get($url);

        if (! empty($result)) {
            $sessionKey = $result['session_key'];
            $openId = $result['openid'];

            $user = new User();

            if ((! $user->existOpenId($openId) && $user->addUser($openId)) || $user->existOpenId($openId)) {
                // 存储openid, 生成新的3rd_session ，接口调用凭证使用3rd_session 过期重新登录
                $session = $this->generateSession($sessionKey, $openId);
                $value = $this->generateSession($sessionKey, $openId, true);
                session($session, $value);
                //Log::record('session:' . var_export($session, true));
                //Log::record('session value:' . var_export(Session::get($session), true));
                $data = ['session' => $session, 'is_login' => 0];
                return $this->_successful($data);
            }
            return $this->_error('USER_REGISTER_ERROR');
        }
    }

    // 生成session
    public function generateSession($sessionKey, $openId, $getValue = false)
    {
        $value = $sessionKey . '|' . $openId;

        if ($getValue) {
            return $value;
        }
        return md5($value);
    }

    // 获取用户信息
    public function getLoginUserInfo()
    {
        $userInfo = (new User)->getUserInfo2($this->getUserId());

        if (empty($userInfo)) {
            return $this->_error('USER_NOT_LOGIN');
        }

        $data = [
            'nickname'    => $userInfo['username'],
            'cover_thumb' => $userInfo['avatar'],
            'gender'      => $userInfo['gender'],
            'phone'       => $userInfo['telephone'],
        ];

        return $this->_successful($data);
    }

    protected function http_get($url, $header = [], $response = 'json') {
        if(function_exists('curl_init')) {
            $urlArr = parse_url($url);
            $ch = curl_init();

            if(is_array($header) && !empty($header)){
                $setHeader = array();
                foreach ($header as $k=>$v){
                    $setHeader[] = "$k:$v";
                }
                curl_setopt($ch, CURLOPT_HTTPHEADER, $setHeader);
            }

            curl_setopt($ch,CURLOPT_URL, $url);
            curl_setopt($ch,CURLOPT_RETURNTRANSFER,1);
            curl_setopt($ch,CURLOPT_HEADER,0);

            if (strnatcasecmp($urlArr['scheme'], 'https') == 0) {
                curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0); // 对认证证书来源的检查
                curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 2); // 从证书中检查SSL加密算法是否存在
            }

            //执行并获取HTML文档内容
            $output = curl_exec($ch);
            $info = curl_getinfo($ch);
            curl_close($ch);

            if (is_array($info) && $info['http_code'] == 200) {
                return $response == 'json' ? json_decode($output, true, JSON_UNESCAPED_UNICODE) : $output;
            } else {
                exit('请求失败（code）：' . $info['http_code']);
            }
        } else {
            throw new Exception('请开启CURL扩展');
        }
    }

    protected function getUserId()
    {
        $session = input('session_key');
        $sessionValue = session($session);

        if ($session && stripos($sessionValue, '|')) {
            $openId = explode($sessionValue, '|')[1];
            return (new User())->getUserId($openId);
        }

        return 1;
    }

    // 用户信息
    protected function getUserInfo()
    {
        $userInfo = (new User())->getUserInfo($this->getUserId());

        return $this->_successful($userInfo);
    }

    // 保存用户信息
    public function saveUserInfo()
    {
        $nickname = input('nickname');
        $avatar = input('cover_thumb');
        $telephone = input('phone');
        $sex = input('sex');

        $rules = [
            'username'  => 'require|max:25|min:3',
            'avatar'    => 'require',
            'telephone' => 'require|regex:1[3-9]\d{9}'
        ];

        $message  =   [
            'username.require' => '昵称不能为空',
            'username.max'     => '昵称最多不能超过25个字符',
            'username.min'     => '昵称最少3个字符',
            'avatar.require'   => '头像不能为空',
            'telephone.require'  => '手机号不能为空',
            'telephone.regex'    => '手机号错误',
        ];

        $data = [
            'username' => $nickname,
            'avatar' => $avatar,
            'telephone' => $telephone,
        ];

        $validate = new Validate($rules, $message);
        $result   = $validate->check($data);
        if(! $result){
            return $this->_error('SAVE_USER_ERROR', $validate->getError());
        }

        if (! is_null($sex) ) {
            $data['sex'] = $sex;
        }

        if ((new User())->saveUserInfo($this->getUserId(), $data)) {
            return $this->_successful();
        }

        return $this->_error();
    }

    /**
     * 不带分页
     * @param array $data
     * @param int $code
     * @return array
     */
    protected function _successful($data = [], $code = 200)
    {
        return [
            'code' => $code,
            'msg' => 'success',
            'data' => $data
        ];
    }

    /**
     *  带分页
     * @param $data
     * @param $isMore
     * @param $page
     * @param $total
     * @param $totalPage
     * @param array $option
     * @return array
     */
    protected function _success($data, $isMore, $total, $page = 1, $totalPage = 1, $option = [])
    {
        $result = [
            'code' => '200',
            'msg' => 'success',
            'data' => $data,
            'is_more' => $isMore,
            'current_page' => $page,
            'count' => $total,
            'total_page' => $totalPage
        ];

        if (! empty($option)) {
            $result = array_merge($result, $option);
        }

        return $result;
    }

    protected function _error($errorCode = 'UNKNOWN_ERROR', $errorMsg = '')
    {
        return Code::get($errorCode, $errorCode);
    }
}