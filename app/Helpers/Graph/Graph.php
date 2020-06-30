<?php

namespace App\Helpers\Graph;

use DB;
use DatePeriod;
use DateTime;
use DateInterval;
use Carbon\Carbon;


/**
 * Class Auth.
 */
class Graph
{
    /**
     * Remove old session variables from admin logging in as user.
     */
    public static function getGraphCalculation($restaurent_id)
    {
        
        $queryResult = DB::table('graph_master')->where('restaurent_id',$restaurent_id)->first();
        
        $A1 = $queryResult->business_open;
        $A2 = $queryResult->weekend_busy_days;
        $A3 = $queryResult->heavy_business_weekend;
        $A4 = $queryResult->heavy_business_weekdays;
        $A5 = $queryResult->average_per_table;
        $A6 = $queryResult->waiting_times;
        $A7 = $queryResult->order_from_menu;
        $A8 = $queryResult->customer_turn_wait_time/100;
        $A9 = $queryResult->turn_the_table;
        $A10 = $queryResult->at_the_restaurent;
        $A11 = $queryResult->customer_per_table_average;
        $A12 = $queryResult->reduce_order_time/100;
        $A13 = $queryResult->reduce_churn_rate/100;
        $A14 = $queryResult->customer_adoption_per_week/100;

        $B1 = $A11 * $A10 * $A3 * 60 / $A9;
       
        $B2 = $B1 * $A2;
  
        $B3 = $A11 * $A10 * $A4 * 60 / $A9;

        $B4 = $B3 * ($A1 - $A2);

        $C1 = $B1 * $A5 / $A11;

        //$C2 =  $B1 * $A5 / ($A11 - $A7 * $A12);
        $C2 = $B1 * $A5 * $A9  / ($A11 * ($A9 - $A7 * $A12));
     
        $V1= ($C2 - $C1) * $A2;
 
        $D1 = $B3 * $A5 / $A11;
 
        //$D2 = $B3 * $A5 / ($A11 - $A7 * $A12);
        $D2 = $B3 * $A5  * $A9 / ($A11 * ($A9 - $A7 * $A12));

        $V2 = ($D2 - $D1) * ($A1 - $A2);

        $Y =  $V1 + $V2;
        
        $A8_original = $queryResult->customer_turn_wait_time;
        
        $percentage = 100-$A8_original;
        $final_percentage = $percentage/100;
      
        $W1 = $B1 * $A8 / $final_percentage * $A13 * $A2 * $A5 / $A11;
          
        $W2 = $B3 * $A8 / $final_percentage * $A13 * ($A1 - $A2) * $A5 / $A11;
        $Z = $W1 + $W2;

        $N = $Y + $Z;

        return $N;

    }

    public static function getCalculatedValue($storeId,$totalLogin){
        
        $queryResult = DB::table('graph_master')->where('restaurent_id',$storeId)->first();
        
        $A1 = $queryResult->business_open;
        $A2 = $queryResult->weekend_busy_days;
        $A3 = $queryResult->heavy_business_weekend;
        $A4 = $queryResult->heavy_business_weekdays;
        $A5 = $queryResult->average_per_table;
        $A6 = $queryResult->waiting_times;
        $A7 = $queryResult->order_from_menu;
        $A8 = $queryResult->customer_turn_wait_time/100;
        $A9 = $queryResult->turn_the_table;
        $A10 = $queryResult->at_the_restaurent;
        $A11 = $queryResult->customer_per_table_average;
        $A12 = $queryResult->reduce_order_time/100;
        $A13 = $queryResult->reduce_churn_rate/100;
        $A14 = $queryResult->customer_adoption_per_week/100; 

        $B1 = $A11 * $A10 * $A3 * 60 / $A9;
        $B2 = $B1 * $A2;
        $B3 = $A11 * $A10 * $A4 * 60 / $A9;
        $B4 = $B3 * ($A1 - $A2);

        $N = self::getGraphCalculation($storeId);
       
        $value = $totalLogin* $N / ($B2 + $B4);
        return round($value, 2);
    }

    public static function getMonthlyDate($date)
	{
		
		$time	=	strtotime($date);
        $month 	=	date("m",$time);
        $year	=	date("Y",$time);
        $day	=	date("d",$time);
        
        $fromDate =  date('Y-m-d', mktime(0,0,0,($month-1),($day),$year));
        $result['fromdate'] = $fromDate;
        $result['todate'] 	= $date;
        return $result;
	}

