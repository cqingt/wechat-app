<?php
/**
 * Created by PhpStorm.
 * User: cqingt
 * Date: 2018/2/11
 * Time: 10:19
 */
namespace library;

class Tool
{
    /**
     * 根据日期，获取对应的时间戳
     * @return array
     */
    public static function getDateBetween()
    {
        return [
            'total'         => [],
            'today'         => ['today 00:00:00', 'tomorrow 00:00:00'],
            'yesterday'     => ['yesterday 00:00:00', 'today 00:00:00'],
            'current_week'  => ['this week 00:00:00', 'next week 00:00:00'],
            'last_week'     => ['last week 00:00:00', 'this week 00:00:00'],
            'current_month' => ['first Day of this month 00:00:00', 'first Day of next month 00:00:00'],
            'last_month'    => ['first Day of last month 00:00:00', 'first Day of this month 00:00:00']
        ];
    }

    /**
     * 将时间转为时间戳
     * @param $currentType
     * @param string $prefix
     * @return array
     */
    public static function getBetweenTime($currentType, $prefix = '')
    {
        $condition = [];
        $dateBetween = self::getDateBetween();
        if (isset($dateBetween[$currentType])) {
            $timeArray = $dateBetween[$currentType];

            if ($prefix) {
                $prefix = trim($prefix, '.') . '.';
            }

            if (! empty($timeArray)) {
                $condition[$prefix . 'create_time'] = ['BETWEEN', [strtotime($timeArray[0]), strtotime($timeArray[1])]];
            }
        }

        return $condition;
    }

    /**
     * 获取key
     * @param string $prefix
     * @param string $type
     * @return string
     */
    public static function getCacheKey($prefix = '', $type = 'total')
    {
        $prefix = trim($prefix, '_') . '_';
        $key = '';
        switch ($type) {
            case 'total':
                $key = $prefix . 'total';
                break;

            case 'today':
                $key = $prefix . date('Ymd');
                break;

            case 'yesterday':
                $key = $prefix . date('Ymd', strtotime('yesterday 00:00:00'));
                break;

            case 'current_week':
                $key = $prefix . date('Y_W');// 周 2018_05
                break;

            case 'last_week':
                $key = $prefix . date('Y_W', strtotime('last week 00:00:00'));// 周 2018_05
                break;

            case 'current_month':
                $key = $prefix . date('Ym');
                break;

            case 'last_month':
                $key = $prefix . date('Ym', strtotime('first Day of last month 00:00:00'));
                break;
        }

        return $key;
    }
}