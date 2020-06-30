<?php namespace App\Repositories\Queue;

/**
 * Class EloquentQueueRepository
 *
 * @author Anuj Jaha ( er.anujjaha@gmail.com)
 */

use App\Models\Queue\Queue;
use App\Repositories\DbRepository;
use App\Exceptions\GeneralException;
use App\Models\Store\Store;
use App\Models\Access\User\User;
use App\Models\QueueMember\QueueMember;
use Kreait\Firebase;
use Kreait\Firebase\Factory;
use Kreait\Firebase\ServiceAccount;
use Kreait\Firebase\Database;
use DB;
use Helper;

use Carbon\Carbon;

class EloquentQueueRepository extends DbRepository
{
    /**
     * Queue Model
     *
     * @var Object
     */
    public $model;

    /**
     * Queue Title
     *
     * @var string
     */
    public $moduleTitle = 'Queue';

    /**
     * Table Headers
     *
     * @var array
     */
    public $tableHeaders = [
        'id'        => 'Id',
'user_id'        => 'User_id',
'store_id'        => 'Store_id',
'title'        => 'Title',
'description'        => 'Description',
'qdate'        => 'Qdate',
'is_active'        => 'Is_active',
'created_at'        => 'Created_at',
'updated_at'        => 'Updated_at',
"actions"         => "Actions"
    ];

    /**
     * Table Columns
     *
     * @var array
     */
    public $tableColumns = [
        'id' =>   [
                'data'          => 'id',
                'name'          => 'id',
                'searchable'    => true,
                'sortable'      => true
            ],
        'user_id' =>   [
                'data'          => 'user_id',
                'name'          => 'user_id',
                'searchable'    => true,
                'sortable'      => true
            ],
        'store_id' =>   [
                'data'          => 'store_id',
                'name'          => 'store_id',
                'searchable'    => true,
                'sortable'      => true
            ],
        'title' =>   [
                'data'          => 'title',
                'name'          => 'title',
                'searchable'    => true,
                'sortable'      => true
            ],
        'description' =>   [
                'data'          => 'description',
                'name'          => 'description',
                'searchable'    => true,
                'sortable'      => true
            ],
        'qdate' =>   [
                'data'          => 'qdate',
                'name'          => 'qdate',
                'searchable'    => true,
                'sortable'      => true
            ],
        'is_active' =>   [
                'data'          => 'is_active',
                'name'          => 'is_active',
                'searchable'    => true,
                'sortable'      => true
            ],
        'created_at' =>   [
                'data'          => 'created_at',
                'name'          => 'created_at',
                'searchable'    => true,
                'sortable'      => true
            ],
        'updated_at' =>   [
                'data'          => 'updated_at',
                'name'          => 'updated_at',
                'searchable'    => true,
                'sortable'      => true
            ],
        'actions' => [
            'data'          => 'actions',
            'name'          => 'actions',
            'searchable'    => false,
            'sortable'      => false
        ]
    ];

    /**
     * Is Admin
     *
     * @var boolean
     */
    protected $isAdmin = false;

    /**
     * Admin Route Prefix
     *
     * @var string
     */
    public $adminRoutePrefix = 'admin';

    /**
     * Client Route Prefix
     *
     * @var string
     */
    public $clientRoutePrefix = 'frontend';

    /**
     * Admin View Prefix
     *
     * @var string
     */
    public $adminViewPrefix = 'backend';

    /**
     * Client View Prefix
     *
     * @var string
     */
    public $clientViewPrefix = 'frontend';

    /**
     * Module Routes
     *
     * @var array
     */
    public $moduleRoutes = [
        'listRoute'     => 'queue.index',
        'createRoute'   => 'queue.create',
        'storeRoute'    => 'queue.store',
        'editRoute'     => 'queue.edit',
        'updateRoute'   => 'queue.update',
        'deleteRoute'   => 'queue.destroy',
        'dataRoute'     => 'queue.get-list-data'
    ];

    /**
     * Module Views
     *
     * @var array
     */
    public $moduleViews = [
        'listView'      => 'queue.index',
        'createView'    => 'queue.create',
        'editView'      => 'queue.edit',
        'deleteView'    => 'queue.destroy',
    ];

