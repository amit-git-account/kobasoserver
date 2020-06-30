<?php

namespace App\Http\Controllers\Api;

use Auth;
use Response;
use Illuminate\Http\Request;
use App\Models\Access\User\User;
use Tymon\JWTAuth\Facades\JWTAuth;
use App\Http\Controllers\Controller;
use Tymon\JWTAuthExceptions\JWTException;
use Storage;
use File;
use Helper;


class GraphController extends BaseApiController
{
     /**
     * List of All Queue
     *
     * @param Request $request
     * @return json
     */
    public function index(Request $request)
    {
        $params = $request->all();

        $time   =   strtotime(date('Y-m-d'));
        $month  =   date("m",$time);
        $year   =   date("Y",$time);
        $day    =   date("d",$time);
        $restaurent_id = $params['enterprise_id'];
        $duration  = $params['searchterm'];
        
        if($duration == 0){
            $fromdate =  date('Y-m-d', mktime(0,0,0,($month),($day-7),$year));
            $todate = date('Y-m-d', mktime(0,0,0,($month),($day),$year));

        }else if($duration == 1){
            $fromdate =  date('Y-m-d', mktime(0,0,0,($month),($day-28),$year));
            $todate = date('Y-m-d', mktime(0,0,0,($month),($day),$year));

        }else if($duration == 2){
            $fromdate =  date('Y-m-d', mktime(0,0,0,($month-3),($day),$year));
            $todate = date('Y-m-d', mktime(0,0,0,($month),($day-1),$year));

        }else if($duration == 3){
            $fromdate =  date('Y-m-d', mktime(0,0,0,($month-12),($day),$year));
            $todate = date('Y-m-d', mktime(0,0,0,($month),($day-1),$year));
        }
        

        $result = Helper::getDuration($fromdate,$todate,$duration,$restaurent_id);
        $result['data'] = array_reverse($result['data']);
      
        return $result;
        
        
    }
    
   
    
}