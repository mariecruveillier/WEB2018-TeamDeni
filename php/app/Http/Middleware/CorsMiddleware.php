<?php namespace App\Http\Middleware;
class CorsMiddleware {

  public function handle($request, \Closure $next)
  {

    if($request->isMethod('OPTIONS')) {
    			$response = response('', 200);
    		} else {
    			// Pass the request to the next middleware
    			$response = $next($request);
    		}

    $response->header('Access-Control-Allow-Methods', 'HEAD, GET, POST, PUT, PATCH, DELETE, OPTIONS');
    $response->header('Access-Control-Allow-Headers', $request->header('Access-Control-Request-Headers'));
    $response->header('Access-Control-Allow-Origin', '*');
    return $response;
  }

}