	public static function getDuration($fromdate,$todate,$interval,$restaurent_id)
	{

        $period = new DatePeriod(
            new DateTime($fromdate),
            new DateInterval('P1D'),
            new DateTime($todate)
        );
        foreach($period as $dateObj){
            $date = Carbon::parse($dateObj);
            $originalDates = date('Y-m-d',strtotime($date->toDateTimeString()));
            $dateArray[] = $originalDates;
            
        }
        
		if($interval == 0)
		{
		    $todate = end($dateArray);
		    $fromdate = $dateArray[0];
		    
		   	$queryResult = DB::table('graph_logic')->whereBetween('week',[$fromdate,$todate])->where('restaurent_id',$restaurent_id)->get();
			$value = 0;
			$response = array();
			$valArray = array();
			if(count($queryResult) > 0)
			{
				foreach($queryResult as $result){
					$value += $result->value_generated;
					$response['data'][] = array('key'=>$result->week,'value'=>number_format((float)$result->value_generated, 2, '.', ''));
                    $valArray[] = $result->week;
                }
                foreach($dateArray as $key => $dateVal){
                    if(!in_array($dateVal,$valArray)){
                     //   echo $dateVal."</br>";
                        $response['data'][] = array('key'=>$dateVal,'value'=>"0.00");
                    }
                }
                $columns = array_column($response['data'], 'key');
                array_multisort($columns, SORT_DESC, $response['data']);

				$response['total'] = number_format((float)$value, 2, '.', '');
				$response['Status'] = 200;
				$response['message'] = "Success";
				
			}else{
                foreach($dateArray as $key => $dateVal){
                    //if(!in_array($dateVal,$valArray)){
                        $response['data'][] = array('key'=>$dateVal,'value'=>number_format((float)0, 2, '.', ''));
                    //}
                }
                $columns = array_column($response['data'], 'key');
                array_multisort($columns, SORT_DESC, $response['data']);

				$response['total'] = number_format((float)$value, 2, '.', '');
				$response['Status'] = 200;
				$response['message'] = "Success";
			}
			//echo $value; exit;
			return $response;

		}else if($interval == 1){
            
            $todate = end($dateArray);
		    $fromdate = $dateArray[0];
		    
			$queryResult = DB::table('graph_logic')->whereBetween('week',[$fromdate,$todate])->where('restaurent_id',$restaurent_id)->get();
			$value = 0;
			$response = array();

			if(count($queryResult) > 0)
			{
				foreach($queryResult as $result){
					$value += $result->value_generated;
					$response['data'][] = array('key'=>$result->week,'value'=>number_format((float)$result->value_generated, 2, '.', ''));
                    $valArray[] = $result->week;
                }

                foreach($dateArray as $key => $dateVal){
                    if(!in_array($dateVal,$valArray)){
                        $response['data'][] = array('key'=>$dateVal,'value'=>"0.00");
                    }
                }
                $columns = array_column($response['data'], 'key');
                array_multisort($columns, SORT_DESC, $response['data']);

				$response['total'] = number_format((float)$value, 2, '.', '');
				$response['Status'] = 200;
				$response['message'] = "Success";
			}else{
                foreach($dateArray as $key => $dateVal){
                    //if(!in_array($dateVal,$valArray)){
                        $response['data'][] = array('key'=>$dateVal,'value'=>number_format((float)0, 2, '.', ''));
                    //}
                }
                $columns = array_column($response['data'], 'key');
                array_multisort($columns, SORT_DESC, $response['data']);

				$response['total'] = number_format((float)$value, 2, '.', '');
				$response['Status'] = 200;
				$response['message'] = "Success";
			}
			
			return $response;

		}else if($interval == 2){

			return self::getMonthlyCalculation($fromdate,$todate,$restaurent_id);
			
		}else if($interval == 3){
			return self::getMonthlyCalculation($fromdate,$todate,$restaurent_id);
		}
	}
	
	public static function getMonthlyCalculation($fromdate,$todate,$restaurent_id)
	{
	    
			$d1 = strtotime($fromdate);
			$d2 = strtotime($todate);
			$min_date = min($d1, $d2);
			$max_date = max($d1, $d2);
			$i = 0;
			while (($min_date = strtotime("+1 MONTH", $min_date)) <= $max_date) {
			    $i++;
			    $result[] = self::getMonthlyDate(date('Y-m-d',strtotime("-1 day",$min_date)));
			}
			$result[] = self::getMonthlyDate($todate);    	
			$response = array();
			$value = 0;
			$result = array_reverse($result);
            
			foreach($result as $raw)
			{
				$fromMonth = date("d-M-Y",strtotime('+1 day',strtotime($raw['fromdate'])));
				$toMonth = date("d-M-Y",strtotime($raw['todate']));
				$queryResult = DB::table('graph_logic')->whereBetween('week',[$raw['fromdate'],$raw['todate']])->where('restaurent_id',$restaurent_id)->get();
				if(count($queryResult) > 0){
                    $totalValue = 0;
					foreach($queryResult as $results){
						$value += $results->value_generated;
						$totalValue += $results->value_generated;
					}
					$response['data'][] = array('key'=>$fromMonth.' to '.$toMonth,'value'=>number_format((float)$totalValue, 2, '.', ''));
				}else{
                    $response['data'][] = array('key'=>$fromMonth.' to '.$toMonth,'value'=>number_format((float)0, 2, '.', ''));
                }
				
			}
			$response['total'] = number_format((float)$value, 2, '.', '');
			$response['status'] = 200;
			$response['message'] = "Success";
			return $response;

	}
	
	public static function addGraphLogic($storeId)
    {
        //$queryMasterResult  = DB::table('graph_master')->where('restaurent_id',$storeId)->first();
        
        
        $queryResult  = DB::table('graph_logic')->where('week',date('Y-m-d'))->where('restaurent_id',$storeId)->first();
     
       if(isset($queryResult->id)){
            $value = self::getCalculatedValue($storeId,$queryResult->total_logins);
       } else {
           $value = self::getCalculatedValue($storeId,1);
       }
     
        if(!isset($queryResult->id)){

            $array = array("restaurent_id"=>$storeId,"week"=>date('Y/m/d'),"total_logins"=>1,"value_generated"=>$value);
            $queryInsert = DB::table('graph_logic')->insert($array);
        }
        else
        {
            $totalLogins = $queryResult->total_logins + 1;
            $updateData = array("total_logins"=>$totalLogins,"value_generated"=>$value);
            $queryUpdate = DB::table('graph_logic')
                            ->where('id', $queryResult->id)
                            ->update($updateData);
        }
        return true;
 
    }
}