    /**
     * Construct
     *
     */
    public function __construct()
    {
        $this->model = new Queue;
    }

    /**
     * Create Queue
     *
     * @param array $input
     * @return mixed
     */
    public function create($input)
    {
        //$date  = date("Y-m-d", strtotime($input['today']));
        $queue = $this->getTodayQueue($input['enterprise_id']);
        $store = Store::where('id', $input['enterprise_id'])->first();

        if(isset($queue) && isset($queue->id))
        {
            $status = $this->validateMember($queue, $input['user_id']);

            if($status)
            {
                $this->addQueueMember($queue, $input);
                return $queue;
            }

            return false;
        }
        else
        {   
            if(isset($store) && isset($store->id))
            {
                $queue = $this->model->create([
                    'user_id'       => access()->user()->id,
                    'store_id'      => $input['enterprise_id'],
                    'title'         => $store->title . ' Queue',
                    'qdate'         => date('Y-m-d')
                ]);

                $this->addQueueMember($queue, $input);

                return $queue;
            }
        }
        
        return false;
    }

    /**
     * Validate Member
     *
     * @param object $queue
     * @param int $userId
     * @return bool|int|mixed
     */
    public function validateMember($queue, $userId = null)
    {
        $count = QueueMember::where([
            'queue_id' => $queue->id,
            'user_id'  => $userId 
        ])
        ->where('processed_at', null)
        ->count();

        if($count > 0 )
        {
            return false;
        }

        return true;
    }

    /**
     * Add Queue Member
     *
     * @param object $queue
     * @param array $input
     * @return bool|int|mixed
     */
    public function addQueueMember($queue = null, $input)
    {
        if($queue)
        {
            $storeId     = isset($input['enterprise_id']) ? $input['enterprise_id'] : $input['store_id'];
            $queueNumber = access()->getQueueNumber($storeId, $queue->qdate);
            $queueMember = [
                'queue_id'      => $queue->id,
                'store_id'      => $storeId,
                'user_id'       => $input['user_id'],
                'queue_number'  => $queueNumber,
                'member_count'  => $input['member_count'],
                'user_name'     => isset($input['name']) ? $input['name'] : null,
                'description'   => 'Join Queue at ' . $queueNumber
            ];

            $object = (object) $queueMember;
            Helper::addGraphLogic($storeId);
            $this->updateRealTimeDatabase($object);
            return QueueMember::create($queueMember);
        }
    }

    /**
     * Update Queue
     *
     * @param int $id
     * @param array $input
     * @return bool|int|mixed
     */
    public function update($id, $input)
    {
        $model = $this->model->find($id);

        if($model)
        {
            $input = $this->prepareInputData($input);

            return $model->update($input);
        }

        return false;
    }

    /**
     * Destroy Queue
     *
     * @param int $id
     * @return mixed
     * @throws GeneralException
     */
    public function destroy($id)
    {
        $model = $this->model->find($id);

        if($model)
        {
            return $model->delete();
        }

        return  false;
    }

    /**
     * Get All
     *
     * @param string $orderBy
     * @param string $sort
     * @return mixed
     */
    public function getAll($orderBy = 'id', $sort = 'asc')
    {
        return $this->model->orderBy($orderBy, $sort)->get();
    }

    /**
     * Get by Id
     *
     * @param int $id
     * @return mixed
     */
    public function getById($id = null)
    {
        if($id)
        {
            return $this->model->find($id);
        }

        return false;
    }

    /**
     * Get Table Fields
     *
     * @return array
     */
    public function getTableFields()
    {
        return [
            $this->model->getTable().'.*'
        ];
    }

    /**
     * @return mixed
     */
    public function getForDataTable()
    {
        return $this->model->select($this->getTableFields())->get();
    }

    /**
     * Set Admin
     *
     * @param boolean $isAdmin [description]
     */
    public function setAdmin($isAdmin = false)
    {
        $this->isAdmin = $isAdmin;

        return $this;
    }

