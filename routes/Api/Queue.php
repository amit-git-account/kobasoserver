<?php
Route::group(['namespace' => 'Api'], function()
{
    Route::any('queue', 'APIQueueController@index')->name('queue.index');
    Route::post('queue/create', 'APIQueueController@create')->name('queue.create');
    Route::post('queue/create-by-store', 'APIQueueController@createByStore')->name('queue.create-by-store');
    Route::post('queue/edit', 'APIQueueController@edit')->name('queue.edit');
    Route::post('queue/show', 'APIQueueController@show')->name('queue.show');
    Route::post('queue/delete', 'APIQueueController@delete')->name('queue.delete');
    Route::post('queue/remove-member', 'APIQueueController@removeMember')->name('queue.remove-member');
    Route::post('queue/process-member', 'APIQueueController@processMember')->name('queue.process-member');

    Route::post('queue/my-position', 'APIQueueController@getMyQueue')->name('queue.get-my-queue');
    
    Route::post('queue/update-member', 'APIQueueController@updateMember')->name('queue.update-member');
});
?>