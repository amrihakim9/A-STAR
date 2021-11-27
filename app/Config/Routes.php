<?php

namespace Config;

// Create a new instance of our RouteCollection class.
$routes = Services::routes();

// Load the system's routing file first, so that the app and ENVIRONMENT
// can override as needed.
if (file_exists(SYSTEMPATH . 'Config/Routes.php')) {
    require SYSTEMPATH . 'Config/Routes.php';
}

/*
 * --------------------------------------------------------------------
 * Router Setup
 * --------------------------------------------------------------------
 */
$routes->setDefaultNamespace('App\Controllers');
$routes->setDefaultController('HomeController');
$routes->setDefaultMethod('index');
$routes->setTranslateURIDashes(false);
$routes->set404Override();
$routes->setAutoRoute(true);

/*
 * --------------------------------------------------------------------
 * Route Definitions
 * --------------------------------------------------------------------
 */

// We get a performance increase by specifying the default
// route since we don't have to scan directories.
$routes->get('/', 'Front\HomeController');
$routes->get('/home', 'Front\HomeController');
$routes->get('/amal-usaha', 'Front\AmalUsahaController');
$routes->get('/amal-usaha/(:num)', 'Front\AmalUsahaController::show/$1');
$routes->get('/amal-usaha/j/(:any)', 'Front\AmalUsahaController::indexByJenisUsaha/$1');
$routes->get('/logout', 'Auth\LogoutController::index');
$routes->get('/rute', 'Front\RouteController::index');
$routes->post('/rute/path', 'Front\RouteController::getShortestPath');

$routes->group('login', function ($routes) {
    $routes->resource('', ['controller' => 'Auth\LoginController', 'only' => ['index', 'create']]);
});
$routes->group('/pcm', ['filter' => 'authFilter'], function ($routes) {
    $routes->resource('dashboard', ['controller' => 'Petugas\DashboardController', 'only' => 'index']);
    $routes->get('amal-usaha/j/(:any)', 'Petugas\AmalUsahaController::indexByJenisUsaha/$1');
    $routes->resource('amal-usaha', ['controller' => 'Petugas\AmalUsahaController']);
    $routes->resource('jenis-usaha', ['controller' => 'Petugas\JenisUsahaController']);
});

$routes->group('/pdm', ['filter' => 'authFilter'], function ($routes) {
    $routes->resource('dashboard', ['controller' => 'Petugas\DashboardController', 'only' => 'index']);
    $routes->resource('amal-usaha', ['controller' => 'Petugas\Usaha']);
    $routes->resource('jenis-usaha', ['controller' => 'Petugas\JenisUsahaController']);
});

$routes->group('admin', ['filter' => 'authFilter'], function ($routes) {
    $routes->resource('dashboard', ['controller' => 'Admin\DashboardController', 'only' => 'index']);
    $routes->group('master', function ($routes) {
        $routes->resource('node', ['controller' => 'Admin\NodeController']);
        $routes->resource('graph', ['controller' => 'Admin\GraphController']);
    });
    $routes->resource('user', ['controller' => 'Admin\UserController']);
});



/*
 * --------------------------------------------------------------------
 * Additional Routing
 * --------------------------------------------------------------------
 *
 * There will often be times that you need additional routing and you
 * need it to be able to override any defaults in this file. Environment
 * based routes is one such time. require() additional route files here
 * to make that happen.
 *
 * You will have access to the $routes object within that file without
 * needing to reload it.
 */

if (file_exists(APPPATH . 'Config/' . ENVIRONMENT . '/Routes.php')) {
    require APPPATH . 'Config/' . ENVIRONMENT . '/Routes.php';
}
