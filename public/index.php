<?php

use Framework\View;
use Framework\Alert;
use Framework\Config;
use Framework\Request;
use Framework\Database;

// localize timezone and dates
setlocale(LC_TIME, "es_ES", 'Spanish_Spain', 'Spanish');
date_default_timezone_set('America/Havana');

// do not let E_NOTICE break the flow
error_reporting(E_ALL ^ E_NOTICE);

// get page and action from the url
$controller = isset($_GET['c']) ? strtolower($_GET['c']) : "index";
$action = isset($_GET['a']) ? strtolower($_GET['a']) : "main";
$error = isset($_GET['error']) ? strtolower($_GET['error']) : false;

// get global
define('HTTP_BASE_PATH', $_SERVER['REQUEST_SCHEME'] . '://' . $_SERVER['HTTP_HOST']);
define('HTTP_FULL_PATH', HTTP_BASE_PATH . $_SERVER['REQUEST_URI']);
define('BASE_PATH', dirname(__DIR__) . DIRECTORY_SEPARATOR);
define('APP_PATH', BASE_PATH . 'app/');
define('TEMP_PATH', BASE_PATH . 'tmp/');

// show 404 error
if (!file_exists(APP_PATH . "controllers/$controller.php")) {
	$controller = "404";
	$action = "main";
}

// add the autoload
include BASE_PATH . "vendor/autoload.php";

// true if the system is in production
define('IS_PRODUCTION', Config::pick('general')['tier'] == "production");

// start the session
session_start();

// create default session for the filters
if(empty($_SESSION)) {
	$_SESSION['date_from'] = date('Y-m-d', strtotime('-7 days'));
	$_SESSION['date_to'] = date('Y-m-d');
	$_SESSION['category'] = "";
	$_SESSION['type'] = "";
	$_SESSION['flags'] = "";
}

// get the global list of categories
$categoriesList = Database::queryCache("SELECT * FROM _empleos_categories");
foreach ($categoriesList as $item) {
	$globalCategories[$item->code] = $item->description;
}

try {
	// create a new Controller
	include APP_PATH . "controllers/$controller.php";
	$page = new Controller();

	// check if the action exists on the controller
	if (!method_exists($page, $action)) {
		$action = 'main';
	}

	// add a new view
	$page->view = new View($controller, $action);

	// add router params
	$page->view->router = (Object) [
		"controller" => $controller,
		"action" => $action
	];

	// add error code, if exist
	$page->view->error = $error;

	// inject global variables
	$page->view->categories = $globalCategories;

	// add an input handler
	$page->request = new Request();

	// run the controller
	$page->$action();

	// render the view
	$page->view->render();
}
catch (Exception $e) {
	if(IS_PRODUCTION) {
		echo "Lo siento, hemos encontrado un error y ya avisamos al equipo técnico. Por favor vuelva a entrar en unas horas o escríbanos a ayuda@apretaste.org";
	} else {
		echo '<code><pre>' . print_r($e, true) . '</pre></code>';
	}
	exit;
}