    /**
     * Prepare Input Data
     *
     * @param array $input
     * @param bool $isCreate
     * @return array
     */
    public function prepareInputData($input = array(), $isCreate = false)
    {
        if($isCreate)
        {
            $input = array_merge($input, ['user_id' => access()->user()->id]);
        }

        return $input;
    }

    /**
     * Get Table Headers
     *
     * @return string
     */
    public function getTableHeaders()
    {
        if($this->isAdmin)
        {
            return json_encode($this->setTableStructure($this->tableHeaders));
        }

        $clientHeaders = $this->tableHeaders;

        unset($clientHeaders['username']);

        return json_encode($this->setTableStructure($clientHeaders));
    }

    /**
     * Get Table Columns
     *
     * @return string
     */
    public function getTableColumns()
    {
        if($this->isAdmin)
        {
            return json_encode($this->setTableStructure($this->tableColumns));
        }

        $clientColumns = $this->tableColumns;

        unset($clientColumns['username']);

        return json_encode($this->setTableStructure($clientColumns));
    }

    /**
     * Get Today Queue
     *
     * @param int storeId
     * @return date date
     * @return object
     */
    public function getTodayQueue($storeId = null, $date = null)
    {
        if($storeId)
        {
            $queue = $this->model->with('members')->where([
                'store_id'  => $storeId
            ])->first();
        }


        if(!isset($queue) && !isset($queue->id))
        {
            $queue = $this->model->create([
                'user_id' => access()->user()->id,
                'store_id'  => $storeId,
                'title'     => 'New Queue Created',
                'qdate'     => date('Y-m-d')
            ]);
        }
        
        return $queue;
    }

    /**
     * Get Queue with Members
     *
     * @param int storeId
     * @return date date
     * @return object
     */
    public function getQueueWithMembers($storeId = null, $date = null)
    {
        if($storeId)
        {
            return $this->model->with(['members', 'members.user'])->where([
                'store_id'  => $storeId
            ])->first();
        }

        return [];
    }    

    /**
     * Remove Queue Member
     *
     * @param int queueId
     * @param int storeId
     * @return bool
     */
    public function removeQueueMember($queueId = null, $userId = null)
    {
        
        if($queueId && $userId)
        {
            $queueMember = QueueMember::where([
                'queue_id'  => $queueId,
                'user_id'   => $userId
            ])->first();
        
            if(isset($queueMember) && isset($queueMember->id))
            {
                if(isset($queueMember->processed_at))   
                {
                    $serviceAccount = ServiceAccount::fromJsonFile(__DIR__.'/kobaso-800f8-firebase-adminsdk-2t25j-abe244c5f2.json');
                    $firebase = (new Factory)
                        ->withServiceAccount($serviceAccount)
                        ->withDatabaseUri('https://kobaso-800f8.firebaseio.com/')
                        ->create();
                    $reference = 'User_Queue/'.$userId;    
                    $database = $firebase->getDatabase();
                    $database->getReference($reference)->remove();
                    $queueMember->delete();
                   
                    return true;
                }
                $serviceAccount = ServiceAccount::fromJsonFile(__DIR__.'/kobaso-800f8-firebase-adminsdk-2t25j-abe244c5f2.json');
                $reference = 'User_Queue/'.$userId;    
                $firebase = (new Factory)
                    ->withServiceAccount($serviceAccount)
                    ->withDatabaseUri('https://kobaso-800f8.firebaseio.com/')
                    ->create();
                $database = $firebase->getDatabase();
                $database->getReference($reference)->remove();
                $this->shuffleQueue($queueMember);
                $queueMember->delete();
            }
        }

        return true;
    }

    /**
     * Shuffle Queue
     *
     * @param object queueMember
     * @return bool
     */
    public function shuffleQueue($queueMember)
    {
        $queueMembers = QueueMember::where([
            'queue_id'  => $queueMember->queue_id,
        ])
        ->where('id', '>', $queueMember->id)
        ->get();   
        
        if(isset($queueMembers))
        {
            foreach($queueMembers as $qMember)
            {

                if($qMember->processed_at == null)
                {
                    
                    $qMember->queue_number = $qMember->queue_number - 1;
                    $qMember->save();
                    $this->updateRealTimeDatabase($qMember);
                }

            }
        }

        return true;
    }

