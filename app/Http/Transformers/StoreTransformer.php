<?php
namespace App\Http\Transformers;

use App\Http\Transformers;
use URL;
use DB;

class StoreTransformer extends Transformer
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
        
        $queryData = DB::table('users')->select('country_code')->where('id',access()->user()->id)->first();
        
        $item->distance = isset($item->distance) ? number_format($item->distance, 2) : 0;
        
        if(isset($queryData->country_code) && $queryData->country_code == "+1"){
            $distance = $item->distance." Miles";
        }else{
            $distance = $item->distance." KM";
        }
        
        return [
            "enterprise_id" => (int) $item->id, 
            "user_id"       => $item->user_id, 
            "title"         => $item->title, 
            "description"   => $item->description,
            "enterprise_currency"   => $item->enterprise_currency,
            "address"       => $item->address, 
            "city"          => $item->city, 
            "state"         => $item->state, 
            "zip"           => $item->zip, 
            "country"       => $this->nullToBlank($item->country), 
            "image"         => URL('img/store/'. $item->enterprise_display_image), 
            "latitude"      => $item->latitude, 
            "longitude"     => $item->longitude,
            "distance"      => $distance,
            "last_order_id" => access()->getUserstoreLastOrderId($item->id)
        ];
    }
}