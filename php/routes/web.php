<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It is a breeze. Simply tell Lumen the URIs it should respond to
| and give it the Closure to call when that URI is requested.
|
*/

$router->get('/hello/{name}', function ($name){
    return "Hello $name !";
});
$router->get('/', function(){
	require("../app/Http/Controllers/requires.php");
	$user = User::createFromId("beflgn735kjpamcrcn0plc95h4");
	$str = array("phrase" => "Bonjour Batman, votre voiture a un poids de ".$user->poids."kg et va à ".$user->vitesse." km/h");
	return json_encode($str);
});
