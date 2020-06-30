<?php

namespace App\Http\Transformers;
use URL;

class UserTransformer extends Transformer
{
    public function transform($data)
    {
        $store = isset($data->store) ? (object) $data->store : false;
        $email = '';
        $position = strpos($data->email, '@');   
        
        if ($position == true){ 
            $customerEmail = explode('@', $data->email);
            $email         = $this->nulltoBlank($data->email);

            if($customerEmail[1] == 'default.com')
            {
                $email = '';
            }    
        } 
        
        
        //$profilePic = isset($data->profile_pic) ? URL('img/user/'. $data->profile_pic) : URL('img/user/default.png');
        $profilePic = isset($data->profile_pic) ? $data->profile_pic : '';
        
        return [
            'user_id'       => (int) $data->id,
            'user_token'    => $data->token,
            'name'          => $this->nulltoBlank($data->name),
            'email'         => $data->email,
            'user_type'     => isset($store) && isset($store->id) ? 1 : 0,
            'country_code'  => isset($data->country_code) ? $data->country_code : '',
            'phone'         => $this->nulltoBlank($data->phone),
            'gender'        => isset($data->gender) ? $data->gender : '',
            'birthdate'     => isset($data->birthdate) ? $data->birthdate : '',
            'profile_pic'   => $profilePic,
            'has_store'     => isset($store) && isset($store->id) ? 1 : 0,
            'enterprise_id' => isset($store) && isset($store->id) ? $store->id : '',
            'enterprise_name' => isset($store) && isset($store->id) ? $store->title : '',
            'enterprise_currency' => isset($store) && isset($store->id) ? $store->enterprise_currency : '',
        ];
    }

    public function getUserInfo($data)
    {
        return [
            'userId'    => $data->id,
            'name'      => $this->nulltoBlank($data->name),
            'email'     => $this->nulltoBlank($data->email),
        ];
    }

    /**
     * userDetail
     * Single user detail.
     *
     * @param type $data
     * @return type
     */
    public function userDetail($data)
    {
        return [
            'UserId' => isset($data['id']) ? $data['id'] : '',
            'QuickBlocksId' => isset($data['quick_blocks_id']) ? $data['quick_blocks_id'] : '',
            'MobileNumber' => isset($data['mobile_number']) ? $data['mobile_number'] : '',
            'Name' => isset($data['username']) ? $data['username'] : '',
            'Specialty' => isset($data['specialty']) ? $data['specialty'] : '',
            'ProfilePhoto' => isset($data['profile_photo']) ? $this->getUserImage($data['profile_photo']) : '',
        ];
    }

    /*
     * User Detail and it's parameters
     */
    public function singleUserDetail($data)
    {
        return [
            'UserId' => $data['id'],
            'Name' => $this->nulltoBlank($data['name']),
            'Email' => $this->nulltoBlank($data['email']),
            'MobileNumber' => $this->nulltoBlank($data['mobile_number']),
        ];
    }

    public function transformStateCollection(array $items)
    {
        return array_map([$this, 'getState'], $items);
    }
}
