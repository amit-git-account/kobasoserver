<?php
namespace App\Http\Transformers;

use App\Http\Transformers;
use DB;
use URL;

class OrderTransformer extends Transformer
{
    /**
     * Transform
     *
     * @param array $data
     * @return array
     */
    public function transform($item)
    {
       
        if(is_array($item))
        {
            $item = (object)$item;
        }

        $itemDetails        = [];
        $totalWithTax       = 0;
        $totalWithOutTax    = 0;

        if($item->order_details)
        {
            foreach($item->order_details as $detail)
            {
                $firstItem = (int) $detail->item_id;
                $image         = $detail->image;
                $itemDetails[] = [
                    'order_item_id'     => (int) $detail->id,
                    'item_id'           => (int) $detail->item_id,
                    'category_id'       => (int) $detail->category_id,
                    "category_title"    => isset($detail->category) ? $detail->category['food_short_name'] : '',
                    'title'             => $detail->title,
                    'food_short_name'   => isset($detail->item) ? $detail->item->food_short_name : '',
                    'food_description'   => isset($detail->item) ? $detail->item->food_description : '',
                    'qty'               => (int) $detail->qty,
                    'price_with_tax'    => number_format($detail->price_with_tax, 2),
                    'price_without_tax' => number_format($detail->price_without_tax, 2),
                    "image"             => URL('img/item/'. $image)

                ];

                $totalWithTax       = number_format($totalWithTax + $detail->price_with_tax * $detail->qty, 2);
                $totalWithOutTax    = number_format($totalWithOutTax + $detail->price_without_tax * $detail->qty, 2);
            }
        }

            
          $enterprise_currency =  DB::table("data_food_item_detail")->select('data_enterprise_detail.enterprise_currency')->leftJoin('data_enterprise_detail',"data_enterprise_detail.id","=","data_food_item_detail.enterprise_id")->where([
                'data_food_item_detail.id'   => $firstItem
            ])->first();
            
      
        return [
            "order_id"          => (int) $item->id,
            "user_id"           => $item->user_id, 
            "enterprise_currency"           => $enterprise_currency->enterprise_currency, 
            "store_id"          => $item->store_id, 
            "queue_id"          => $this->nulltoBlank($item->queue_id),
            "total_with_tax"    => $totalWithTax,
            "total_without_tax" => $totalWithOutTax,
            "order_items"       => $itemDetails,
            "order_qr_image"    => URL('order-images/'. $item->qr_code_image)
        ];
    }
}