    /**
     * Process Queue Member
     *
     * @param int queueId
     * @param int storeId
     * @return bool
     */
    public function processQueueMember($queueId = null, $userId = null)
    {
        if($queueId && $userId)
        {
            $queueMember = QueueMember::where([
                'queue_id'  => $queueId,
                'user_id'   => $userId
            ])->first();

            if(isset($queueMember) && isset($queueMember->id))
            {
                if(!isset($queueMember->processed_at))   
                {
                    $status = $this->processMember($queueMember);

                    if($status)
                    {
                        $this->shuffleQueue($queueMember);
                    }
                }
            }
        }

        return true;       
    }

    /**
     * Process Member
     *
     * @param int queueId
     * @param int storeId
     * @return bool
     */
    public function processMember($queueMember)
    {
        $queueMember->processed_at      = date('Y-m-d H:i:s');
        $queueMember->processed_number  = $queueMember->queue_number;
        $queueMember->queue_number      = 0;
        $queueMember->description       = 'Processed at ' . date('Y-m-d H:i:s');
        return $queueMember->save();
    }

    public function createByStore($input = array())
    {
        $storeId    = $input['enterprise_id'];
        $queue      = $this->getTodayQueue($input['enterprise_id']);
        $queueData  = [];

        $member = $this->getMemberByPhone($input);
        $queueData = [
            'store_id'      => $storeId,
            'user_id'       => $member->id,
            'member_count'  => $input['member_count'],
            'user_name'     => isset($input['name']) ? $input['name'] : $member->name
        ];
        $this->addQueueMember($queue, $queueData);

        return $queue;
    }

    public function getMemberByPhone($input = array())
    {
        if(isset($input['phone']) && isset($input['country_code']))
        {
            $user = User::where([
                'phone'         => $input['phone'],
                'country_code'  => $input['country_code']
            ])->first();

            if(isset($user) && isset($user->id))
            {
                return $user;
            }

            $user = User::create([
                'name'          => $input['name'],
                'phone'         => $input['phone'],
                'country_code'  => $input['country_code'],
                'email'         => $input['phone'] . '@yopmail.com',
                'password'      => bcrypt($input['phone']),
                'status'        => 1,
                'confirmed'     => 1,
                'age'           => 18,
                'user_type'     => 0
            ]);

            return $user;
        }

        return false;
    }


    public function updateRealTimeDatabase($qMember)
    {
        //echo "<pre>"; print_r($qMember->store_id); exit;
        $reference = 'User_Queue/'.$qMember->user_id;
        $serviceAccount = ServiceAccount::fromJsonFile(__DIR__.'/kobaso-800f8-firebase-adminsdk-2t25j-abe244c5f2.json');
        $firebase = (new Factory)
        ->withServiceAccount($serviceAccount)
        ->withDatabaseUri('https://kobaso-800f8.firebaseio.com/')
        ->create();
        $database = $firebase->getDatabase();
        
        $query = DB::table('data_enterprise_detail')->where('id',$qMember->store_id)->first();
        $newPost = $database
        ->getReference($reference)
        ->set([
            'enterprise_id' => $query->id,
            'enterprise_name' => $query->title,
            'queue_id' => $qMember->queue_number,
            'user_id' => $qMember->user_id,
        ]);
        return true;
    }
    
    public function updateQueueMember($input = array())
    {
        $member = QueueMember::where([
            'user_id' => $input['user_id'],
            'store_id' => $input['enterprise_id'],
            'queue_id' => $input['queue_id']
        ])->first();
        
        if(isset($member) && isset($member->id))
        {
            $member->user_name = $input['name'];
            $member->member_count = $input['member_count'];
            
            $member->save();
                
            if(isset($input['user_id']))
            {
                $user = User::where('id', $input['user_id'])->first();    
                    
                if(isset($input['phone']))
                {
                    $user->phone = $input['phone'];    
                }
                
                $user->country_code = $input['country_code'];
                
                $user->save();
            }
            
            
            $member->user_name = $input['name'];
            
        }
        return true;
    }
}