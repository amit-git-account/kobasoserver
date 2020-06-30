<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use DB;
use Illuminate\Support\Facades\Log;
use App\Repositories\Queue\EloquentQueueRepository;
use App\Models\QueueMember\QueueMember;


class removeUserCron extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'removeUserCron:cron';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct(EloquentQueueRepository $repository)
    {
        parent::__construct();
        $this->repository = $repository;
    }

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
        
    	$currentDate = date('Y-m-d h:m:s');
        $queryResultMembers = DB::table('data_queue_members')->where('is_active',1)->get();
        foreach($queryResultMembers as $resultMembers){
            $userJoin_date = $resultMembers->created_at;
            $hourdiff = round((strtotime($currentDate) - strtotime($userJoin_date))/3600, 1);
            if($hourdiff >= 6){
                $this->repository->removeQueueMember($resultMembers->queue_id, $resultMembers->user_id);
                DB::table('data_queue_members')->where('id', '=', $resultMembers->id)->delete();
            
            }
        }

        $queueResult = DB::table('data_queues')->where('is_active',1)->get();
        foreach($queueResult as $resultData){
            $queueDate = $resultData->created_at;
            $currentDate = date('Y-m-d h:m:s');
    
            $hourdiff = round((strtotime($currentDate) - strtotime($queueDate))/3600, 1);
            if($hourdiff >= 6){
                DB::table('data_queues')->where('id', '=', $resultData->id)->delete();
       
            }
        }

        $orderResult = DB::table('data_orders')->where('status',0)->get();
        foreach($orderResult as $orderData){
            $orderDate = $orderData->created_at;
    
            $hourdiff = round((strtotime($currentDate) - strtotime($orderDate))/3600, 1);
            if($hourdiff >= 6){
                DB::table('data_order_details')->where('order_id', '=', $orderData->id)->delete();
                DB::table('data_orders')->where('id', '=', $orderData->id)->delete();
            }
        }
    }
}
