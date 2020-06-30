<?php
Route::group(['namespace' => 'Api'], function()
{
    Route::post('graph', 'GraphController@index')->name('graph.index');
});
?>